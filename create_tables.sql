DROP DATABASE `winners habit`;
CREATE DATABASE `winners habit`;
USE `winners habit`;


CREATE TABLE attribute (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    attribute VARCHAR(20) NOT NULL
);

CREATE TABLE winner (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    info VARCHAR(1000) NOT NULL,
    picture VARCHAR(500) NULL
);

CREATE TABLE `habit` (
	`id` INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `habit_name` VARCHAR(20) NOT NULL,
    `icon` VARCHAR(200) NOT NULL,
    `color` VARCHAR(10) NOT NULL,
    `attribute_id` INTEGER NOT NULL,
    `winner_id` INTEGER NOT NULL,
    default_attribute_value INT,
    `desc` VARCHAR(300),
    FOREIGN KEY(`attribute_id`) REFERENCES attribute(id),
    FOREIGN KEY(`winner_id`) REFERENCES winner(id)
);

CREATE TABLE challenge (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    d_day INTEGER NOT NULL,
    challenge_name VARCHAR(15) NOT NULL,
    image VARCHAR(500) NOT NULL
);

CREATE TABLE `user` (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pw VARCHAR(20) NOT NULL,
	`user_name` VARCHAR(20) NOT NULL
);
CREATE TABLE challenge_has_habit (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    habit_id INTEGER NOT NULL,
    challenge_id INTEGER NOT NULL,
	FOREIGN KEY(`habit_id`) REFERENCES habit(id),
    FOREIGN KEY(`challenge_id`) REFERENCES challenge(id)
);

CREATE TABLE achv (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    achv_name VARCHAR(10) NOT NULL,
    `desc` VARCHAR(100) NOT NULL,
    icon VARCHAR(100)
);

CREATE TABLE grade (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    grade_name VARCHAR(10) NOT NULL,
    `picture` VARCHAR(200) NULL
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
    alarm_flag TINYINT(1) NOT NULL DEFAULT 1,
    `time` TIME,
    FOREIGN KEY(`user_id`) REFERENCES `user`(id),
    FOREIGN KEY(`challenge_habit_id`) REFERENCES `challenge_has_habit`(id)
);


CREATE TABLE habit_history (
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_habit_id INTEGER NOT NULL,
    `date` DATE NOT NULL,
	`done_flag` TINYINT(1) NOT NULL DEFAULT 0,
    FOREIGN KEY (user_habit_id) REFERENCES `user_has_habit`(id)
);



