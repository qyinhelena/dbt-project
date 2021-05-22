### Welcome to my dbt project!
### Data Engineering Project: Data Pipeline for San Francisco Bikeshare Public Data on Bigquery

This project is using a BigQuery Public Dataset on San Francisco Bikeshare. I connected my dbt project to the BigQuery dataset. I am particularly interested in transport topics, so I applied the filter of transportation and found this bikeshare dataset for San Francisco.

The initial goal of the data pipeline was to understand the different trip patterns in bikeshare in San Francisco. Although there are many possible ways to categorize these bikeshare trips, I am interested in knowing the differences between the trips with the same start and end station and the trips with different start and end stations. My hypothesis is that trips with different start and end stations will have longer duration time for the trips than the trips that start and end in the same station. I will focus more on the top 5 duration trips for each station in my data pipeline.

it took my computer about 38 seconds to run the pipeline. I included 12 models for the data pipeline, each has descriptions in the schema yml file. I also developed 4 data quality tests and 21 schema tests. In the end, there are 2 table models, 2 incremental models and 12 view models. Below is a Lineage DAG diagram for an overview of the models:
dbt-dag.png![image](https://user-images.githubusercontent.com/8932999/119239467-24652500-bafe-11eb-9bf8-4c539f139020.png)

### Data source: 
https://console.cloud.google.com/marketplace/product/san-francisco-public-data/sf-bike-share?filter=solution-type:dataset&filter=category:transportation


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
