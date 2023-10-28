{% set tables = ['table1','table2','table3'] %}

{% for table in tables %}
    select * from {{table}}
    {% if not loop.last %}
        union all
    {% endif %}
{% endfor %}