USE propertyDB;

DROP TABLE IF EXISTS bookmarks;

CREATE TABLE IF NOT EXISTS bookmarks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    property_id VARCHAR(10) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES member(id),
    FOREIGN KEY (property_id) REFERENCES property(b_id)
) DEFAULT CHARSET=utf8;


show tables;


SELECT * FROM bookmarks;