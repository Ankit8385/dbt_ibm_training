{% test order_values(model, column_name, val) %}

select * from {{model}} where {{column_name}} <= {{ val }}

{% endtest %}