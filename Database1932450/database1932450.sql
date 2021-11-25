-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for database1932450
CREATE DATABASE IF NOT EXISTS `database1932450` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `database1932450`;

-- Dumping structure for table database1932450.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `customer_uuid` char(36) NOT NULL DEFAULT uuid(),
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `address` varchar(25) NOT NULL,
  `city` varchar(25) NOT NULL,
  `province` varchar(25) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL,
  `current_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`customer_uuid`),
  UNIQUE KEY `username` (`username`),
  KEY `firstname` (`firstname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database1932450.customers: ~3 rows (approximately)
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` (`customer_uuid`, `firstname`, `lastname`, `address`, `city`, `province`, `postal_code`, `username`, `password`, `current_datetime`, `modify_datetime`) VALUES
	('3f16a701-a646-11eb-ae8f-84a93eae7e26', 'mansi', 'vakharia', '4560', 'montreal', 'quebec', 'h3x2h6', 'mansi', '123', '2021-04-26 00:17:00', '2021-04-26 00:17:00'),
	('77a7b43c-a6d4-11eb-b71c-84a93eae7e26', 'linus', 'torvald', '1316', 'portland', 'USA', '8353CA', 'linus', '222', '2021-04-26 17:15:03', '2021-04-26 17:15:03'),
	('8f1bb21f-a646-11eb-ae8f-84a93eae7e26', 'harsh', 'bawa', 'lasalle', 'montreal', 'quebec', 'h1z2w3', 'harsh_1', '111', '2021-04-26 00:19:14', '2021-04-26 00:19:14');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;

-- Dumping structure for procedure database1932450.customers_delete
DELIMITER //
CREATE PROCEDURE `customers_delete`(
	IN `p_customer_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#delete one specific customer based on its prmary key
	DELETE FROM customers
	WHERE customer_uuid = p_customer_uuid;

END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_insert
DELIMITER //
CREATE PROCEDURE `customers_insert`(
	IN `p_firstname` VARCHAR(20),
	IN `p_lastname` VARCHAR(20),
	IN `p_address` VARCHAR(25),
	IN `p_city` VARCHAR(25),
	IN `p_province` VARCHAR(25),
	IN `p_postalcode` VARCHAR(7),
	IN `p_username` VARCHAR(12),
	IN `p_password` VARCHAR(255)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#create a stored procedure to insert an employee in database
	#here you don't need the parameter for employee_uuid and current_date_time
	#as system will automatically generate uuid and time of entry(datetime)
	INSERT INTO customers
				(firstname,lastname,address,city,
				 province,postal_code,username,password)
	VALUES   (p_firstname,p_lastname,p_address,p_city,
				 p_province,p_postalcode,p_username,p_password);
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_load
DELIMITER //
CREATE PROCEDURE `customers_load`(
	IN `p_customer_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#select all the data from customers table
	SELECT customer_uuid,firstname,lastname,address,
			 city,province,postal_code,username,password
	FROM customers
	WHERE customer_uuid =p_customer_uuid;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_login
DELIMITER //
CREATE PROCEDURE `customers_login`(
	IN `p_username` VARCHAR(12),
	IN `p_password` VARCHAR(255)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#select data of customer when login
  SELECT *
  FROM customers
  WHERE username=p_username
  			AND password=p_password;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_login_username
DELIMITER //
CREATE PROCEDURE `customers_login_username`(
	IN `p_username` VARCHAR(12)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)
	
	#select customer's username and password when username matches
	SELECT customer_uuid,username,password 
	FROM customers
	WHERE username=p_username;
	
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_select
DELIMITER //
CREATE PROCEDURE `customers_select`()
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)
	
	#select all customers and sort them by lastname,firstname
	SELECT customer_uuid,firstname,lastname,address,city,
          province,postal_code,username,password
   FROM customers
	ORDER BY lastname,firstname;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.customers_update
DELIMITER //
CREATE PROCEDURE `customers_update`(
	IN `p_customer_uuid` CHAR(36),
	IN `p_firstname` VARCHAR(20),
	IN `p_lastname` VARCHAR(20),
	IN `p_address` VARCHAR(25),
	IN `p_city` VARCHAR(25),
	IN `p_province` VARCHAR(25),
	IN `p_postalcode` VARCHAR(7),
	IN `p_username` VARCHAR(12),
	IN `p_password` VARCHAR(255)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)
	
	#you don't need parameter for modify_date_time as there is now() always in sql
 	UPDATE customers
 	SET  
	 	  firstname=p_firstname,
        lastname=p_lastname,
        address=p_address,
        city=p_city,
        province=p_province,
        postal_code=p_postalcode,
        username=p_username,
        password =p_password,
        modify_date_time = NOW()
 	WHERE customer_uuid = p_customer_uuid;

END//
DELIMITER ;

-- Dumping structure for table database1932450.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_uuid` char(36) NOT NULL DEFAULT uuid(),
  `product_code` varchar(12) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `cost_price` decimal(7,2) DEFAULT NULL,
  `current_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`product_uuid`),
  KEY `product_code` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database1932450.products: ~5 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_uuid`, `product_code`, `description`, `price`, `cost_price`, `current_datetime`, `modify_datetime`) VALUES
	('2b9b4d02-a6d3-11eb-b71c-84a93eae7e26', 'pCrayons', 'Soft pastels', 35.00, 30.00, '2021-04-26 17:05:46', '2021-04-26 17:05:46'),
	('4f216322-a6d3-11eb-b71c-84a93eae7e26', 'pBrush', 'Paint Brushes', 100.00, 90.00, '2021-04-26 17:06:46', '2021-04-26 17:06:46'),
	('649e34ed-a6d3-11eb-b71c-84a93eae7e26', 'pStamps', 'Paint Stamps', 120.00, 111.00, '2021-04-26 17:07:22', '2021-04-26 17:07:22'),
	('c2dc8c52-a6d2-11eb-b71c-84a93eae7e26', 'pPencile', 'Coloring pencile set', 20.00, 18.00, '2021-04-26 17:02:50', '2021-04-26 17:02:50'),
	('e7bd1021-a6d3-11eb-b71c-84a93eae7e26', 'pColors', 'Water colors', 150.00, 120.00, '2021-04-26 17:11:02', '2021-04-26 17:11:02');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for procedure database1932450.products_delete
DELIMITER //
CREATE PROCEDURE `products_delete`(
	IN `p_product_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)
	
	# delete one specific product based on its primary key
	DELETE FROM products
 	WHERE product_uuid = p_product_uuid;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.products_insert
DELIMITER //
CREATE PROCEDURE `products_insert`(
	IN `p_product_code` VARCHAR(12),
	IN `p_description` VARCHAR(100),
	IN `p_price` DECIMAL(7,2),
	IN `p_cost_price` DECIMAL(7,2)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	# create a stored procedure to insert an product in database
	# here you don't need the parameter for product_uuid and current_date_time
	#      as system will automatically generate uuid and time of entry(datetime)
	INSERT INTO products
				(product_code,description,price,cost_price)
	VALUES   (p_product_code,p_description,p_price,p_cost_price);

END//
DELIMITER ;

-- Dumping structure for procedure database1932450.products_load
DELIMITER //
CREATE PROCEDURE `products_load`(
	IN `p_product_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#create the procedure for product class(used by buying.php)
	SELECT product_uuid,product_code,description,
			 price,cost_price
	FROM products
	WHERE product_uuid =p_product_uuid;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.products_select
DELIMITER //
CREATE PROCEDURE `products_select`()
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	# select all products and sort them by current date time
	SELECT product_uuid,product_code,description,price,
			 cost_price,current_date_time,modify_date_time
	FROM products
	ORDER BY current_date_time;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.products_update
DELIMITER //
CREATE PROCEDURE `products_update`(
	IN `p_product_uuid` CHAR(36),
	IN `p_product_code` VARCHAR(12),
	IN `p_description` VARCHAR(100),
	IN `p_price` DECIMAL(7,2),
	IN `p_cost_price` DECIMAL(7,2)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)
	
	#you don't need parameter for modify_date_time as there is now() always in sql
 	UPDATE products
 	SET  product_code=p_product_code,
        description=p_description,
        price=p_price,
        cost_price=p_cost_price,
        modify_date_time = NOW()
 	WHERE product_uuid = p_product_uuid;
END//
DELIMITER ;

-- Dumping structure for view database1932450.products_view
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `products_view` (
	`product_code` VARCHAR(12) NOT NULL COLLATE 'utf8mb4_general_ci',
	`description` VARCHAR(100) NOT NULL COLLATE 'utf8mb4_general_ci',
	`price` DECIMAL(7,2) NOT NULL,
	`cost_price` DECIMAL(7,2) NULL
) ENGINE=MyISAM;

-- Dumping structure for table database1932450.purchases
CREATE TABLE IF NOT EXISTS `purchases` (
  `purchase_uuid` char(36) NOT NULL DEFAULT uuid(),
  `product_uuid` char(36) NOT NULL,
  `customer_uuid` char(36) NOT NULL,
  `quantity` int(3) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `subtotal` decimal(7,2) NOT NULL,
  `taxes_amount` decimal(7,2) NOT NULL,
  `grandtotal` decimal(7,2) NOT NULL,
  `current_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`purchase_uuid`) USING BTREE,
  KEY `product_uuid` (`product_uuid`) USING BTREE,
  KEY `customer_uid` (`customer_uuid`) USING BTREE,
  CONSTRAINT `fk_customer_uuid` FOREIGN KEY (`customer_uuid`) REFERENCES `database-1932450`.`customers` (`customer_uuid`),
  CONSTRAINT `fk_product_uuid` FOREIGN KEY (`product_uuid`) REFERENCES `database-1932450`.`products` (`product_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table database1932450.purchases: ~0 rows (approximately)
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;

-- Dumping structure for procedure database1932450.purchases_delete
DELIMITER //
CREATE PROCEDURE `purchases_delete`(
	IN `p_purchase_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#delete one specific purchase based on its primary key
	DELETE FROM purchases
 	WHERE purchase_uuid = p_purchase_uuid;
 	
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.purchases_filter
DELIMITER //
CREATE PROCEDURE `purchases_filter`(
	IN `p_cid` CHAR(36),
	IN `p_cdate` DATETIME
)
IF p_cdate IS NULL THEN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#procedure to filter the purchases
   SELECT purchases.comments,purchases.subtotal,purchases.taxes_amount,purchases.grand_total,products.product_code,customers.firstname,customers.lastname,customers.city,purchases.quantity,products.price,purchases.purchase_uuid 
   FROM purchases
   INNER JOIN products on products.product_uuid = purchases.product_uuid
   INNER JOIN customers on customers.customer_uuid = purchases.customer_uuid
   WHERE purchases.customer_uuid = p_cid
   ORDER BY purchases.created_date desc;
ELSE
   SELECT purchases.comments,purchases.subtotal,purchases.taxes_amount,purchases.grand_total,products.product_code,customers.firstname,customers.lastname,customers.city,purchases.quantity,products.price,purchases.purchase_uuid 
   FROM purchases
   INNER JOIN products on products.product_uuid = purchases.product_uuid
   INNER JOIN customers on customers.customer_uuid = purchases.customer_uuid
   WHERE purchases.created_date >= p_cdate and purchases.customer_uuid = p_cid
   ORDER BY purchases.created_date desc;
END IF//
DELIMITER ;

-- Dumping structure for procedure database1932450.purchases_insert
DELIMITER //
CREATE PROCEDURE `purchases_insert`(
	IN `p_product_uuid` CHAR(36),
	IN `p_customer_uuid` CHAR(36),
	IN `p_quantity` INT(3),
	IN `p_price` INT(10),
	IN `p_comments` VARCHAR(200),
	IN `p_subtotal` DECIMAL(7,2),
	IN `p_taxesamount` DECIMAL(7,2),
	IN `p_grandtotal` DECIMAL(7,2)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	# create a stored procedure to insert an product in database
	# here you don't need the parameter for product_uuid and current_date_time
	#      as system will automatically generate uuid and time of entry(datetime)
	INSERT INTO purchases
				(product_uuid,customer_uuid,quantity,price,
				 comments,subtotal,taxes_amount,grandtotal)
	VALUES   (p_product_uuid,p_customer_uuid,p_quantity,p_price,
				 p_comments,p_subtotal,p_taxesamount,p_grandtotal);

END//
DELIMITER ;

-- Dumping structure for procedure database1932450.purchases_load
DELIMITER //
CREATE PROCEDURE `purchases_load`(
	IN `p_purchase_uuid` CHAR(36)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#create the procedure for purchase class class(used by buying.php)
	SELECT purchase_uuid,product_uuid,customer_uuid,quantity,
			 price,comments,subtotal,taxes_amount,grandtotal
	FROM purchases
	WHERE purchase_uuid =p_purchase_uuid;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.purchases_select
DELIMITER //
CREATE PROCEDURE `purchases_select`()
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#procedure to select all the data from purchases table and order by current datetime
	SELECT purchase_uuid,product_uuid,customer_uuid,quantity,price,comments,subtotal,
			 taxes_amount,grandtotal,current_date_time,modify_date_time 
	FROM purchases
	ORDER BY current_date_time;
END//
DELIMITER ;

-- Dumping structure for procedure database1932450.purchases_update
DELIMITER //
CREATE PROCEDURE `purchases_update`(
	IN `p_purchase_uuid` CHAR(36),
	IN `p_quantity` INT(3),
	IN `p_price` INT(10),
	IN `p_comments` VARCHAR(200)
)
BEGIN
#Revision History
#DEVELOPER						DATE			COMMENTS
#Mansi Vakharia(1932450)	2021-04-25	Created the customer table
#Mansi Vakharia(1932450)	2021-04-25	Created the products table
#Mansi Vakharia(1932450)	2021-04-25	Created the purchases table
#Mansi Vakharia(1932450)	2021-04-25	Created the products_view VIEW
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in customers table- (customers_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in products table- (products_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the selecting 
#													the data in purchases table- (purchases_select)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (customers_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in products table- (products_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the inserting 
#													the data in purchases table- (purchases_insert)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in customers table- (customers_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in products table- (productss_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the updating 
#													the data in purchases table- (purchases_update)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in customers table- (customers_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in products table- (products_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the deleteing 
#													the data in purchases table- (purchases_delete)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in customers table- (customers_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in products table- (products_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the loading 
#													the data in purchases table- (purchases_load)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login 
#													the data in customers table- (customers_login)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the login-user 
#													the data in customers table- (customers_login_user)
#Mansi Vakharia(1932450)	2021-04-25	Created the STORED PROCEDURE for the filtering 
#													the data in purchases table- (purchases_filter)

	#you don't need parameter for modify_date_time as there is now() always in sql
 	UPDATE purchases
 	SET  quantity=p_quantity,
        price=p_price,
        comments=p_comments,
        modify_date_time = NOW()
 	WHERE purchase_uuid = p_purchase_uuid;

END//
DELIMITER ;

-- Dumping structure for view database1932450.products_view
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `products_view`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `products_view` AS select `products`.`product_code` AS `product_code`,`products`.`description` AS `description`,`products`.`price` AS `price`,`products`.`cost_price` AS `cost_price` from `products` order by `products`.`product_code` ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
