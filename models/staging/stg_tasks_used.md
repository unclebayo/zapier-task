<! -- stg_tasks_used and field descriptions -->
{% docs stg_tasks_used %}
A staging model that contains the data related to the tasks used by various users over time. It includes fields such as date, user_id, and account_id, along with the tasks_used metric, which represents the number of tasks utilized by each user on a specific date. This table serves as the primary source of information for tracking user activity and forms the basis for the calculation of active and churned users within the data model.
{% enddocs %}

{% docs stg_tasks_used_date %}
The date on which the tasks occurred.
{% enddocs %}

{% docs stg_tasks_used_user_id %}
The unique identifier (ID) for the user related to the tasks.
{% enddocs %}

{% docs stg_tasks_used_account_id %}
The unique identifier (ID) for the billing account related to the tasks.
{% enddocs %}

{% docs stg_tasks_used_zap_id %}
The unique identifier (ID) for the Zap that executes the task. A Zap is an automated workflow.
{% enddocs %}

{% docs stg_tasks_used_min_timestamp %}
The earliest date and time at which a task executed on the date
{% enddocs %}

{% docs stg_tasks_used_tasks_used %}
The number of tasks successfully executed on the date
{% enddocs %}

{% docs stg_tasks_used_errors %}
The number of tasks executed that failed on the date
{% enddocs %}
