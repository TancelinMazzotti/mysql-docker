USE ${MYSQL_DATABASE}

CREATE TABLE IF NOT EXISTS my_table(
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(255)
);