DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals (id string, name string, address string, city string, state string, zip string, country string, phone string, type string, ownership string, emergency string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ( "separatorChar" = ",","quoteChar" = '"',"escapeChar"= '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/hospitals_path';

DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care (hospital_id string, hospital_name string, address string, city string, state string, zip string, country string, phone string, condition string, measure_id string, measure_name string, score string, sample string, footnote string, start_date string, end_date string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ( "separatorChar" = ",","quoteChar" = '"',"escapeChar"= '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/effective_care_path';

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (hospital_id string, hospital_name string, address string, city string, state string, zip string, country string, phone string, measure_name string, measure_id string, compared_national string, denominator string, score string, lower string, higher string, footnote string, start_date string, end_date string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ( "separatorChar" = ",","quoteChar" = '"',"escapeChar"= '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/readmissions_path';

DROP TABLE measures;
CREATE EXTERNAL TABLE measures (name string, id string, quarter_start string, start_date string, quarter_end string, end_date string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ( "separatorChar" = ",","quoteChar" = '"',"escapeChar"= '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/measures_path';

DROP TABLE surveys_responses;
CREATE EXTERNAL TABLE surveys_responses (hospital_id string, hospital_name string, address string, city string, state string, zip string, country string, comm_nurseap string, comm_nurseip string, comm_nurseds string, comm_docap string, comm_docip string, comm_docds string, responseap string, responseip string, responseds string, painap string, painip string, painds string, comm_medap string, comm_medip string, comm_medds string, cleanap string, cleanip string, cleands string, dischargeap string, dischargeip string, dischargeds string, ratingap string, ratingip string, ratingds string, hcahps_score_base string, hcahps_score_consist string) ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES ( "separatorChar" = ",","quoteChar" = '"',"escapeChar"= '\\' ) STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/surveys_responses_path';






