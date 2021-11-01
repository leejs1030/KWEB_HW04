CREATE TABLE `users` (
	`id` varchar(20) NOT NULL,
	`pw` varchar(20) NOT NULL,
	`name` varchar(40) NOT NULL,
	`img_link` varchar(40),
	`statusmsg` varchar(40),
	`exit` TINYINT(1) DEFAULT 0 NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
	`name` varchar(40) NOT NULL,
	`owner` varchar(20) NOT NULL,
	`link` varchar(40) NOT NULL,
	`capacity` INT NOT NULL,
	`exit` TINYINT(1) DEFAULT 0 NOT NULL,
	`created_date` DATE NOT NULL,
	PRIMARY KEY(`link`),
	FOREIGN KEY (`owner`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats`(
	`chatmsg` varchar(100) NOT NULL,
	`sender` varchar(20) NOT NULL,
	`channel` varchar(40) NOT NULL,
	`date` DATE NOT NULL,
	FOREIGN KEY (`sender`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`channel`) REFERENCES `channels`(`link`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
	`follower` varchar(20) NOT NULL,
	`followee` varchar(20) NOT NULL,
	`follow_date` DATE NOT NULL,
	PRIMARY KEY	(`follower`, `followee`),
	FOREIGN KEY (`followee`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
	`blocker` varchar(20) NOT NULL,
	`blockee` varchar(20) NOT NULL,
	`block_date` DATE NOT NULL,
	PRIMARY KEY	(`blocker`, `blockee`),	
	FOREIGN KEY (`blockee`) REFERENCES `users`(`id`) ON DELETE CASCADE,
	FOREIGN KEY (`blocker`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;