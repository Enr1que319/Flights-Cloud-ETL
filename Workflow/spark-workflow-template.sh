template_name="flights_etl"
cluster_name="spark-job"
current_date="2019-05-10"
bucket=gs://enr1qu319-data-engineer-1

#gcloud beta dataproc workflow-templates delete -q $template_name &&
gcloud dataproc workflow-templates delete -q $template_name --region=us-central1 &&

gcloud beta dataproc workflow-templates create $template_name --region=us-central1 &&

gcloud beta dataproc workflow-templates set-managed-cluster $template_name \
--region=us-central1 \
--cluster-name=$cluster_name \
--scopes=default \
--master-machine-type n1-standard-2 \
--master-boot-disk-size 20 \
--num-workers 2 \
--worker-machine-type n1-standard-2 \
--worker-boot-disk-size 20 \
--image-version 1.4 &&

gcloud dataproc workflow-templates \
add-job pyspark $bucket/spark-job/flights-etl.py \
--region=us-central1 \
--step-id flight_delays_etl \
--workflow-template=$template_name &&

gcloud beta dataproc workflow-templates instantiate $template_name --region=us-central1 && 

bq load --source_format=NEWLINE_DELIMITED_JSON \
 data_analysis.avg_delays_by_distance \
 $bucket/flights_data_output/${current_date}"_distance_category/*.json" &&

 bq load --source_format=NEWLINE_DELIMITED_JSON \
 data_analysis.avg_delays_by_flight_nums \
 $bucket/flights_data_output/${current_date}"_flight_nums/*.json"


