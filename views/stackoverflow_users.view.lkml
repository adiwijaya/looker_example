view: stackoverflow_users {
  sql_table_name: `benchmark_datamart.stackoverflow_users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: about_me {
    type: string
    sql: ${TABLE}.about_me ;;
    required_access_grants: [test_access_grant]
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
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

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }


  dimension: capital_display_name {
    type: string
    sql: UPPER(${TABLE}.display_name) ;;
  }

  dimension: down_votes {
    type: number
    sql: ${TABLE}.down_votes ;;
    hidden: yes
  }


  measure: avg_down_votes {
    type :  average
    sql:  ${down_votes} ;;
  }

  measure: sum_down_votes {
    type :  sum
    sql:  ${down_votes} ;;
  }

  dimension_group: last_access {
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
    sql: ${TABLE}.last_access_date ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: profile_image_url {
    type: string
    sql: ${TABLE}.profile_image_url ;;
  }

  dimension: reputation {
    type: number
    sql: ${TABLE}.reputation ;;
  }

  dimension: up_votes {
    type: number
    sql: ${TABLE}.up_votes ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views2 ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
  }

  measure: count {
    type: count
    drill_fields: [id, display_name]
  }

  measure: total_votes {
    type: sum
    sql:${up_votes} ;;
    drill_fields: [id, display_name]
  }

}
