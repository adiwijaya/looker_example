connection: "aw-connection-bq"

# include all the views
include: "/views/**/*.view"

datagroup: looker_aw_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_aw_project_default_datagroup

explore: stackoverflow_post_fact_user_partitioned_clustered_table {}

explore: stackoverflow_post_history {}

explore: stackoverflow_users {}
