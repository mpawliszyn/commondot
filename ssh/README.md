# SSH Configuration

## 1Password SSH Agent

SSH keys are managed by 1Password. The SSH config sets `IdentityAgent`
to the 1Password agent socket.

### Setup (not automated -- requires 1Password UI)

1. Install 1Password desktop app
2. Enable the SSH agent: 1Password > Settings > Developer > SSH Agent
3. Add your SSH key(s) in 1Password
4. Verify: `ssh -T git@github.com` should authenticate

### How it works

The `IdentityAgent` in `ssh/config` points to the 1Password socket:

```
~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock
```

On Linux, the socket path differs. See
[1Password docs](https://developer.1password.com/docs/ssh/get-started/#step-4-configure-your-ssh-or-git-client)
for the correct path and update `ssh/config` accordingly.

### Connection multiplexing

`ControlMaster auto` reuses SSH connections, reducing authentication
overhead for repeated connections to the same host. Sockets are stored
in `~/.ssh/sockets/` (created by bootstrap.sh).
