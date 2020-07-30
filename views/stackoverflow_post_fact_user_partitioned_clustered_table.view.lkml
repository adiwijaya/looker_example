view: stackoverflow_post_fact_user_partitioned_clustered_table {
  sql_table_name: `benchmark_datamart.stackoverflow_post_fact_user_partitioned_clustered_table`
    ;;

  dimension: count_post_by_user {
    type: number
    sql: ${TABLE}.count_post_by_user ;;
  }

  dimension_group: creation {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.creation_date ;;
  }

  dimension: sum_char_length_text {
    type: number
    sql: ${TABLE}.sum_char_length_text ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
