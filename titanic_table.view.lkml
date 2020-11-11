view: titanic_table {
  derived_table: {
    sql: SELECT * FROM `demo.titanic`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pclass {
    type: number
    sql: ${TABLE}.pclass ;;
  }

  dimension: survived {
    type: number
    sql: ${TABLE}.survived ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sex {
    type: string
    sql: ${TABLE}.sex ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: sibsp {
    type: number
    sql: ${TABLE}.sibsp ;;
  }

  dimension: parch {
    type: number
    sql: ${TABLE}.parch ;;
  }

  dimension: ticket {
    type: string
    sql: ${TABLE}.ticket ;;
  }

  dimension: fare {
    type: number
    sql: ${TABLE}.fare ;;
  }

  dimension: cabin {
    type: string
    sql: ${TABLE}.cabin ;;
  }

  dimension: embarked {
    type: string
    sql: ${TABLE}.embarked ;;
  }

  dimension: boat {
    type: string
    sql: ${TABLE}.boat ;;
  }

  dimension: body {
    type: number
    sql: ${TABLE}.body ;;
  }

  dimension: home_dest {
    type: string
    sql: ${TABLE}.home_dest ;;
  }

  set: detail {
    fields: [
      pclass,
      survived,
      name,
      sex,
      age,
      sibsp,
      parch,
      ticket,
      fare,
      cabin,
      embarked,
      boat,
      body,
      home_dest
    ]
  }

  measure: average_age  {
    type: average
    sql: ${age} ;;
  }
}
