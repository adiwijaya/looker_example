view: demo_vote_timestamp_2 {
  sql_table_name: `demo.demo_vote_timestamp_2`;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: time {
    type: time
    sql: ${TABLE}.time ;;
  }

  dimension: candidate {
    type: string
    sql: ${TABLE}.candidate ;;
  }

  set: detail {
    fields: [time_time, candidate]
  }
}
