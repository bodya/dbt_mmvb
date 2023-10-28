--{{config(materialized='table')}}
select
    *
from
    {{ source('mmvb', 'q_current_trades_options') }}
where
    emit_code = 'GZ17250BF4'