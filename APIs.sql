-- -- Project Winner's habit -- --
-- API query
-- ver 0.0.0

-- -------------------------------------------------------
-- pre description --
-- ex(t) : ex is table

-- -------------------------------------------------------
/*
api #
method: 
url:	
res:
--- 쿼리 설명 ---
--- API 설명 ---		
*/   

/*
api #1

--- 쿼리 설명 ---
첫번째 쿼리: 현재 진행중인 챌린지가 있으면 1 리턴. 없으면 0 리턴
두번째 쿼리: 현재 유저의 챌린지 자체의 여러 정보를 긁어옴 (현재 상태는 긁어올 정보가 챌린지 이름밖에 없어서..)
세번째 쿼리: user의 challenge의 속한 모든 습관 가져오기

--- API 설명 ---
첫번째 쿼리 바탕으로 리턴된 값을 바탕으로 만약 0이 리턴되었다면 현재 챌린지 없는 것
따라서 result: false 리턴
첫번째 쿼리에서 1이 리턴되었더라면
두번째 쿼리에서 챌린지 자체의 정보 가져오고
세번째 쿼리애서 챌린지에 속한 모든 습관들 가져오기.
*/  

SELECT COUNT(end_flag) FROM challenge_has_user
WHERE user_id = 2 AND end_flag = 0; -- return 1 or 0
-- ------------
SELECT c.challenge_name 
FROM challenge_has_user AS chu
	JOIN challenge AS c ON c.id = chu.challenge_id
WHERE user_id = 1 AND end_flag = 0;
-- ------------
SELECT 
	h.id, h.habit_name, h.icon, h.color, h.default_attribute_value,
    uhh.id, uhh.alarm_flag, uhh.alarm_time
FROM challenge_has_habit AS chh
	JOIN habit          AS h   ON h.id = chh.habit_id
    JOIN user_has_habit AS uhh ON uhh.challenge_habit_id = chh.id
WHERE chh.challenge_id = (
	SELECT challenge_id
	FROM challenge_has_user chu
	WHERE user_id = 1 AND end_flag = 0 ) 
    AND
    uhh.user_id = 1;














