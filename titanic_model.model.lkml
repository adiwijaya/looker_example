connection: "bq-demo"

include: "/titanic_table.view.lkml"
include: "/bikeshare_summary.view.lkml"

explore: titanic_table {}
explore: bikeshare_summary {}
