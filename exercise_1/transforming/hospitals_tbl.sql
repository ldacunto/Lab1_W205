drop table hospitals_tbl;
create table hospitals_tbl as select trim(id) as id, trim(name) as name, trim(state) as state from hospitals;
