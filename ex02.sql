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

CREATE TABLE `chats`(# --을 주석으로 알려주셨지만, 왜인지 저는 #을 써야 주석이 동작합니다..
	#기본 키가 없다고 생각됩니다. unique하게 만들 수가 없는 것 같습니다.
	#동일한 날짜에 동일한 채널에 동일한 사람이 동일한 메시지를 보내는 경우가 있을 수 있어 보입니다.
	#또한 메시지의 삭제/수정 기능을 제공하는 경우에도 key가 변경될 수 있다는 점에서 primary key와는 거리가 있는 것 같습니다..

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