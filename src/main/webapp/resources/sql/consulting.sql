CREATE TABLE consulting (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    investmentGoal VARCHAR(255) NOT NULL,
    budget VARCHAR(30) NOT NULL,
    additionalRequests TEXT,
    created_at varchar(50)
);

SELECT * FROM consulting;
