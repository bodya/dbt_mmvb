{% snapshot option_history_snapshot %}

{{
    config(
        target_schema='public',
        unique_key='number',

        strategy='timestamp',
        updated_at='time',
    )
}}
select
    *
from
    {{ ref('unface_option') }}

{% endsnapshot %}