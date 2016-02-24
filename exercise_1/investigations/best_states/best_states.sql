drop table best_hospitals_all;
create table best_hospitals_all as select h.id as id, h.state as state, avg(s.score)*count(s.score)/100 as weighted_score from scores_tbl s join hospitals_tbl h on (h.id=s.hospital_id) where s.score is not NULL and s.procedure_id not in ('ED_1b','ED_2b','OP_1','OP_18b','OP_20','OP_21','OP_3b','OP_5','SCIP_Inf_3') group by h.id, h.state order by weighted_score desc;

drop table best_states;
create table best_states  as select state, avg(weighted_score) as state_score, count(id) as count_hospital, stddev_pop(weighted_score) as variability_score  from best_hospitals_all group by state order by state_score desc limit 10;
