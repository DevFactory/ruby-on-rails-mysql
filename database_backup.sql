CREATE DATABASE IF NOT EXISTS my_app_development;
USE my_app_development;
DROP PROCEDURE IF EXISTS init;
DELIMITER //
CREATE PROCEDURE init ()
LANGUAGE SQL
  BEGIN
    DECLARE user_exist, data_present INT;
    SET user_exist = (SELECT EXISTS (SELECT DISTINCT user FROM mysql.user WHERE user = "db_user"));
    IF user_exist = 0 THEN
      CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'db_pass';
      GRANT ALL PRIVILEGES ON my_app_development.* TO 'db_user'@'localhost';
      FLUSH PRIVILEGES;
    END IF;
    CREATE TABLE IF NOT EXISTS dogs (
      id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(64),
      motto VARCHAR(64)
    );
    SET data_present = (SELECT COUNT(*) FROM dogs);
    IF data_present = 0 THEN
      INSERT INTO dogs (name, motto) VALUES
        ('Nala', 'Born to be wild'),
        ('Alex','Calm as can be'),
        ('Leroy','Life of the pawty');
    END IF;
  END;//
DELIMITER ;
CALL init();
