INSERT INTO `user` (id, pw, user_name)
	VALUES (1, "1234", "최동호");    
INSERT INTO `user` (id, pw, user_name)
	VALUES (2, "1234", "김강민");
INSERT INTO `user` (id, pw, user_name)
	VALUES (3, "1234", "문강호");
INSERT INTO `user` (id, pw, user_name)
	VALUES (4, "1234", "전혁주");
INSERT INTO `user` (id, pw, user_name)
	VALUES (5, "1234", "황재하");
    
INSERT INTO `challenge` (id, d_day, challenge_name)
	VALUES (1, 35, "빌 게이츠");
INSERT INTO `challenge` (id, d_day, challenge_name)
	VALUES (2, 50, "스티브 잡스");
INSERT INTO `challenge` (id, d_day, challenge_name)
	VALUES (3, 40, "최동호");
    
INSERT INTO attribute (id, attribute) VALUES (1, "s/f");
INSERT INTO attribute (id, attribute) VALUES (2, "min");
INSERT INTO attribute (id, attribute) VALUES (3, "pages");
INSERT INTO attribute (id, attribute) VALUES (4, "cups");
INSERT INTO attribute (id, attribute) VALUES (5, "hour");

INSERT INTO `winner` (id, `name`, info) VALUES (1, "빌 게이츠", 
	"전 세계 PC 운영체제 시장의 76.52%를 점유하고
	있는 Windows의 개발사 마이크로소프트의 창업주.
	하버드 대학교를 중퇴하고도 MS-DOS와
	Windows로 성공 신화를 써내려 갔으며, 80~90년
	대에는 IT 업계 하면 가장 먼저 떠오르는 인물일 정
	도로 인기가 있었다. 
    전 세계에서 가장 압도적으로 큰 자선재단을 운영하
	고 있으며, 자녀들에게는 본인 재산의 0.1% 미만만
	을 물려준다는 선언도 화제가 되었다. 또한 전 세계
	부호들에게 기부에 동참할 것을 호소하며, 설득하는
	캠페인은 전 세계에 크게 화제가 되었다. 이제는 기
	부를 실천하는 부호의 상징으로 존경받고 있다.");
INSERT INTO `winner` (id, `name`, info) VALUES (2, "스티브 잡스", 
	"1955년 2월 24일 ~ 2011년 10월 5일)는 미국의 
	기업인이었으며 애플의 전 CEO이자 공동 창립자이다. 
    2011년 10월 5일 췌장암으로 사망했다. 
	1976년 스티브 워즈니악, 로널드 웨인과 함께 애플을 
    공동 창업하고, 애플 2를 통해 개인용 컴퓨터를 
    대중화했다. 또한, GUI와 마우스의 가능성을 
    처음으로 내다보고 애플 리사와 매킨토시에서 이 기술을 도입하였다.");
INSERT INTO `winner` (id, `name`, info) VALUES (3, "최동호", "네 저는 최동호입니다.");


INSERT INTO habit (id, habit_name, icon, color, attribute_id, winner_id, default_attribute_value, `desc`)
	VALUES (1, "새벽 기상", "https://cpng.pikpng.com/pngl/s/61-610145_half-moon-transparent-yellow-half-moon-png-clipart.png"
		, "F5D423", 1, 1, NULL, "빌게이츠 습관 - 독서");
INSERT INTO habit (id, habit_name, icon, color, attribute_id, winner_id, default_attribute_value, `desc`)
	VALUES (2, "운동", "https://w7.pngwing.com/pngs/416/969/png-transparent-kaatsu-exercise-pictogram-strength-training-others-thumbnail.png"
		, "FA331B", 2, 1, 20, "빌게이츠 습관 - 운동");
INSERT INTO habit (id, habit_name, icon, color, attribute_id, winner_id, default_attribute_value, `desc`)
	VALUES (3, "독서", "https://icons555.com/images/icons-blue/image_icon_book_pic_512x512.png"
		, "2B42F5", 3, 1, 20, "빌게이츠 습관 - 독서");
INSERT INTO habit (id, habit_name, icon, color, attribute_id, winner_id, default_attribute_value, `desc`)
	VALUES (4, "새벽 기상", "https://cpng.pikpng.com/pngl/s/61-610145_half-moon-transparent-yellow-half-moon-png-clipart.png"
		, "F5D423", 1, 2, NULL, "스티브잡스 습관 - 독서");
INSERT INTO habit (id, habit_name, icon, color, attribute_id, winner_id, default_attribute_value, `desc`)
	VALUES (5, "운동", "https://w7.pngwing.com/pngs/416/969/png-transparent-kaatsu-exercise-pictogram-strength-training-others-thumbnail.png"
		, "FA331B", 2, 2, 20, "스티브잡스 습관 - 운동");

INSERT INTO challenge_has_habit (id, habit_id, challenge_id)
	VALUES (1, 1, 1);
INSERT INTO challenge_has_habit (id, habit_id, challenge_id)
	VALUES (2, 2, 1);
INSERT INTO challenge_has_habit (id, habit_id, challenge_id)
	VALUES (3, 3, 1);
INSERT INTO challenge_has_habit (id, habit_id, challenge_id)
	VALUES (4, 4, 2);
INSERT INTO challenge_has_habit (id, habit_id, challenge_id)
	VALUES (5, 5, 2);

--
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (6, 1, 1, "2021-04-24 09:27:00", 0, 0);
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (1, 2, 1, "2021-01-25 17:37:00", 1, 1);
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (2, 2, 2, "2021-04-25 12:27:00", 0, 0);
--
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (3, 3, 1, "2021-02-25 13:17:00", 1, 1);
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (4, 4, 1, "2021-03-25 20:27:00", 0, 0);
INSERT INTO challenge_has_user (id, user_id, challenge_id, create_date, end_flag, complete_flag)
	VALUES (5, 5, 1, "2020-04-15 01:32:00", 1, 0);
    
INSERT INTO challenge_comment (id, user_id, challenge_id, create_date, update_date, `like`, unlike)
	VALUES (1, 2, 1, "2021-04-25 17:37:00", NULL, 10, 1);
INSERT INTO challenge_comment (id, user_id, challenge_id, create_date, update_date, `like`, unlike)
	VALUES (2, 3, 1, "2021-04-24 11:37:00", NULL, 30, 10);

INSERT INTO achv (id, achv_name, `desc`) VALUES (1, "빌 게이츠", "빌 게이츠 챌린지를 마치셨습니다. ㅊㅋ");
INSERT INTO achv (id, achv_name, `desc`) VALUES (2, "스티브 잡스", "스티브 잡스 챌린지를 마치셨습니다. ㅊㅋ");
INSERT INTO achv (id, achv_name, `desc`) VALUES (3, "얼리버드", "적기 귀찮아");
INSERT INTO achv (id, achv_name, `desc`) VALUES (4, "책벌레", "적기 귀찮아");
INSERT INTO achv (id, achv_name, `desc`) VALUES (5, "헬창", "적기 귀찮아");
INSERT INTO achv (id, achv_name, `desc`) VALUES (6, "독서 입문자", "적기 귀찮아");
INSERT INTO achv (id, achv_name, `desc`) VALUES (7, "노력왕", "적기 귀찮아");
INSERT INTO achv (id, achv_name, `desc`) VALUES (8, "그냥 줌", "적기 귀찮아");

INSERT INTO grade (id, grade_name, picture) VALUES (1, "갓난아기", "https://png.pngtree.com/png-clipart/20190921/original/pngtree-pink-watercolor-stereo-wind-footprints-of-newborn-babies-png-image_4766496.jpg");
INSERT INTO grade (id, grade_name, picture) VALUES (2, "어린이", "");
INSERT INTO grade (id, grade_name, picture) VALUES (3, "초등학생", "");
INSERT INTO grade (id, grade_name, picture) VALUES (4, "중학생", "");
INSERT INTO grade (id, grade_name, picture) VALUES (5, "고등학생", "");

INSERT INTO user_has_habit 
	(id, user_id, challenge_habit_id, alarm_flag, repeat_mon, repeat_tue, repeat_wed, 
    repeat_thu, repeat_fri, repeat_sat, repeat_sun)
VALUES (1, 1, 1, 0, 0,0,0,0,0,0,0);
INSERT INTO user_has_habit 
	(id, user_id, challenge_habit_id, alarm_flag, repeat_mon, repeat_tue, repeat_wed, 
    repeat_thu, repeat_fri, repeat_sat, repeat_sun)
VALUES (2, 1, 2, 0, 0,0,0,0,0,0,0);
INSERT INTO user_has_habit 
	(id, user_id, challenge_habit_id, alarm_flag, repeat_mon, repeat_tue, repeat_wed, 
    repeat_thu, repeat_fri, repeat_sat, repeat_sun)
VALUES (3, 1, 3, 0, 0,0,0,0,0,0,0);

INSERT INTO user_has_habit 
	(id, user_id, challenge_habit_id, alarm_flag, repeat_mon, repeat_tue, repeat_wed, 
    repeat_thu, repeat_fri, repeat_sat, repeat_sun)
VALUES (4, 2, 1, 0, 0,0,0,0,0,0,0),
		(5, 2, 2, 0, 0,0,0,0,0,0,0),
		(6, 2, 3, 0, 0,0,0,0,0,0,0);

INSERT INTO user_has_habit 
	(id, user_id, challenge_habit_id, alarm_flag, repeat_mon, repeat_tue, repeat_wed, 
    repeat_thu, repeat_fri, repeat_sat, repeat_sun)
VALUES  (7, 2, 4, 0, 0,0,0,0,0,0,0),
		(8, 2, 5, 0, 0,0,0,0,0,0,0);

-- habit_history
INSERT INTO habit_history (id, user_habit_id, `date`, done_flag)
VALUES 
	(1, 1, "2021-04-24", 1),
    (2, 1, "2021-04-25", 1),
    (3, 1, "2021-04-26", 0),
    (4, 1, "2021-04-27", 0),
    (5, 1, "2021-04-28", 0),
    (6, 1, "2021-04-29", 1),
    
	(7, 2, "2021-04-24", 1),
    (8, 2, "2021-04-25", 1),
    (9, 2, "2021-04-26", 1),
    (10, 2, "2021-04-27", 0),
    (11, 2, "2021-04-28", 0),
    (12, 2, "2021-04-29", 1),
    
	(13, 3, "2021-04-24", 1),
    (14, 3, "2021-04-25", 1),
    (15, 3, "2021-04-26", 0),
    (16, 3, "2021-04-27", 1),
    (17, 3, "2021-04-28", 0),
    (18, 3, "2021-04-29", 0);






