{% set currency = [('EUR',5),('USD',40),('GBP',45)] %}

select
    product,
    price_RUB,
    {% for item in currency -%}
        price_RUB*{{item[1]}} as price_{{item[0]}}{% if not loop.last %},{% endif %}
    {% endfor %}
from prices
