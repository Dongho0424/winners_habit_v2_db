-- -- Project Winner's habit -- --
-- API query
-- ver 0.0.0

-- -------------------------------------------------------
-- pre description --
-- ex(t) : ex is table

-- -------------------------------------------------------
/*
api #
--- 쿼리 설명 ---
--- API 설명 ---		
*/   

/*
api #1

--- 쿼리 설명 ---
첫번째 쿼리: 현재 진행중인 챌린지가 있으면 1 리턴. 없으면 0 리턴
두번째 쿼리: 현재 유저의 챌린지 자체의 여러 정보를 긁어옴 (긁어올 정보: 챌린지 이름, 챌린지 디데ㅇ, ㅊㄴ)
세번째 쿼리: user의 challenge의 속한 모든 습관 가져오기

--- API 설명 ---
첫번째 쿼리 바탕으로 리턴된 값을 바탕으로 만약 0이 리턴되었다면 현재 챌린지 없는 것
따라서 result: false 리턴
첫번째 쿼리에서 1이 리턴되었더라면
두번째 쿼리에서 챌린지 자체의 정보 가져오고
세번째 쿼리애서 챌린지에 속한 모든 습관들 가져오기.
자세한 res 양식은 notion
*/  

SELECT COUNT(end_flag) FROM challenge_has_user
WHERE user_id = userId AND end_flag = 0; -- return 1 or 0
-- ------------
SELECT c.challenge_name, c.d_day
FROM challenge_has_user AS chu
	JOIN challenge      AS c ON c.id = chu.challenge_id
WHERE user_id = userId AND end_flag = 0;
-- ------------

SELECT 
	h.id, h.habit_name, h.icon, h.color, h.default_attribute_value,
    a.attribute, uhh.alarm_flag, uhh.alarm_time
FROM challenge_has_habit AS chh
	JOIN habit           AS h   ON h.id = chh.habit_id
    JOIN user_has_habit  AS uhh ON uhh.challenge_habit_id = chh.id
    JOIN attribute       AS a   ON a.id = h.attribute_id
WHERE chh.challenge_id = (
	SELECT challenge_id
	FROM challenge_has_user chu
	WHERE user_id = userId AND end_flag = 0 ) 
    AND
    uhh.user_id = userId;

/*
api #2
--- 쿼리 설명 ---
첫번째 쿼리: 해당 습관에 해당하는 모든 데이터 가져오기
두번째 쿼리: 해당 습관의 각 날짜별 데이터 가져오기
--- API 설명 ---		
첫번째 쿼리와 두번째 쿼리 모두 그저 데이터를 가져오는 역할
두개로 나눈 이유는 두번째 쿼리는 각 날짜별 done_flag를 다 긁어오는거라 나누는 것이 더 이쁠거라 생각.
*/   
SELECT 
	uhh.id, chu.create_date,
    uhh.`time`, uhh.alarm_flag, uhh.alarm_time, uhh.alarm_music, uhh.alarm_haptic,
    uhh.repeat_mon, uhh.repeat_tue, uhh.repeat_wed,
    uhh.repeat_thu, uhh.repeat_fri, uhh.repeat_sat, uhh.repeat_sun, uhh.memo
FROM     user_has_habit      AS uhh
	JOIN challenge_has_habit AS chh ON chh.id = uhh.challenge_habit_id
	JOIN challenge           AS c   ON c.id = chh.challenge_id
    JOIN challenge_has_user  AS chu ON chu.challenge_id = c.id
WHERE uhh.user_id = 1 
	AND
    chh.habit_id = 1
    AND
    chu.user_id = 1
	AND
    chh.challenge_id = (
	SELECT challenge_id
	FROM challenge_has_user chu
	WHERE user_id = 1 AND end_flag = 0 ); 
    
SELECT `date`, done_flag
FROM habit_history AS hh
	JOIN user_has_habit      AS uhh ON uhh.id = hh.user_habit_id
    JOIN challenge_has_habit AS chh ON chh.id = uhh.challenge_habit_id
WHERE 
	uhh.user_id = 1
    AND
    chh.habit_id = 1
    AND
    chh.challenge_id = (
	SELECT challenge_id
	FROM challenge_has_user chu
	WHERE user_id = 1 AND end_flag = 0 ); 
    
/*
api #3
--- 쿼리 설명 ---

--- API 설명 ---		
모든 winner 나오는 페이지
*/   

SELECT id, `name`
FROM winner







