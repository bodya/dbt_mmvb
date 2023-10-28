--{{config(materialized='table')}}
{{config(schema='staging')}}
select
    *,
    {{ my_macro_cast('price') }},
    {{ price_to_strike('price',95000,'Call') }} as call_price,
    {{ price_to_strike('price',95000,'Put') }} as put_price
from
    {{ source('mmvb', 'q_unface_option') }}
where
    emit_code like 'Si095000%'