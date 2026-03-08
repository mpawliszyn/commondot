set feedback off
set heading off

set pagesize 5000
set linesize 5000
set trim on
set trimspool on
set wrap on
set serveroutput on size 1000000

alter session set NLS_DATE_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
set numformat 99999999999.99

def _editor = 'vi'

-- prompt
undefine usr db
col usr new_value usr
col db  new_value db

set termout off
select upper(user) usr,
       upper(sys_context('userenv','db_name')) db
from dual
/
set termout on

set sqlprompt '&&usr.@&&db.> '


set feedback on
set heading on
set timing on

