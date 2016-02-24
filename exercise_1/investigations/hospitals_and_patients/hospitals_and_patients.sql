drop table hospitals_and_patients;
create table hospitals_and_patients as select h.name as hospital_name, s.score as score from surveys_results_tbl s join hospitals_tbl h on (h.id=s.hospital_id) where s.score is not NULL order by score desc limit 10;
