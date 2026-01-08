-- =====================================================
-- question 1: total revenue and total number of unique customers
-- =====================================================

select 
    count(distinct customerid) as total_customers,
    sum(quantity * unitprice) as total_revenue
from retail_data;


-- =====================================================
-- question 2: average order value
-- =====================================================

select 
    round(sum(quantity * unitprice) /
    count(distinct invoiceno),2) as average_order_value
from retail_data;


-- =====================================================
-- question 3: one-time vs repeat customers (percentage)
-- =====================================================

with total as (
    select customerid, count(distinct invoiceno) as total_orders
    from retail_data
    group by customerid
)

select
    case when total_orders = 1 then 'One Time' else 'Repeat' end as customer_type,
    round(count(*) * 100.0 / sum(count(*)) over (), 2) as percentage
from total
group by customer_type;


-- =====================================================
-- question 4: new customer acquisition (monthly)
-- =====================================================

with first_purchase as (
    select customerid,
    date_trunc('month', min(invoicedate)) as cohort_month
    from retail_data
    group by customerid
)

select cohort_month,
count(customerid) as new_customers
from first_purchase
group by cohort_month
order by cohort_month;


-- =====================================================
-- question 5: customers inactive in last 3 months
-- =====================================================

with last_purchase as (
    select customerid,
    max(invoicedate) as last_purchase_date
    from retail_data
    group by customerid
)

select count(*) as churned_customers
from last_purchase
where last_purchase_date < (
    select max(invoicedate) - interval '3 months'
    from retail_data
);


-- =====================================================
-- question 6: top 5 countries by revenue
-- =====================================================

select country,
sum(quantity * unitprice) as total_revenue
from retail_data
group by country
order by total_revenue desc
limit 5;


-- =====================================================
-- question 7: monthly revenue trend
-- =====================================================

select date_trunc('month', invoicedate) as month,
sum(quantity * unitprice) as monthly_revenue
from retail_data
group by month
order by month;


-- =====================================================
-- question 8: top customers by revenue
-- =====================================================

select customerid,
sum(unitprice * quantity) as total_revenue
from retail_data
group by customerid
order by total_revenue desc
limit 10;
