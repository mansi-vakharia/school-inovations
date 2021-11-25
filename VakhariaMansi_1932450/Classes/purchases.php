<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of purchases
 *
 * @author hp
 */
//including database connection
require_once("database-connection.php");
//including classes
require_once("purchase.php");
require_once("collection.php");

//use inheritance
class purchases extends collection{
    //put your code here
    //create a constructor to pass the parameters
    function __construct(){
        //used centralized connection query
        global $connection;
        
        //calling customers_select procedure
        //sometimes you have param to pass like :pk
        $sqlQuery = "CALL purchases_select()";
        
        //prepare the query , $PDOStatement here is object represents (manage)sqlquery
        $PDOStatement = $connection->prepare($sqlQuery);
        
        //execute the statement
        $PDOStatement->execute();
        
        //while... some rows to read
        while($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            //create purchase object and pass all field which we created under purchase.php 's constructor
            //create singular object to hold the data of row                                                    
            $purchase= new purchase($row['purchase_uuid'],$row['product_uuid'],$row['customer_uuid'],$row['quantity'],$row['price'],$row['comments'],$row['subtotal'],$row['taxes_amount'],$row['grandtotal']);

            //add an object to collection
            $this->add($row['purchase_uuid'], $purchase);// here add primarykey, and obejct($product)
        }//end of while statement
    }//end of constructor
    
    //create a function to filter the purchases
    function filterPurchase($searchDate){
        //need to clear the items array
        //used centralized connection query
        global $connection;
        
        //calling purchases_select procedure
        //sometimes you have param to pass like :pk
        $sqlQuery = "CALL purchases_filter(:cdate,:customer_uuid)";
        
        //prepare the query , $PDOStatement here is object represents (manage)sqlquery
        $PDOStatement = $connection->prepare($sqlQuery);
        
        //execute the statement
        $PDOStatement->execute();
        
        //while... some rows to read
        //clear the array(means unset it)
        while($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            //create purchase object and pass all field which we created under purchase.php 's constructor
            //create singular object to hold the data of row                                                    
            $purchase= new purchase($row['purchase_uuid'],$row['product_uuid'],$row['customer_uuid'],$row['quantity'],$row['price'],$row['comments'],$row['subtotal'],$row['taxes_amount'],$row['grandtotal']);

            //add an object to collection
            $this->add($row['purchase_uuid'], $purchase);// here add primarykey, and obejct($product)
        }//end of whike statement
    }//end of function
}//end of class purchases
