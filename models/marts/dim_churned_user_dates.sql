{{ config(
    materialized = 'incremental'
    , on_schema_change = 'append_new_column'
    , tags = ['user']
)
}}

with active_user_dates as (
    select * from {{ ref('dim_active_user_dates') }}
    where true
    limit 100
)

, final as (
    select 
        a.user_id
        , a.end_date + INTERVAL '1 day' AS churn_start_date
        , a.end_date + INTERVAL '28 days' AS churn_end_date
    from active_user_dates a
    left join active_user_dates b on a.user_id = b.user_id and b.start_date between a.start_date and a.end_date + INTERVAL '28 days'
    where b.user_id is null
    
    limit 100
)

select * from final
limit 100
