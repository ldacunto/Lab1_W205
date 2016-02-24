drop table hospital_variability;
create table hospital_variability as select id, name, variability_score, count_score from (
select m.id as id, m.name as name, stddev_pop(s.score) as variability_score, count(s.score) as count_score  from scores_tbl s join hospitals_tbl h on (h.id=s.hospital_id) join procedures_tbl m on (m.id=s.procedure_id) where s.score is not NULL and s.procedure_id not in ('ED_1b','ED_2b','OP_1','OP_18b','OP_20','OP_21','OP_3b','OP_5','SCIP_Inf_3') group by m.id, m.name) as foo where count_score >= 30 order by variability_score desc limit 10;
