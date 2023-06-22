docker exec -it namenode pyspark --packages org.apache.iceberg:iceberg-spark-runtime-3.2_2.12:1.3.0

# docker exec -it namenode spark-sql --conf spark.sql.defaultCatalog=local \
#     --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
#     --conf spark.sql.catalog.local=org.apache.iceberg.spark.SparkCatalog \
#     --conf spark.sql.catalog.local.type=hadoop \
#     --conf spark.sql.catalog.local.warehouse=hdfs://namenode:9000/warehouse/local

# spark-sql \
#     --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
#     --conf spark.sql.defaultCatalog=local \
#     --packages org.apache.iceberg \
#     --conf spark.sql.catalog.local=org.apache.iceberg.spark.SparkCatalog \
#     --conf spark.sql.catalog.local.type=hadoop \
#     --conf spark.sql.catalog.local.warehouse=hdfs://namenode:9000/warehouse/local \
#     --conf spark.sql.catalog.spark_catalog=org.apache.iceberg.spark.SparkSessionCatalog \
#     --conf spark.sql.catalog.spark_catalog.type=hive
