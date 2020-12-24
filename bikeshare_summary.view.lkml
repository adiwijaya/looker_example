view: bikeshare_summary {
  sql_table_name: `aw-sb-project.demo.bikeshare_summary`;;

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: total_trip {
    type: number
    sql: ${TABLE}.total_trip ;;
  }

}
