CREATE TABLE `article_like`(
	`id`			BIGINT			NOT NULL	AUTO_INCREMENT	COMMENT '시퀀스',
	`member_id`		BIGINT			NOT NULL					COMMENT '좋아요를 누른 사람 시퀀스',
	`article_id`	BIGINT			NOT NULL					COMMENT '좋아요를 누른 게시물 시퀀스',
	`register_date` TIMESTAMP		NOT NULL					COMMENT '좋아요를 누른 시간',
	PRIMARY KEY(`id`)
);

ALTER TABLE `article_like` ADD CONSTRAINT `FK_article_TO_article_like`
FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ;

ALTER TABLE `article_like` ADD CONSTRAINT `FK_member_TO_article_like`
FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE ;

ALTER TABLE `article_like` ADD CONSTRAINT `UNIQUE_COMPOSIT_KEY` UNIQUE (`member_id`, `article_id`);