connection: "lookerdata"

persist_for: "24 hours"

include: "epa_historical_air_quality.view.lkml"

include: "bq_public_metadata.view.lkml"
