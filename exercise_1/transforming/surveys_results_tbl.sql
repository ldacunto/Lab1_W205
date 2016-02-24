drop table surveys_results_tbl;
create table surveys_results_tbl as select trim(hospital_id) as hospital_id, cast(trim(hcahps_score_base) as DECIMAL(10,5)) as score from surveys_responses;