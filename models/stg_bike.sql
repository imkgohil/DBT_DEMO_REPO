WITH BIKE AS (

select
    RIDE_ID,
    REPLACE(REPLACE(REPLACE(x.STARTED_AT,'"',''), '2023-', '2018-'), '2022-', '2017-') AS STARTED_AT,
    REPLACE(REPLACE(REPLACE(ENDED_AT,'"',''), '2023-', '2018-'), '2022-', '2017-') AS ENDED_AT,
    START_STATION_NAME,
    START_STATIO_ID,
    END_STATION_NAME,
    END_STATION_ID,
    START_LAT,
    START_LNG,
    END_LAT,
    END_LNG,
    MEMBER_CSUAL

from {{ source('demo_source', 'bike') }} x

where RIDE_ID not in ('"bikeid"', '""bikeid""', 'bikeid') 
  and x.STARTED_AT not in ('"starttime"', 'starttime', '""starttime""')
)

select
*
from BIKE