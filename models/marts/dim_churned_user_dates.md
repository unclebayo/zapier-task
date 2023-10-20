<! -- dim_churned_user_dates and field descriptions -->
{% docs dim_churned_user_dates %}
A dimension model that provides a summary of the date ranges during which users are considered active based on their task activity over the prior 28 days
{% enddocs %}

{% docs dim_churned_user_dates_churn_start_date %}
The date from which the user is considered to have churned, indicating the first day after their last active period.
{% enddocs %}

{% docs dim_churned_user_dates_churn_end_date %}
The date marking the end of the churn period, 28 days after the `churn_start_date`.
{% enddocs %}
