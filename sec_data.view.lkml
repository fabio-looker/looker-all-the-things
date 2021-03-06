view: profitloss_data {
  view_label: "SEC Data"
  derived_table: {
    sql: SELECT company_name, PARSE_TIMESTAMP("%Y%m%d", period_end_date) AS period_end_date, CAST(AVG(value) as int64) AS value
        FROM `bigquery-public-data.sec_quarterly_financials.quick_summary`
        WHERE measure_tag = "ProfitLoss"
        and form like '%10-K%'
        and number_of_quarters= 4
        GROUP BY 1, 2;;
  }
  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name;;
  }

  dimension_group: period_end_date {
    type: time
  }
  measure: profit_loss_value {
    type: sum
    sql: ${TABLE}.value ;;
    value_format:"[>=1000000]$#,##0.00,\"M\";[<=-1000000]$#,##0.00,\"M\";$0.00\"K\""
  }
}

view:  revenue_data{
  derived_table: {
    sql: SELECT company_name, PARSE_TIMESTAMP("%Y%m%d", period_end_date) AS period_end_date, CAST(AVG(value) as int64) AS value
        FROM `bigquery-public-data.sec_quarterly_financials.quick_summary`
        WHERE (measure_tag = "Revenues"
        OR measure_tag = "SalesRevenueGoodsNet")
        and form like '%10-K%'
        and number_of_quarters= 4
        GROUP BY 1, 2;;
  }
  dimension: company_name {
    type: string
    hidden: yes
  }
  dimension_group: period_end_date {
    type: time
    hidden: yes
  }
  measure: revenue_value {
    type: sum
    view_label: "SEC Data"
    sql: ${TABLE}.value ;;
    value_format:"[>=1000000]$#,##0.00,\"M\";[<=-1000000]$#,##0.00,\"M\";$0.00\"K\""
  }
}

view: earnings_per_share {
  derived_table: {
    sql: SELECT company_name, PARSE_TIMESTAMP("%Y%m%d", period_end_date) AS period_end_date, CAST(AVG(value) as int64) AS value
        FROM `bigquery-public-data.sec_quarterly_financials.quick_summary`
        WHERE measure_tag like "%EarningsPerShare%"
        and form like '%10-K%'
        and number_of_quarters= 4
        GROUP BY 1, 2;;
  }
  dimension: company_name {
    type: string
    hidden: yes
  }
  dimension_group: period_end_date {
    type: time
    hidden: yes
  }
  measure: earnings_per_share {
    type: sum
    view_label: "SEC Data"
    sql: ${TABLE}.value ;;
    value_format:"[>=1000000]$#,##0.00,,\"M\";[<=-1000000]$#,##0.00,,\"M\";$0.00,\"K\""
  }
}

view: dividends {
  derived_table: {
    sql: SELECT company_name, PARSE_TIMESTAMP("%Y%m%d", period_end_date) AS period_end_date, CAST(AVG(value) as int64) AS value
        FROM `bigquery-public-data.sec_quarterly_financials.quick_summary`
        WHERE measure_tag = "Dividends"
        and form like '%10-K%'
        and number_of_quarters= 4
        GROUP BY 1, 2;;
  }
  dimension: company_name {
    type: string
    hidden: yes
  }
  dimension_group: period_end_date {
    type: time
    hidden: yes
  }
  measure: dividends {
    type: sum
    view_label: "SEC Data"
    sql: ${TABLE}.value ;;
    value_format:"[>=1000000]$#,##0.00,,\"M\";[<=-1000000]$#,##0.00,,\"M\";$0.00,\"K\""
  }
}
