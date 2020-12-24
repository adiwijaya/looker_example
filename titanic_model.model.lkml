connection: "bq-demo"

include: "/titanic_table.view.lkml"
include: "/bikeshare_summary.view.lkml"
include: "/bikeshare_summary_enhanced.view.lkml"

explore: titanic_table {}
explore: bikeshare_summary {}
explore: bikeshare_summary_enhanced {}
