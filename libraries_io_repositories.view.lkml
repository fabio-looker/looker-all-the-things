
include: "datagroups.lkml"
explore: repositories {hidden:yes}
view: repositories {
  sql_table_name: `bigquery-public-data.libraries_io.repositories` ;;
  dimension: pk1_repository_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: host_type {label:"Repository hosting" description:"E.g., GitHub"}
  dimension: local_name {
    group_label:"Name" label: "Local Name" description:"E.g., portable-holes"
    sql: REGEXP_EXTRACT(${name_with_owner},"[^/]+$") ;;
    }
  dimension: name_with_owner {
    group_label:"Name" label: "Owner Name" description:"E.g., acme/portable-holes"
  }
  dimension: full_name {
    group_label:"Name" label: "Full Name" description:"E.g., GitHub/acme/portable-holes"
    sql: CONCAT(${TABLE}.host_type, "/",  ${TABLE}.name_with_owner);;
  }


  dimension: open_issues_count {type: number hidden: yes}
  dimension: stars_count       {type: number hidden: yes}
  dimension: watches_count     {type: number hidden: yes}

  dimension: license {}
  dimension: language {}

  dimension: has_code_of_conduct {
    type: yesno
    sql: COALESCE(${TABLE}.code_of_conduct_filename,"") <> ""  ;;
  }

  measure: count {
    type: count
    filters: {
      field: pk1_repository_id
      value: "NOT NULL"
    }
  }
  measure: open_issues {type: sum sql: ${open_issues_count} ;;}
  measure: stars       {type: sum sql: ${stars_count} ;;}
  measure: watches    {type: sum sql: ${watches_count} ;;}
  measure: any_has_code_of_conduct {type: yesno sql: LOGICAL_OR(${has_code_of_conduct});;}

  measure: licenses {type:list list_field: license}
  measure: languages {type:list list_field: language}


}
