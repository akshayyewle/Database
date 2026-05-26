
/*

https://www.kdnuggets.com/sql-window-functions-beyond-basics-solving-real-business-problems 

https://platform.stratascratch.com/coding/2131-user-streaks 

                    SESSIONIZATION (GAPS & ISLANDS) PROBLEM
Recruiters: Linkedin & Meta

Provided a table with user ID and the dates they visited the platform, find the top 3 users with the 
longest continuous streak of visiting the platform up to August 10, 2022. Output the user ID and the 
length of the streak.

In case of a tie, display all users with the top three longest streak lengths.

*/

WITH 

unique_visits AS (
    SELECT DISTINCT user_id, date_visited
    FROM kdnuggets.user_streaks
    WHERE date_visited <= '2022-08-10'
),

streak_flags AS (
    SELECT *,
        CASE
            WHEN (date_visited - LAG(date_visited) OVER(PARTITION BY user_id ORDER BY date_visited)) = 1 THEN 0
            ELSE 1
        END AS new_streak_flag
    FROM unique_visits 
),

streak_ids AS (
    SELECT *,
        SUM(new_streak_flag) OVER(PARTITION BY user_id ORDER BY date_visited) AS streak_id
    FROM streak_flags
),

streak_lengths AS (
    SELECT user_id, streak_id, COUNT(*) AS streak_length
    FROM streak_ids
    GROUP BY user_id, streak_id
),

longest_streaks_per_user AS (
    SELECT user_id, MAX(streak_length) AS longest_streak
    FROM streak_lengths
    GROUP BY user_id
),

longest_streaks_with_rank AS (
    SELECT user_id
        , longest_streak
        , DENSE_RANK() OVER(ORDER BY longest_streak DESC) AS longest_streak_len_rank
    FROM longest_streaks_per_user
)

SELECT *
FROM longest_streaks_with_rank
WHERE longest_streak_len_rank <= 3
ORDER BY longest_streak_len_rank ASC, user_id ASC 