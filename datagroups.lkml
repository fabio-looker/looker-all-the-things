datagroup: nightly {
  sql_trigger: SELECT CURRENT_DATE("America/Los_Angeles") ;;
}
datagroup: first_of_the_month {
  sql_trigger: SELECT DATE_PART(CURRENT_DATE("America/Los_Angeles"), "MONTH") ;;
}
