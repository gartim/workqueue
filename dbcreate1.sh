#!/bin/bash
mysql -D wq --password="wq" -e "
 	drop table if exists wq;
 	drop table if exists wql;
 	drop table if exists wqlog;
	CREATE TABLE IF NOT EXISTS wql (
		wql_id int(11) NOT NULL AUTO_INCREMENT,
		wql_name varchar(32) NOT NULL,
		UNIQUE KEY (wql_name),
		PRIMARY KEY (wql_id)
	) ENGINE=INNODB;
	CREATE TABLE IF NOT EXISTS wq (
		wq_id int(11) NOT NULL AUTO_INCREMENT,
		wq_wql_id int(11) NOT NULL,
		wq_jobid int(11) DEFAULT NULL,
		wq_datetime  datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
		wq_var1 varchar(255) NOT NULL,
		wq_var2 varchar(255) NOT NULL,
		wq_var3 varchar(255) NOT NULL,
		PRIMARY KEY (wq_id),
		FOREIGN KEY (wq_wql_id) REFERENCES wql(wql_id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
	) ENGINE=INNODB;
	CREATE TABLE IF NOT EXISTS wqlog (
		wqlog_id        int(11) NOT NULL AUTO_INCREMENT,
		wqlog_datetime  datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
		wqlog_name      varchar(255) NOT NULL,
		wqlog_action    varchar(255) NOT NULL,
		wqlog_options   BLOB,
		index(wqlog_name),
		PRIMARY KEY (wqlog_id)
	) ENGINE=INNODB;
	SHOW CREATE TABLE wq;
	SHOW CREATE TABLE wql;
	SHOW CREATE TABLE wqlog;
"
