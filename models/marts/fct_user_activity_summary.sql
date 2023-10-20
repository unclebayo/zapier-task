{{ config(
    materialized = 'incremental'
    , on_schema_change = 'append_new_column'
    , tags = ['user']
)
}}

with date_series as (
    select 
        distinct date
     from {{ ref('stg_tasks_used') }}
    limit 10
)

, user_activity_summary as (
    select 
        date_series.date
        , coalesce(active_user_dates.user_id, churned_user_dates.user_id) as user_id
        , case when active_user_dates.user_id is not null then 1 else 0 end as is_active
        , case when churned_user_dates.user_id is not null then 1 else 0 end as is_churned
    from date_series
    left join {{ ref('dim_active_user_dates') }} active_user_dates on date_series.date between active_user_dates.start_date and active_user_dates.end_date
    left join {{ ref('dim_churned_user_dates') }} churned_user_dates on date_series.date between churned_user_dates.churn_start_date and churned_user_dates.churn_end_date
    limit 10
)

, final as (
    select 
        date
        , sum(is_active) as active_users
        , sum(is_churned) as churned_users
    from user_activity_summary
    group by date
    limit 10

    )

select * from final
