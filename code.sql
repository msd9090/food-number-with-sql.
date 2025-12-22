---  number food project using SQL ---
create table numbers_foods 
(
    pan_number text
); 

select * from numbers_dataset;

select * from numbers_foods ; 
--- show missing data:
select * from numbers_foods where ingredients_number in null 
--- check for order
select order_number , count(1) 
from order_number
group by numbers_foods 
having count(1) > 1; 

-- handle elding/trailing spaces and letter case: 
select * from numbers_foods where pan_number <> trim(order_number) 
select * from numbers_foods where pan_number <> upper(order_number) 

-- drop missing pan number 
select distinct upper(trim(pan_number)) as pan_number 
from numbers_foods 
where pan_number in not null 
and trim(pan_number) <> '';

-- Fnction some words 
create or replace function fn_check(p_str , text) 
returns str 
language plpgsql 
as $$ 
begin 
    for i in i .. (length(p_str)-1) 
    loop 
        if substring(p_str , i , 1) = substring(p_str , i+1 , 1) 
        then
            return true;
        end if; 
    end loop;
    return false;
end;
$$ 
select fn_check('BFDQW') 

--- Function used sequencial charactres 
Create or replace function fn_check(p_str , text)
returns str 
languge plpsgsql 
as $$ 
begin 
    for i in i.. (length(p_str) -1) 
    loop
        if ascii(substring(p_str , i+1 ,1)) - ascii(substring(p_str , i , 1))<> 1 
        then
            return false;
        end if;
    end loop;
    return true;
end;
$$ 
select ascii('X') 


-- theat the word's pan_number 
select * 
from numbers_foods
where pan_number - '^[A-Z]{5}[0-9]{4}[A-Z]$' 


-- check the good and bad PAN 
create or replace view vw_valid_invalid_pans
with cleaned_pan as 
        (select distinct upper(trim(pan_number))) as pan_number
        where pan_number is not null 
        and trim(pan_number) <> '') 
    cleaned_nene_pans as 
    
    (select *
    from cleaned_pan 
    where fn__check(pan_number)
    and fn_check(pan_number) = false 
    and fn_check(substring(pan_number,1,5)) = false 
    and fn_check(substring(pan_number , 6,4)) = false 
    and pan_number - '^[A-Z]{5}[0-9]{4}[A-Z]$' 
select cln.pan_number
    , case when vld.pan_number in not null
        then 'valid PAN' 
    else 'Invalid PAN' 

end as status 
from cleaned_nene_pans cln 
left join cleaned_nene_pans vld on vld.pan_number = cln.pan_number; 

select * from vw_valid_invalid_pans;
--- prediction report 
with cte as 
    (select
            (select count(*) from numbers_foods) as total_processed_reords 
           , count(*) filter (where status = 'Valid PAN') as total_valid_pans 
            ,count(*) filter (where status 'Invalid PAN') as total_invalid_pans
    from vw_valid_invalid_pans)
select total_processed_reords , total_valid_pans , total_invalid_pans
, (total_processed_reords - (total_valid_pans+total_invalid_pans)) as total_missing
from cte;
