explore: bq_public_metadata {
  label: "BQ Public Metadata"
}
view: bq_public_metadata {
  # Please thank this kind soul: https://medium.com/google-cloud/bigquery-public-datasets-metadata-788c2c3897b2

  # Made a derived table instead so I can get a nice hierarchy.. e.g. https://hack.looker.com/looks/40
  # sql_table_name: `adventures-on-gcp`.`bigquery_public_datasets`.`bq_public_metadata` ;;
  derived_table: {
    sql:
      SELECT
        project_id,
        dataset_id,
        CAST(NULL AS STRING) AS table_id,
        MAX(dataset_description) AS description,
        MAX(table_modified) as table_modified,
        CAST(NULL AS STRING) AS table_type
      FROM `adventures-on-gcp`.`bigquery_public_datasets`.`bq_public_metadata`
      GROUP BY 1,2
      UNION ALL
      SELECT
        project_id,
        dataset_id,
        table_id,
        table_description,
        table_modified,
        table_type
      FROM `adventures-on-gcp`.`bigquery_public_datasets`.`bq_public_metadata`
    ;;
    }

  dimension: project_id {}

  dimension: dataset_id {}

  dimension: table_id {
    required_fields: [project_id,dataset_id]
    link: {
      label: "Explore"
      url: "/connections/lookerdata/explore/{{project_id}}:{{dataset_id._value}}/{{value}}"
    }
  }

  dimension: description {
    hidden:yes
#     sql: {% if table_id._is_selected
#             %} ${TABLE}.table_description {%
#           else
#             %} ${TABLE}.dataset_description {%
#           endif %};;
  }

  dimension_group: last_updated {
    hidden: yes
    sql: ${TABLE}.table_modified ;;
    type: time
    timeframes: [date,month,year]
  }

  dimension: table_type {
    description: "Whether table is normal table, view or BQ ML model"
    type: string
    sql: ${TABLE}.table_type ;;
  }
  measure: descriptions {
    type: string
    sql: STRING_AGG(DISTINCT ${description}, "\n\n") ;;
    html: <div style="width:600px;">{{rendered_value}}</div> ;;
  }
  measure: last_updated {
    type: string
    sql: SUBSTR(CAST(MAX(${last_updated_date}) AS STRING),1,10) ;;
  }

  set: detail {
    fields: [
      project_id,
      dataset_id,
      table_id,
      last_updated_date,
      table_type
    ]
  }
}
