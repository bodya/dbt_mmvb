--{{config(materialized='table')}}
{{config(schema='test_schema')}}
select
    {{ dbt_utils.star(source('mmvb', 'q_unface_option'), except=['number','moex_class']) }}
from
    {{ source('mmvb', 'q_unface_option') }}
where
    emit_code like 'Si096000%'