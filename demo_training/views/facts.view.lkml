view: facts {
  sql_table_name: demo.facts ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension_group: time {
    type: time
    sql: ${TABLE}.time ;;
  }

  set: detail {
    fields: [id, value, time_time]
  }
}
