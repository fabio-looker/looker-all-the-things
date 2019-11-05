connection: "lookerdata"

include: "*.view.lkml"                       # include all views in this project
explore:  profitloss_data{
  join: revenue_data {
    relationship: one_to_one
    sql_on: ${profitloss_data.company_name} = ${revenue_data.company_name} and ${profitloss_data.period_end_date_date} = ${revenue_data.period_end_date_date} ;;
  }
}
