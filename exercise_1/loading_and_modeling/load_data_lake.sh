#! /bin/bash

# Retrieve the file from the source
echo ""
echo "DOWNLOADING DATA FILE..."
echo ""
wget -O data.zip "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"

echo ""
echo "EXTRACTING DATA ..."
echo ""

# Create Temporary directory that is containing the data
mkdir -p medicare

# Unzip the files of interest  into the temp directory
unzip data.zip "Hospital General Information.csv" -d ./medicare
unzip data.zip "Timely and Effective Care - Hospital.csv" -d ./medicare
unzip data.zip "Readmissions and Deaths - Hospital.csv" -d ./medicare
unzip data.zip "Measure Dates.csv" -d ./medicare
unzip data.zip "hvbp_hcahps_05_28_2015.csv" -d ./medicare

echo ""
echo "PROCESSING DATA ..."
echo ""

# remove the header from the files and rename the files
cd medicare
tail -n+2 "Hospital General Information.csv" > hospitals.csv
tail -n+2 "Timely and Effective Care - Hospital.csv" > effective_care.csv
tail -n+2 "Readmissions and Deaths - Hospital.csv" > readmissions.csv
tail -n+2 "Measure Dates.csv" > measures.csv
tail -n+2 "hvbp_hcahps_05_28_2015.csv" > surveys_responses.csv

echo ""
echo "CREATING TARGET DIRECTORIES IN HADOOP ..."
echo ""

# create the directories into the Hadoop file system that will contain the files
hdfs dfs -mkdir -p /user/w205/hospital_compare/hospitals_path
hdfs dfs -mkdir -p /user/w205/hospital_compare/effective_care_path
hdfs dfs -mkdir -p /user/w205/hospital_compare/readmissions_path
hdfs dfs -mkdir -p /user/w205/hospital_compare/measures_path
hdfs dfs -mkdir -p /user/w205/hospital_compare/surveys_responses_path

echo ""
echo "COPYING FILES TO HADOOP ..."
echo ""

# copy the files into the Hadoop file system
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals_path
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care_path
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions_path
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures_path
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys_responses_path

echo ""
echo "REMOVING TEMPORARY FILES..."
echo ""

# remove all the files from the temporary directory 
cd ..
rm -rf medicare
rm -f data.zip

echo ""
echo "PROCESS COMPLETED"
echo ""
