SHOW VARIABLES LIKE "secure_file_priv";
-- Find out which folder to put this file in.

-- Upload data playground
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\playground.csv' INTO TABLE playground
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(playgroundId,playgroundName,playgroundAddress,worktime,sportId,price,@d,@p)
SET description = NULLIF(@d,''),
phone = NULLIF(@p,'');

-- Upload data sportSection
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\sportSection.csv' INTO TABLE sportSection
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(sectionId,coachId,sectionName ,price,sectionAddress,worktime,@d,sportId ,@p)
SET description = NULLIF(@d,''),
phone = NULLIF(@p,'');

-- Upload data users
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\users.csv' INTO TABLE users
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(userId,userName,userSurname,userEmail,password,phone);

