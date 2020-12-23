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

  measure: sum_id  {
    type: sum
    sql: ${id} ;;
  }

  measure: list_value  {
    type: list
    list_field: value
    drill_fields: [detail*]
  }



  set: detail {
    fields: [id, value, time_time]
  }
}
