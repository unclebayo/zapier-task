{{ config(
    materialized = 'incremental'
    , on_schema_change = 'append_new_column'
    , tags = ['user']
)
}}

with tasks_used as (
    select * from {{ ref('stg_tasks_used') }}
    where true
)

, final as (
    select 
        user_id
        , date as start_date
        , date + INTERVAL '27 days' AS end_date
    from tasks_used
    where tasks_used > 0
    group by user_id, date
)

select * from final
