view: dynamic_sql {
  derived_table: {
sql:

-- LIQUID SCRIPT TAKES USER INPUT FROM A FILTER ON WHICH COUNTERS TO INCLUDE IN THE QUERY
{% assign user_input = _filters['dynamic_sql.select_counters'] | split: "," %}

-- FOR EACH COUNTER SELECTED, SQL SUMS THAT COUNTER AND CREATES A "NAME" COLUMN WITH THE NAME OF THE COUNTER.
{% for counter_name in user_input %}
  SELECT order_items_created_date, SUM({{ counter_name | remove: '"' }}) AS `COUNTER`, '{{ counter_name | remove: '"' }}' AS `COUNTER_NAME`
  FROM ${base_table.SQL_TABLE_NAME}
  GROUP BY 1
  {% unless forloop.last %}
    UNION ALL
  {% endunless %}
{% endfor %}
;;

  }

  filter: select_counters {
    # suggest_explore: information_schema
    # suggest_dimension: column_name
    suggestions: ["COUNTER_1","COUNTER_2","COUNTER_3","COUNTER_4"]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.order_items_created_date ;;
  }

  measure: counter {
    type: sum
    sql: ${TABLE}.COUNTER ;;
  }

  dimension: counter_name {
    sql: ${TABLE}.COUNTER_NAME ;;
  }


  }
