connection: "aw-connection-bq"

include: "/demo_training/views/**/*.view"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


datagroup: datagroup_facts_table_demo {
  label: "desired label"
  description: "description string"
  max_cache_age: "24 hours"
  sql_trigger: SELECT max(id) FROM facts ;;
}

explore: demo_vote_timestamp_2{}

persist_for: "1 minutes"

explore: dimention {
  sql_always_where: ${id} = 1 AND ${name} LIKE '%1%';;
  always_join: [facts]
  join: facts {
    relationship:  one_to_many
    sql_on: ${facts.id} = ${dimention.id} ;;
  }
}

explore: audit_log_table {
  always_filter: {
    filters: [audit_log_table.log_url: "FAILED"]
  }
  label: "Log Table"
  view_label: "Log Table"
  access_filter: {
    field: log_url
    user_attribute: aw_demo_status
  }
}

access_grant: col_block {
  user_attribute: aw_demo_status
  allowed_values: ["SUCCESS"]
}

explore: facts {
  aggregate_table: bla_aggregate {
    materialization: {
      datagroup_trigger: datagroup_facts_table_demo
    }
    query: {
      dimensions: [facts.id]
      measures: [facts.sum_id]
      timezone: America/Los_Angeles
    }
  }
}
explore: facts_table_demo {
  persist_with: datagroup_facts_table_demo
}


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
