
CREATE DATABASE BucketList;


/* Crate table for users */
CREATE TABLE BucketList.tbl_user (
  user_id BIGINT AUTO_INCREMENT,
  user_name VARCHAR(45) NULL,
  user_username VARCHAR(45) NULL,
  user_password VARCHAR(45) NULL,
  PRIMARY KEY (user_id));

  /* Stored procedure to verify if an user exist in the table */
  DELIMITER $$
  CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(20),
    IN p_username VARCHAR(20),
    IN p_password VARCHAR(20)
  )
  BEGIN
  if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN

  select 'Username Exists !!';

  ELSE

  insert into tbl_user
    (
      user_name,
      user_username,
      user_password
    )
    values
    (
      p_name,
      p_username,
      p_password
    );

    END IF;
    END$$
    DELIMITER ;


/* Stored procedure to validate signin*/
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(
  IN p_username VARCHAR(20)
  )
  BEGIN
      select * from tbl_user where user_username = p_username;
END$$
DELIMITER ;
