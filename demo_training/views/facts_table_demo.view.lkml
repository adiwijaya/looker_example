view: facts_table_demo {
  derived_table: {
    sql:
      SELECT
        id,
        MIN(DATE(time)) AS first_order_date
      FROM
        demo.facts
      GROUP BY
        id ;;
    datagroup_trigger: datagroup_facts_table_demo
  }
  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: first_order {
    type: string
    sql: ${TABLE}.first_order_date ;;
  }

  measure: max_fo  {
    type:  max
    sql: ${first_order};;
  }
}
