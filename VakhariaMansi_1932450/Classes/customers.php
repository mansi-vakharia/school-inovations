<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of customers
 *
 * @author hp
 */
//including the database-connection
require_once("database-connection.php");
//including the classes
require_once("customer.php");
require_once("collection.php");

//use inheritance
class customers extends collection{
    //put your code here
    //create a constructor and pass the parameters
    function __construct(){
        //used centralized connection query
        global $connection;
        
        //calling customers_select procedure 
        //sometimes you have param to pass like :pk
        $sqlQuery = "CALL customers_select()";
        
        //prepare the query , $PDOStatement here is object represents (manage)sqlquery
        $PDOStatement = $connection->prepare($sqlQuery);
        
        //execute the statement
        $PDOStatement->execute();
        
        //while... some rows to read
        while($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            //create customer object and pass all field which we created under customer.php 's constructor
            //create singular object to hold the data of row
            $customer= new customer($row['customer_uuid'],$row['firstname'],$row['lastname'],$row['address'],$row['city'],$row['postal_code'],$row['username'],$row['password']);

            //add an object to collection
            //here add primarykey(pk), and obejct($customer)
            $this->add($row['customer_uuid'], $customer);
        }//end of while statement
    }//end of constructor  
}//end of class
