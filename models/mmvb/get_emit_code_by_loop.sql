{% set emitent %}

select
    distinct
    emit_code,
    direction
from {{ ref('unface_option') }}
{% endset %}

{# Выполнение запроса #}
{% set result = run_query(emitent) %}

{# если запускаем run #}
{% if execute %}
    {% set result_list = zip(result.columns[0].values(),
                            result.columns[1].values())%}
{% else %}
    {# если просто компилируем, то передаем пустой массив #}
    {% set result_list = [] %}
{% endif %}

select
    direction,
    {% for emitent in result_list -%}
        sum(case when emit_code = '{{ emitent[0] }}' and
            direction = '{{ emitent[1] }}' then count else 0 end) as cnt_{{ emitent[1] }}_{{ emitent[0] }},
    {% endfor -%}
    sum(count) as total_cnt
from {{ ref('unface_option') }}
group by direction
order by direction asc

