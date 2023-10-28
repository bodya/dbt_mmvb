{% macro my_macro_cast(column_name) %}
cast({{ column_name }} as varchar) as {{ column_name }}_var
{% endmacro %}