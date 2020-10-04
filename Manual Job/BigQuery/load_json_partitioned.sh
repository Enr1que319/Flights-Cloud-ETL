bucket=gs://enr1qu319-data-engineer-1

#current_date=$(date +"%Y-%m-%d")
current_date='2019-05-10'

bq load --source_format=NEWLINE_DELIMITED_JSON \
 data_analysis.avg_delays_by_distance \
 $bucket/flights_data_output/${current_date}"_distance_category/*.json" &&


bq load --source_format=NEWLINE_DELIMITED_JSON \
 data_analysis.avg_delays_by_flight_nums \
 $bucket/flights_data_output/${current_date}"_flights_nums/*.json"
