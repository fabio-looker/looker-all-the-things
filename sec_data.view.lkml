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
    link: {
      label: "Dashboard"
      url: "https://hack.looker.com/embed/dashboards/69?Company={{ value }}"
    }
  }

  dimension_group: period_end_date {
    type: time
  }
  measure: profit_loss_value_in_thousands {
    type: sum
    sql: ${TABLE}.value/1000 ;;
    value_format:"$#,##0.00;($#,##0.00)"
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
  measure: revenue_value_in_thousands {
    type: sum
    view_label: "SEC Data"
    sql: ${TABLE}.value/1000 ;;
    value_format:"$#,##0.00;($#,##0.00)"
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
    value_format:"$#,##0.00;($#,##0.00)"
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
  measure: dividends_in_thousands {
    type: sum
    view_label: "SEC Data"
    sql: ${TABLE}.value/1000 ;;
    value_format:"$#,##0.00;($#,##0.00)"
  }
}
