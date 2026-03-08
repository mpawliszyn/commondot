#!/usr/bin/env bash
set -euo pipefail

# Pre-commit hook: scans staged file content against .private-patterns
# to prevent accidental commits of secrets or employer-specific content.
# Do NOT bypass with --no-verify. If it fires, review the match.

PATTERNS_FILE="$(git rev-parse --show-toplevel)/.private-patterns"

if [[ ! -f "$PATTERNS_FILE" ]]; then
    echo "Warning: .private-patterns not found, skipping content scan"
    exit 0
fi

# Read patterns, skip comments and blank lines
patterns=()
while IFS= read -r line; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    patterns+=("$line")
done < "$PATTERNS_FILE"

if [[ ${#patterns[@]} -eq 0 ]]; then
    exit 0
fi

# Build combined regex
regex=$(IFS='|'; echo "${patterns[*]}")

# Scan only added lines in staged changes (skip removed lines and diff headers)
matches=$(git diff --cached --diff-filter=ACM -U0 | grep '^+' | grep -v '^+++' | grep -iE "$regex" || true)

if [[ -n "$matches" ]]; then
    echo "Pre-commit hook: potential private content detected!"
    echo ""
    echo "Matched lines:"
    echo "$matches"
    echo ""
    echo "Review .private-patterns and adjust if this is a false positive."
    echo "Do NOT use --no-verify to bypass this check."
    exit 1
fi

exit 0
