<! -- fct_user_activity_summary and field descriptions -->
{% docs fct_user_activity_summary %}
A fact model that shows consolidated summary of user activity and churn status, combining information from the `dim_active_user_dates` and `dim_churned_user_dates models` for each date.
{% enddocs %}

{% docs fct_user_activity_summary_active_users %}
The count of users who are identified as active on each date, reflecting the number of users engaging with the system within the 28-day period.
{% enddocs %}

{% docs fct_user_activity_summary_churned_users %}
The count of users who are identified as churned on each date, reflecting the number of users who have discontinued their activity over the 28-day period following their last active date.
{% enddocs %}

{% docs fct_user_activity_summary_date %}
The specific date for which the user activity and churn data are being summarized, enabling the analysis of user behavior and churn trends over time.
{% enddocs %}
