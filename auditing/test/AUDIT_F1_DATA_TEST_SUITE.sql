-- Setup default audit policies for logon, system objects , dba stuff
audit policy ora_logon_failures;
audit policy ora_secureconfig;
audit policy ora_database_parameter;
audit policy ora_account_mgmt;

-- audit all logon,logoff , failed logons and alter sessions
set serveroutput on
begin
  dbaudit_logik.audit_maintenance_pkg.create_audit_logon_logoff_policy;
end;
/

-- Create Role for F1_DATA if not already exists
set serveroutput on 
begin
  dbaudit_logik.audit_maintenance_pkg.create_role('f1_data');
end;
/

-- Check that role exists
select *
from table(dbaudit_logik.audit_maintenance_pkg.get_objects_granted_to_role
             (
               p_in_role_name => 'F1_DATA_FORVALT_ROLE'
             ));



-- Checking roles that are not oracle maintained
select *
from dba_roles
where oracle_maintained = 'N'
order by role asc;

-- Create AUDIT policy for the role and activate it
--drop audit policy audit_f1_data_forvalt_role_policy;<

set serveroutput on
begin
     dbaudit_logik.audit_maintenance_pkg.create_policy_for_role
                            (
                              p_in_role_name => 'F1_DATA_FORVALT_ROLE'
                            );
end;
/


-- Find all unique policies

select distinct policy_name as antal
from audit_unified_policies
order by policy_name;

-- Check objects used in a policy
select policy_name
      ,audit_option
      ,audit_option_type
      ,object_schema
      ,object_name
      ,object_type
from audit_unified_policies
where policy_name = 'AUDIT_F1_DATA_FORVALT_ROLE_POLICY'
order by 1;


