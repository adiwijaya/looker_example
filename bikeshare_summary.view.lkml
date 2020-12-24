view: bikeshare_summary {
  derived_table: {
    sql: SELECT *, LAG(total_trip) OVER(ORDER BY date DESC) AS prev_trip
    FROM `aw-sb-project.demo.bikeshare_summary`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: total_trip {
    type: number
    sql: ${TABLE}.total_trip ;;
  }


  set: detail {
    fields: [date, total_trip]
  }
}
