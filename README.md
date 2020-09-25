# Flights-Cloud-ETL

[![](Images/giphy-downsized-large.gif)](https://media.giphy.com/media/26xBIGFMLSK3OqnKg/giphy.gif)           
----

Airlines help people to move around the world but How many people use the plane as a means of transportation?.
In 2018, 120,000 daily flights were registered on , according to the latest report "Aviation: Benefits Beyond Borders" this is around 12 million passengers in one single day, there is not doubt that this is a lot of data to manage.

The task
----

The objective of this project is proces this flights data obtained from Kaggle in the cloud to storage a daily basis

(Schema of data)

To accomplish this task, the following tools were used:

- Python
- SQL
- Spark
- BigQuery
- Google Workflow
- Apache Airflow
- Linux

The procedure that was taken to process the information is as follows:

- Apply transformation to flight dealys data using Spark-SQL
- Save the transformed data into Big Query partitioned tables
- Use Google Workflow templates to automate the Spark ETL batch processing job
- Use Apache Airflow to create DAGs and automate the batch processing job

