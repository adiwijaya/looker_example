connection: "aw-connection-bq"

include: "/demo_training/views/**/*.view"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard


explore: demo_vote_timestamp_2{}


explore: dimention {
  sql_always_where: ${facts.id} = 1 ;;
  join: facts {
    relationship:  one_to_many
    sql_on: ${facts.id} = ${dimention.id} ;;
  }
}

explore: audit_log_table {
  access_filter: {
    field: log_url
    user_attribute: aw_demo_status
  }
}

access_grant: col_block {
  user_attribute: aw_demo_status
  allowed_values: ["SUCCESS"]
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
