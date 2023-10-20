{{ config(
    materialized = 'incremental'
    , on_schema_change = 'append_new_column'
    , tags = ['user']
)
}}

with tasks_used as (
    select * from {{ source('shiny_indigo', 'tasks_used') }}
    where true
    {% if is_incremental() %}
        and date >= (select max(date) from {{ this }})
    {% endif %}
)

, final as (
    select 
        date
        , user_id
        , account_id
        , zap_id
        , min_timestamp
        , tasks_used
        , errors
    from tasks_used
)

select * from final
