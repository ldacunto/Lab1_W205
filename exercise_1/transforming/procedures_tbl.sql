drop table procedures_tbl;
create table procedures_tbl as select trim(id) as id, trim(name) as name from measures;