connection: "lookerdata"

persist_for: "24 hours"

include: "bq_public_metadata.view.lkml"

include: "epa_historical_air_quality.view.lkml"
include: "libraries_io_repositories.view.lkml"
