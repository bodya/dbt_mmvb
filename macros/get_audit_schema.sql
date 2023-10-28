{% macro get_audit_schema() %}

   {{ return('dbt_log_meta') }}

{% endmacro %}