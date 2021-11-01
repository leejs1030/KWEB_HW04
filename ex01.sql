CREATE TABLE student(
	`name` VARCHAR(20) NOT NULL,
	`year` CHAR(4) NOT NULL,
	`major` CHAR(3) NOT NULL,
	`idnumber` CHAR(3) NOT NULL,
	`phone_number` CHAR(13) NOT NULL,
	`address` VARCHAR(20) NOT NULL,
	`total_credit` INT NOT NULL DEFAULT 0,
	`GPA` DOUBLE NOT NULL,
	`attending` TINYINT(1) NOT NULL DEFAULT 1,
	PRIMARY KEY (`year`, `major`, `idnumber`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;