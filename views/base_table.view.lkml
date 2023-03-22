view: base_table {
derived_table: {
  sql:
            SELECT
                (DATE(order_items.created_at )) AS order_items_created_date,
                10 AS COUNTER_1,
                5 AS COUNTER_2,
                7 AS COUNTER_3,
                9 AS COUNTER_4,
                12 AS COUNTER_5,
                3 AS COUNTER_6
            FROM `thelook.order_items`
                 AS order_items
            WHERE ((( order_items.created_at  ) >= ((TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'UTC'), INTERVAL -29 DAY))) AND ( order_items.created_at  ) < ((TIMESTAMP_ADD(TIMESTAMP_ADD(TIMESTAMP_TRUNC(CURRENT_TIMESTAMP(), DAY, 'UTC'), INTERVAL -29 DAY), INTERVAL 30 DAY)))))
            GROUP BY
                1
            ORDER BY
                1 DESC
            LIMIT 500;;
}




  dimension: order_items_created_date {
    type: date
    datatype: date
    sql: ${TABLE}.order_items_created_date ;;
  }

  dimension: counter_1 {
    type: number
    sql: ${TABLE}.COUNTER_1 ;;
  }

  dimension: counter_2 {
    type: number
    sql: ${TABLE}.COUNTER_2 ;;
  }

  dimension: counter_3 {
    type: number
    sql: ${TABLE}.COUNTER_3 ;;
  }

  dimension: counter_4 {
    type: number
    sql: ${TABLE}.COUNTER_4 ;;
  }

  dimension: counter_5 {
    type: number
    sql: ${TABLE}.COUNTER_5 ;;
  }

  dimension: counter_6 {
    type: number
    sql: ${TABLE}.COUNTER_6 ;;
  }


}
