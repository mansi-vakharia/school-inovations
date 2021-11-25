<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of products
 *
 * @author hp
 */
//including the database connection
require_once("database-connection.php");
//including the classes
require_once("product.php");
require_once("collection.php");

//use inheritance
class products extends collection{
    //put your code here
    //create a constructor to pass the parameters
    function __construct(){
        
        //used centralized connection query
        global $connection;
        
        //calling products_select procedure
        //sometimes you have param to pass like :pk
        $sqlQuery = "CALL products_select()";
        
        //prepare the query , $PDOStatement here is object represents (manage)sqlquery
        $PDOStatement = $connection->prepare($sqlQuery);
        
        //execute the statement
        $PDOStatement->execute();
        
        //while... some rows to read
        while($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            //create product object and pass all field which we created under product.php 's constructor
            //create singular object to hold the data of row                                                    
            $product= new product($row['product_uuid'],$row['product_code'],$row['description'],$row['price'],$row['cost_price']);

            //add an object to collection
            //here add primarykey, and obejct($product)
            $this->add($row['product_uuid'], $product);
        }//end of while statement
    }//end of constructor
}//end of class products
