connection: "aw-connection-bq"

# include all the views
include: "/views/**/*.view"

datagroup: looker_aw_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

access_grant: test_access_grant {
  user_attribute: aw_user_attribute
  allowed_values: ["1"]

}

persist_with: looker_aw_project_default_datagroup

explore: stackoverflow_post_fact_user_partitioned_clustered_table {
  access_filter: {
    field: user_id
    user_attribute: aw_user_attribute
  }
}

explore: stackoverflow_post_history {}

explore: stackoverflow_users {
  join: stackoverflow_post_history {
    sql_on: ${stackoverflow_users.id} = ${stackoverflow_post_history.user_id} ;;
    fields: [stackoverflow_post_history.count,stackoverflow_post_history.comment]
    sql_where: ${stackoverflow_post_history.comment} IS NOT null ;;
    relationship: one_to_many
  }

}

explore: stackoverflow_user_facts {}

explore: sql_runner_query_1 {}
