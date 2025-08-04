{{ config(materialized='view') }}

with source as (
    select * from {{ source('public', 'customers') }}
)

select
    id as customer_id,
    concat(first_name || ' ' || last_name) AS full_name,
    email,
    gender,
    age::integer,
    country AS country_code,
  CASE country
    WHEN 'AZ' THEN 'Azerbaijan'
    WHEN 'GL' THEN 'Greenland'
    WHEN 'FM' THEN 'Micronesia'
    WHEN 'RU' THEN 'Russia'
    WHEN 'CA' THEN 'Canada'
    WHEN 'PE' THEN 'Peru'
    WHEN 'CZ' THEN 'Czech Republic'
    WHEN 'US' THEN 'United States'
    WHEN 'KR' THEN 'South Korea'
    WHEN 'FR' THEN 'France'
    WHEN 'YE' THEN 'Yemen'
    WHEN 'JP' THEN 'Japan'
    WHEN 'VE' THEN 'Venezuela'
    WHEN 'NZ' THEN 'New Zealand'
    WHEN 'SL' THEN 'Sierra Leone'
    WHEN 'LV' THEN 'Latvia'
    WHEN 'IR' THEN 'Iran'
    WHEN 'CN' THEN 'China'
    WHEN 'HU' THEN 'Hungary'
    WHEN 'GE' THEN 'Georgia'
    WHEN 'PH' THEN 'Philippines'
    WHEN 'ME' THEN 'Montenegro'
    WHEN 'AR' THEN 'Argentina'
    WHEN 'NC' THEN 'New Caledonia'
    WHEN 'CD' THEN 'Congo (Democratic Republic)'
    WHEN 'GA' THEN 'Gabon'
    WHEN 'ID' THEN 'Indonesia'
    WHEN 'MN' THEN 'Mongolia'
    WHEN 'BR' THEN 'Brazil'
    WHEN 'AM' THEN 'Armenia'
    WHEN 'PL' THEN 'Poland'
    WHEN 'UA' THEN 'Ukraine'
    WHEN 'MY' THEN 'Malaysia'
    WHEN 'DO' THEN 'Dominican Republic'
    WHEN 'PT' THEN 'Portugal'
    WHEN 'MV' THEN 'Maldives'
    WHEN 'BA' THEN 'Bosnia and Herzegovina'
    WHEN 'IL' THEN 'Israel'
    WHEN 'TH' THEN 'Thailand'
    WHEN 'BG' THEN 'Bulgaria'
    WHEN 'GB' THEN 'United Kingdom'
    WHEN 'CU' THEN 'Cuba'
    WHEN 'BY' THEN 'Belarus'
    WHEN 'MA' THEN 'Morocco'
    WHEN 'AL' THEN 'Albania'
    WHEN 'MK' THEN 'North Macedonia'
    WHEN 'SE' THEN 'Sweden'
    WHEN 'SY' THEN 'Syria'
    WHEN 'GH' THEN 'Ghana'
    WHEN 'CO' THEN 'Colombia'
    WHEN 'SA' THEN 'Saudi Arabia'
    ELSE 'Unknown'
  END AS country_name,
    signup_date::date
from source
