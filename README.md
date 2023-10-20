# zapier-take-home-assignment
## Prepared By: Adebayo Ogundele, abiodunogundele76@gmail.com
### Introduction
This project aims to create a comprehensive data model for analyzing user activity and churn in a business context. The data model is based on SQL and is designed to track active and churned users on a daily basis. It provides insights into user behavior over time. To successfully work on this project, a solid understanding of SQL, data modeling principles, and familiarity with tools like dbt and Redshift is required.

### Tools Used
- Data Modelling: dbt
- Database: Amazon Redshift
- Language: SQL

### Assumptions
- Data structure: The data is assumed to be stored in a Redshift database, and the structure of the source data table should include fields such as date, tasks_used, user_id, and account_id.
- Data consistency: The provided SQL scripts assume consistent and accurate data input, free from anomalies such as duplicate records or missing values.
- User behavior definition: User activity is defined as the presence of at least one task within the last 28 days, and churn is defined as inactivity for 28 days following the last active status.
- Unique identifiers: It is assumed that each user is uniquely identified by the `user_id` field, and each record is uniquely identifiable by the combination of `user_id` and `date`.
- Results in the fact model were limited because of the size of the dependent models

### Steps to Run
- Download DBeaver (an external client) to connect to the Redshift instance
- Install dbt (using pip, `pip install dbt-redshift`) and configure the necessary profiles for connecting to your Redshift database. Link to configure dbt can be found [here](https://docs.getdbt.com/docs/core/connect-data-platform/redshift-setup)
- Clone this repository to your local system
- Run the `dbt` model using this one liner `dbt build --select +fct_user_activity_summary --full-refresh`
- Upon successful run, go to your redshift instance and run `select * from fct_user_activity_summary` to view daily results of active and churned users
- Leverage the generated data models to conduct analyses on user activity and churn over time.

### Models
In this projects, three main models have been built to get the desired result. Information about these models can be found below:
- `dim_active_user_dates`
  * This model identifies the date ranges during which users are considered active based on their task activity over the prior 28 days.
  * The model provides a record of the start and end dates for each user's active period, enabling the tracking of user engagement within the specified timeframe.
  * This approach was chosen as it allows for the efficient identification and tracking of active users within the defined 28-day window, aligning with the business definition of user activity.
<img width="499" alt="Screenshot 2023-10-20 at 01 33 07" src="https://github.com/unclebayo/zapier-task/assets/62335314/059dd1f8-d1b6-40ed-aa4e-b7f910ce6887">

- `dim_churned_user_dates`
  * This model identifies the date ranges during which users are considered churned, specifically the 28 days following their last active status.
  * The model highlights the start and end dates of the churn period for each user, facilitating the monitoring of user disengagement and churn behavior.
  * Creating a dedicated model for churned users enables the clear identification of users who have discontinued their activity, helping to analyze and understand the churn dynamics within the user base.
 
- `fct_user_activity_summary`
  * This model combines information from the active user dates and churned user dates models to create a daily summary of active and churned users. The summary provides a comprehensive view of user activity on a daily basis.
  * The model summarizes the daily status of users, indicating whether they are active or churned on specific dates. This provides insights into user behavior patterns over time.
  * By consolidating the data of both active and churned users, this model allows for a comprehensive understanding of user engagement trends. This, in turn, facilitates effective decision-making and strategic planning for initiatives aimed at user retention and engagement.
<img width="559" alt="Screenshot 2023-10-20 at 07 33 49" src="https://github.com/unclebayo/zapier-task/assets/62335314/8190cf00-d5e6-40c4-bfcf-8271aaedf276">

### Documenation & DAG
Since dbt was used, documentation becomes very easy. I created markdown (.md) and .yml files to easily describe each field and model. It also makes it simple to display the DAG and relationships among the models.

<img width="1491" alt="Screenshot 2023-10-20 at 07 28 52" src="https://github.com/unclebayo/zapier-task/assets/62335314/519466c0-1ed4-499f-9a32-d94d12e1cad0">

<img width="1065" alt="Screenshot 2023-10-20 at 07 29 34" src="https://github.com/unclebayo/zapier-task/assets/62335314/f0315ac4-f6ed-43d5-bedf-a8df6c31de58">

To see the full docs, run the below:
- `dbt docs generate`
- `dbt docs serve`

### Query for Bonus Question
###### Active Users
``` sql
SELECT 
    CASE WHEN COUNT(*) > 0 THEN 'Active' ELSE 'Not Active' END AS activity_status
FROM 
    dim_active_user_dates
WHERE 
    user_id = 'input user_id';
```

###### Churned Users
``` sql
SELECT 
    CASE WHEN COUNT(*) > 0 THEN 'Churned' ELSE 'Not Churned' END AS churn_status
FROM 
    dim_churned_user_dates
WHERE 
    user_id = 'input user_id';
```
