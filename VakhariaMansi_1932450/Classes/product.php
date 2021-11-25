<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of product
 *
 * @author hp
 */
//giving database connection
require_once("database-connection.php");
//including phpFunctions
require_once ("PHP_FUNCTIONS/phpFunctions.php");

//created class product
class product {
    //put your code here
    // only visible inside the object
    private $product_uuid = "";
    private $product_code = "";
    private $description = "";
    private $price = "";
    private $cost_price = "";
    
    //create constructor and pass the object , parameters (passing object) in constructor is optional
    //only pass parameters if the values come from database $province ="",
    public function __construct($product_uuid ="",$product_code ="",$description ="",$price ="", $cost_price=""){
        //$this used for point to current object
        //if primary key which i received is not empty
        if($product_uuid != ""){
            //fill all the object property , this below all will be used for customer.php(plural class)
            $this->product_uuid = $product_uuid;
            $this->product_code = $product_code;
            $this->description = $description;
            $this->price = $price;
            $this->cost_price = $cost_price;
        } 
    }
    
    //function for getting product_uuid
    function getProductUUID(){
        return $this->product_uuid;
    }
    
    // function for getting product code
    function getProductcode(){
        return $this->product_code;
    }
    
    //function for setting product code
    function setProductcode($newProductcode){
        $this->product_code = $newProductcode;
        //returns null by default
        return "";
    }
    
    // function for getting description
    function getDescription(){
        return $this->description;
    }
    
    //function for setting description
    function setDescription($newDescription){
        $this->description = $newDescription;
        //returns null by default
        return "";
    }
    
    // function for getting price
    function getPrice(){
        return $this->price;
    }
    
    //function for setting price
    function setPrice($newPrice){
        $this->price = $newPrice;
        //returns null by default
        return "";
    }
    
    // function for getting cost price
    function getCostprice(){
        return $this->cost_price;
    }
    
    //function for setting cost price
    function setCostprice($newCostprice){
        $this->cost_price = $newCostprice;
        //returns null by default
        return "";
    }   
       
    //object will load automatically,my load method will receive customer_uuid(for project custoemr_uuid)
    // uses product_load subroutine
    public function load($product_uuid){
        //used centralized connection query 
        global $connection;
        
        //call the customer_load database procedure
        // product_uuid is placehoder here for product_uuid(primary key)
        $sqlQuery = "CALL product_load(:product_uuid)";
        
        //prepare the query, $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        $PDOStatement->bindParam(':product_uuid',$product_uuid); 
        
        //execution performed
        $PDOStatement->execute();
        
        //for every row(use while if you have many row), fetch will give the result, fetch_assoc means fetch result in associative array
        if($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
           // var_dump($row);
            $this->product_uuid = $row['product_uuid'];
            $this->product_code = $row['product_code'];
            $this->description = $row['description'];
            $this->price = $row['price'];
            $this->cost_price = $row['cost_price'];
            return true;
        }//end if
    }//end of load function
    
    //creating function to save the data which would insert the data in the database
    //uses products_insert subroutine
    public function save(){
        //using centralized connection query
        global $connection;
        
        //save new object(INSERT)
        //if product_uuid(primary key) is empty or does not exist then insert the data into buy page.
        if($this->product_uuid == ""){
            //call the customers_insert procedure to insert the data           
            $sqlQuery = "CALL products_insert(:product_code,:description,:price,:cost_price)"; 
            //var_dump($sqlQuery);
            //prepare the query, $pdostatement here is object represents (manage)sqlquery
            $PDOStatement =$connection->prepare($sqlQuery);

            //for each placeholder you need to call bind parameter
            $PDOStatement->bindParam(':product_code',$this->product_code); 
            $PDOStatement->bindParam(':description',$this->description);
            $PDOStatement->bindParam(':price',$this->price); 
            $PDOStatement->bindParam(':cost_price',$this->cost_price);

            //execute the query
            $PDOStatement->execute();
            
            //if it's return true then using error handler it will handle it
            return true;
        }//end if
        else{
            //update existing row(UPDATE)
            // if primary key(product_uuid) is already exist then update the existing product data      
            $sqlQuery = "CALL products_update(:pk,:product_code,:description,:price,:cost_price)"; // pk is placehoder here for product_uuid(primary key)
        
            //prepare the query, $pdostatement here is object represents (manage)sqlquery
            $PDOStatement =$connection->prepare($sqlQuery);

            //for each placeholder you need to call bind parameter
            $PDOStatement->bindParam(':pk',$this->product_uuid); 
            $PDOStatement->bindParam(':product_code',$this->product_code); 
            $PDOStatement->bindParam(':description',$this->description);
            $PDOStatement->bindParam(':price',$this->price); 
            $PDOStatement->bindParam(':cost_price',$this->cost_price);

            //execute the query
            $PDOStatement->execute();

            return true;
        }//end else 
    }//end of save function
    
    //creating the delete function for deleting the data from the database
    //it uses products_delete subroutine
    public function delete(){
        //for delete we don't need to pass the $customer_uuid, as we are already in singular object(person.php)
        //it's already loaded so no need to pass the primary key.
        //used centralized connection query 
        global $connection;
        
        //calling the procedure for delete customer
        //product_uuid is placehoder here for product_uuid(primary key),
        //you can write any name for that(for ex. pk, employye_uuid or any name)
        $sqlQuery = "CALL products_delete(:product_uuid)";
        
        //prepare the query , $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        //here :product_uuid is stating that primarykey, 
        $PDOStatement->bindParam(':product_uuid',$this->product_uuid);
        
        //execute the function
        $affectedrows = $PDOStatement->execute();

        //best practice to return information 
        return $affectedrows;
    }//end of delete function 
}//end of class product
