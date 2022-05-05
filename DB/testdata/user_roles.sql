#admin role
CREATE USER 'john'@'localhost' IDENTIFIED BY 'johnpassword';


CREATE ROLE 'admin'@'localhost';
GRANT ALL PRIVILEGES ON cheers_dinein_experience.* TO 'admin'@'localhost';
GRANT 'admin'@'localhost' TO 'john'@'localhost';
SET default role 'admin'@'localhost' TO 'john'@'localhost';



