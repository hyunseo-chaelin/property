USE propertyDB;

DROP TABLE IF EXISTS property;

CREATE TABLE IF NOT EXISTS property (
	b_id VARCHAR(10) NOT NULL,
	b_name VARCHAR(40),
	b_kind VARCHAR(10),
	b_condition ENUM('매매', '전세', '월세/렌트'),
	b_unitPrice VARCHAR(20),
	b_description TEXT,
	b_city VARCHAR(10),
	b_district VARCHAR(10),
	b_area VARCHAR(20),
	b_fileName VARCHAR(20),
	PRIMARY KEY (b_id)
) DEFAULT CHARSET=utf8;

show tables;
DESC property;
SELECT * FROM property;

DELETE FROM property WHERE b_id='PROP1645';

