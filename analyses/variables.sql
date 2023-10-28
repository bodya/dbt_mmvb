{% set my_var = "Hello, World!" %}
{% set is_dev = true %}
select "{{my_var}}" as greeting,
{% if is_dev %}
2000
{% else %}
{{ var('my_global_var')}}
{% endif %} as curr_year