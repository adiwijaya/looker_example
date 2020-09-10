view: audit_log_table {
  sql_table_name: `demo.audit_log_table`;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: task {
    type: string
    sql: ${TABLE}.task ;;
  }

  dimension: dag {
    type: string
    sql: ${TABLE}.dag ;;
    required_access_grants: [col_block]
  }

  dimension: exec_date {
    type: string
    sql: ${TABLE}.exec_date ;;
  }

  dimension: log_url {
    type: string
    sql: ${TABLE}.log_url ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  set: detail {
    fields: [task, dag, exec_date, log_url, timestamp_time]
  }
}
