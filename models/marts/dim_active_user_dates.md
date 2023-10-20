<! -- dim_active_user_dates and field descriptions -->
{% docs dim_active_user_dates %}
A dimension model that provides a summary of the date ranges during which users are considered active based on their task activity over the prior 28 days
{% enddocs %}

{% docs dim_active_user_dates_start_date %}
The beginning date of the 28-day period during which the user is considered active, determined based on the user's task activity.
{% enddocs %}

{% docs dim_active_user_dates_end_date %}
The end date of the 28-day period, calculated by adding 27 days to the start_date, thus defining the duration during which the user is considered active.
{% enddocs %}
