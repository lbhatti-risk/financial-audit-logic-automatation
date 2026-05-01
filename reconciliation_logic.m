/*
   Title: Automated Reconciliation Logic for IPE Validation
   Description: This script performs a Full Outer Join between front-end reporting (Tableau) 
                and back-end source data (BigQuery) to identify 'Orphan' records.
   Usage: Used for Completeness & Accuracy (C&A) testing in G-SIB audits.
*/

let
    // Source: Joining Tableau Report Data with BigQuery Source Data
    Source = Table.NestedJoin(
        Tableau_Report, {"account_id"}, 
        BigQuery_Source, {"account_id"}, 
        "BigQuery", 
        JoinKind.FullOuter
    ),

    // Expanding columns for field-to-field reconciliation
    #"Expanded Big Query" = Table.ExpandTableColumn(
        Source, "BigQuery", 
        {"run_uuid", "entity_id", "post_crm_gid", "exposure_usd"}, 
        {"BQ.run_uuid", "BQ.entity_id", "BQ.post_crm_gid", "BQ.exposure_usd"}
    ),

    // Filtering for specific audit samples (IDs replaced for anonymity)
    #"Filtered Rows" = Table.SelectRows(
        #"Expanded Big Query", 
        each ([account_id] = "SAMPLE_ID_001" or [account_id] = "SAMPLE_ID_002" or [account_id] = "SAMPLE_ID_003")
    ),

    // Reordering for final report documentation
    #"Reordered Columns" = Table.ReorderColumns(
        #"Filtered Rows",
        {"account_id", "BQ.run_uuid", "entity_id", "BQ.entity_id", "exposure_usd", "BQ.exposure_usd"}
    )
in
    #"Reordered Columns"
