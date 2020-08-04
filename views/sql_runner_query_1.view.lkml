view: sql_runner_query_1 {
  derived_table: {
    sql: SELECT count(*) FROM stackoverflow_users
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: f0_ {
    type: number
    sql: ${TABLE}.f0_ ;;
  }

  set: detail {
    fields: [f0_]
  }
}
