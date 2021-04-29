
CREATE TABLE attribute (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    attribute VARCHAR(20) NOT NULL
);

CREATE TABLE winner (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    info VARCHAR(200) NOT NULL
);

ALTER TABLE winner MODIFY COLUMN info VARCHAR(1000) NOT NULL;

CREATE TABLE `habit` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `habit_name` VARCHAR(20) NOT NULL,
    `icon` VARCHAR(50) NOT NULL,
    `color` VARCHAR(10) NOT NULL,
    `attribute_id` INTEGER NOT NULL,
    `winner_id` INTEGER NOT NULL,
    FOREIGN KEY(`attribute_id`) REFERENCES attribute(id),
    FOREIGN KEY(`winner_id`) REFERENCES winner(id)
);

ALTER TABLE habit MODIFY COLUMN icon VARCHAR(200) NOT NULL;
ALTER TABLE habit ADD COLUMN default_attribute_value INT;
ALTER TABLE habit ADD COLUMN `desc` VARCHAR(300);

CREATE TABLE challenge (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    d_day INTEGER NOT NULL
);

ALTER TABLE challenge ADD COLUMN challenge_name VARCHAR(15) NOT NULL;

CREATE TABLE `user` (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pw VARCHAR(20) NOT NULL,
	`user_name` VARCHAR(20) NOT NULL,
    `df_alarm_music` VARCHAR(20) NOT NULL,
    `df_alarm_haptic` VARCHAR(20) NOT NULL
);

ALTER TABLE `user` DROP `df_alarm_music`;
ALTER TABLE `user` DROP `df_alarm_haptic`;

CREATE TABLE challenge_has_habit (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    habit_id INTEGER NOT NULL,
    challenge_id INTEGER NOT NULL,
    `desc` VARCHAR(50) NOT NULL,
	FOREIGN KEY(`habit_id`) REFERENCES habit(id),
    FOREIGN KEY(`challenge_id`) REFERENCES challenge(id)
);

ALTER TABLE `challenge_has_habit` DROP `desc`;

CREATE TABLE achv (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    achv_name VARCHAR(10) NOT NULL,
    `desc` VARCHAR(100) NOT NULL
);

ALTER TABLE achv ADD reward VARCHAR(100) NOT NULL;
ALTER TABLE achv ADD icon VARCHAR(100) NOT NULL;

ALTER TABLE `achv` DROP `reward`;

CREATE TABLE grade (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    grade_name VARCHAR(10) NOT NULL,
    `picture` VARCHAR(50) NOT NULL
);

ALTER TABLE grade MODIFY COLUMN `picture` VARCHAR(200) NULL;
	
CREATE TABLE user_has_grade (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `grade_id` INTEGER NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`grade_id`) REFERENCES `grade`(id)
);

CREATE TABLE user_has_achv (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `achv_id` INTEGER NOT NULL,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`achv_id`) REFERENCES `achv`(id)
);

CREATE TABLE challenge_has_user (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `challenge_id` INTEGER NOT NULL,
    create_date DATETIME NOT NULL,
    end_flag TINYINT(1) NOT NULL DEFAULT 0,
    complete_flag TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`challenge_id`) REFERENCES `challenge`(id)
);

CREATE TABLE challenge_comment (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `challenge_id` INTEGER NOT NULL,
    create_date DATETIME NOT NULL,
    update_date DATETIME,
    `like` INTEGER NOT NULL DEFAULT 0,
    `unlike` INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`challenge_id`) REFERENCES `challenge`(id)
);

CREATE TABLE user_has_habit (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `user_id` INTEGER NOT NULL,
    `challenge_habit_id` INTEGER NOT NULL,
    alarm_time TIME,
    alarm_music VARCHAR(50),
    alarm_haptic VARCHAR(50),
    repeat_mon TINYINT(1) NOT NULL DEFAULT 0, 
    repeat_tue TINYINT(1) NOT NULL DEFAULT 0,
    repeat_wed TINYINT(1) NOT NULL DEFAULT 0,
    repeat_thu TINYINT(1) NOT NULL DEFAULT 0,
    repeat_fri TINYINT(1) NOT NULL DEFAULT 0,
    repeat_sat TINYINT(1) NOT NULL DEFAULT 0,
    repeat_sun TINYINT(1) NOT NULL DEFAULT 0,
    memo VARCHAR(500),
    update_time DATETIME,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`challenge_habit_id`) REFERENCES `challenge_has_habit`(id)
);

ALTER TABLE user_has_habit ADD COLUMN alarm_flag TINYINT(1) NOT NULL DEFAULT 1;

CREATE TABLE table_history (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_habit_id INTEGER NOT NULL,
    `date` DATE NOT NULL,
	`done_flag` TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (user_habit_id) REFERENCES `user_has_habit`(id)
);

ALTER TABLE table_history RENAME habit_history;



