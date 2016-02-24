drop table scores_tbl;
create table scores_tbl (hospital_id string, procedure_id string, score DECIMAL(10,5));
insert into scores_tbl select trim(hospital_id) as hospital_id, trim(measure_id) as procedure_id, cast(trim(score) as DECIMAL(10,5)) as score from effective_care;
insert into scores_tbl select trim(hospital_id) as hospital_id, trim(measure_id) as procedure_id, cast(trim(score) as DECIMAL(10,5)) as score from readmissions;
