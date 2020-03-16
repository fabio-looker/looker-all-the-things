# Last Updated: 2019-10-18
# Status: WIP

include: "datagroups.lkml"
explore: epa_historical_air_quality {hidden:yes}
view: epa_historical_air_quality {
  derived_table: {
    #datagroup_trigger: first_of_the_month
    persist_for: "24 hours"
    sql:
      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`co_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`hap_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`lead_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`no2_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`nonoxnoy_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`o3_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`pm10_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`pm25_frm_daily_summary`
      GROUP BY 1,2,3

      UNION ALL

      SELECT
        CONCAT(state_code,"-",county_code,"-",site_num) as pk3_site_id,
        date_local as pk3_date,
        parameter_name as pk3_air_quality_type,
        -- end pk --
        COUNT(*) as number_of_instruments_measuring,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_longitude,
        CASE WHEN MIN(longitude)<>MAX(longitude)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(longitude) END as site_latitude,
        CASE WHEN MIN(state_name)<>MAX(state_name)
            THEN ERROR("A site has more than one longitude")
            ELSE MIN(state_name) END as state_name,

        AVG(arithmetic_mean) as site_date_avg_measurement,
        CASE WHEN MIN(units_of_measure) <> MAX(units_of_measure)
            THEN "Mixed"
            ELSE MIN(units_of_measure) END as measurement_unit,
        --AVG(uncertainty) as site_date_avg_uncertainty,
        STRING_AGG(DISTINCT event_type,"; ") as special_events

      FROM `bigquery-public-data`.`epa_historical_air_quality`.`pm25_nonfrm_daily_summary`
      GROUP BY 1,2,3
    ;;
  }
  dimension: pk3_site_id {hidden:yes}
  dimension: pk3_date {hidden:yes}
  dimension: pk3_air_quality_type {hidden:yes}

  dimension_group: date {
    type: time
    datatype: date
    timeframes: [date,day_of_week,month,month_name,year]
    sql: ${TABLE}.pk3_date   ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.site_latitude ;;
    sql_longitude: ${TABLE}.site_longitude ;;
  }
  dimension: state_name {}
  dimension: air_quality_type {
    sql: pk3_air_quality_type ;;

  }
  dimension: measurement_unit { hidden: yes }
  dimension: site_date_avg_measurement {hidden: yes type:number}
  dimension: site_date_avg_uncertainty {hidden: yes type:number}
  dimension: special_events {hidden: yes}

  measure: average_measurements {
    type: string
    sql:CASE WHEN ${measurement_units} <> "Mixed"
      THEN CONCAT(CAST(AVG(${site_date_avg_measurement}) AS STRING)
        ," ",${measurement_units})
      ELSE "Mixed units. Click to drill"
      END
      ;;
    drill_fields: [
      pk3_site_id, pk3_date, pk3_air_quality_type,
      site_date_avg_measurement,
      measurement_unit,
      site_date_avg_uncertainty,
      special_events]
  }
  measure: measurement_units {
    sql:  CASE
        WHEN MAX(${measurement_unit}) <> MIN(${measurement_unit})
        THEN "Mixed"
        ELSE MIN(${measurement_unit})
        END
      ;;
  }
  measure: has_special_events {
    type: yesno
    sql: BOOL_OR(${special_events} IS NOT NULL) ;;
  }

}
