view: bikeshare_summary_enhanced {
  derived_table: {
    sql: SELECT *, LAG(total_trip) OVER(ORDER BY date ASC) AS prev_trip
          FROM `aw-sb-project.demo.bikeshare_summary`
            ;;
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

  dimension: trip_diff_percentage {
    type: number
    sql: (${TABLE}.total_trip - ${TABLE}.prev_trip) / ${TABLE}.prev_trip * 100 ;;
    value_format: "\"😃 \" 0.00\% ; \"😟 \" 0.00\%"
  }

}
