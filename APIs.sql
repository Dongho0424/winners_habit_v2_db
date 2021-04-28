-- -- Project Winner's habit -- --
-- API query
-- ver 0.0.0

-- -------------------------------------------------------
-- pre description --
-- ex(t) : ex is table

-- -------------------------------------------------------
-- api #
-- desc:   
-- method: 
-- url:    
-- res:    

-- api #1
-- method: GET
-- url:    /challenge?user_id={userId}
--         winnerId: PK of winner(t)

-- 첫번째 쿼리: 현재 진행중인 챌린지가 있으면 1 리턴. 없으면 0 리턴
-- 두번째 쿼리: 앞 쿼리에서 리턴이 0이었으면 
-- 1 이었으면 result: true, 그리고 모든 habit들 리턴

-- res: {result: Bool}

SELECT COUNT(end_flag) as result FROM challenge_has_user
WHERE user_id = 2 AND end_flag = 0; -- return true









