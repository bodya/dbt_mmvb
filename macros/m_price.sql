{% macro price_to_strike(price, strike, type_option) %}
    {% if type_option == 'Call' %}
        {{ strike }}+{{ price }}
    {% elif type_option == 'Put' %}
        {{ strike }}-{{ price }}
    {% endif %}
{% endmacro %}