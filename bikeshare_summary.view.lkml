view: bikeshare_summary {
  derived_table: {
    sql: SELECT *, LAG(total_trip) OVER(ORDER BY date ASC) AS prev_trip
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

  dimension: prev_trip {
    type: number
    sql: ${TABLE}.prev_trip ;;
  }

  dimension: diff_perc_trip {
    type: number
    sql: (${TABLE}.total_trip - ${TABLE}.prev_trip) / ${TABLE}.prev_trip * 100 ;;
  }



  set: detail {
    fields: [date, total_trip,prev_trip]
  }
}
