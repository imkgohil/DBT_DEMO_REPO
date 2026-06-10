WITH CTE AS
(SELECT
    t.*,
    w.*
 FROM 
    {{ ref('trip_fact') }} t 
    LEFT JOIN {{ ref('daily_weather') }} w 
        on t.trip_date = w.daily_weather
 ORDER BY 
    TRIP_DATE DESC
 )
 SELECT 
    * 
 FROM 
    CTE