<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of purchase
 *
 * @author hp
 */
//if session not started then start the session
if(!isset($_SESSION)) 
{ 
    session_start(); 
}
//including the database connection
require_once("database-connection.php");
//including the classes
include_once("customer.php");
include_once("customers.php");
include_once("product.php");
include_once("products.php");

$product = new product();
$customerId = $_SESSION['final'];

//defining variable for error message
$purchaseErrorMessage="";

//created class purchase
class purchase {
    //put your code here
    //only visible inside the object
    private $purchase_uuid;   
    private $product_uuid;  
    private $customer_uuid;  
    private $quantity;   
    private $price;
    private $comments;   
    private $subtotal; 
    private $taxes_amount;  
    private $grandtotal;    
    
    //create constructor and pass the object , parameters (passing object) in constructor is optional
    //only pass parameters if the values come from database
    public function __construct($purchase_uuid="",$product_uuid="",$customer_uuid="",$quantity="",$price="",$comments="",$subtotal="",$taxes_amount="",$grandtotal=""){
        
        //$this used for point to current object
        //if primary key which i received is not empty
        if($purchase_uuid != ""){
            //fill all the object property , this below all will be used for purchases.php(plural class)
            $this->purchase_uuid = $purchase_uuid;
            $this->product_uuid = $product_uuid;
            $this->customer_uuid = $customer_uuid;
            $this->quantity=$quantity;
            $this->price=$price;
            $this->comments=$comments;
            $this->subtotal=$subtotal;
            $this->taxes_amount=$taxes_amount;
            $this->grandtotal=$grandtotal;
        }//end if
    }//end of constructor
    
    //function for getting purchase_uuid
    function getPurchaseUUID(){
        return  $this->purchase_uuid;
    }
    
    //function for getting product_uuid
    function getProductUUID(){       
        return $this->product_uuid;
    }
    
    //function for setting product_uuid
    function setProductUUID($newProduct_uuid){
        $this->product_uuid = $newProduct_uuid;
        //returns null by default
        return "";
    }
    
    //function for getting customer_uuid
    function getCustomerUUID(){
        return $this->customer_uuid;
    }
    
    //function for setting customer_uuid
    function setCustomerUUID($newCustomerId){
        $this->customer_uuid = $newCustomerId;
        //returns null by default
        return "";
    }
    
    //function for getting quantity
    function getQuantity(){
        return $this->quantity;
    }
    
    //function for setting quantity
    function setQuantity($newQuantity){
      //  global $firstnameErrorMessage;
                
        if(mb_strlen($newQuantity)== 0){
            
            return "The Quantity cannot be empty";
        }
        else {
            if(mb_strlen($newQuantity) > QUANTITY_MAX_LENGTH){
                
                return "The Quantity cannot contain more than " .
                        QUANTITY_MAX_LENGTH . " characters";
               
            }
            else {
                
                $this->quantity = $newQuantity;
                return ""; //returns null by default
            }
        }
    }
    
    // function for getting price
    function getPrice(){
        return $this->price;
    }
    
    //function for setting price
    function setPrice($newPrice){
      //  global $firstnameErrorMessage;
                
        if(is_numeric($newPrice)== 0){
            
            return "The price cannot be empty";
        }
        else {
            if(is_numeric($newPrice) > PRICE_MAX_LENGTH){
                
                return "The price cannot contain more than " .
                        PRICE_MAX_LENGTH . " characters";
               
            }
            else {
                
                $this->price = $newPrice;
                return ""; //returns null by default
            }
        }
    }
    
    // function for getting comments
    function getComments(){
        return $this->comments;
    }
    
    //function for setting comments
    function setComments($newComments){
      
                
        if(mb_strlen($newComments)== 0){
            
            return "The comments cannot be empty";
        }
        else {
            if(mb_strlen($newComments) > COMMENTS_MAX_LENGTH){
                
                return "The comments cannot contain more than " .
                        COMMENTS_MAX_LENGTH . " characters";
               
            }
            else {
                
                $this->comments = $newComments;
                return ""; //returns null by default
            }
        }
    }
    
    //function for getting subtotal
    function getSubtotal()
    {
    return $this->subtotal;
    }
    
    //function for setting subtotal
    function setSubtotal($newSubtotal){
        $this->subtotal =  $newSubtotal;
    }
    
    //function for getting taxes amount 
    function getTaxesamount(){
        return $this->taxes_amount;
    }
    
    //function for setting taxes amount
    function setTaxesamount($newTaxes_amount)
    {
        $this->taxes_amount =  $newTaxes_amount;
    }

    //function for getting grandtotal
    function getGrandtotal(){
        return $this->grand_total;
    }
    
    //function for setting grandtotal
    function setGrandtotal($newGrandtotal){
        $this->grand_total = $newGrandtotal;
    }
    
    //object will load automatically,my load method will receive purchase_uuid
    // uses purchase_load subroutine
    public function load($purchase_uuid){
        //used centralized connection query 
        global $connection;
        global $purchaseErrorMessage;
        
        //call the customer_load database procedure
        // pk is placehoder here for purchase_uuid(primary key)
        $sqlQuery = "CALL purchases_load(:purchase_uuid)";
        
        //prepare the query, $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        $PDOStatement->bindParam(':purchase_uuid',$purchase_uuid); // here pk is stating that primarykey, and value of one of purchase_uuid placed under $pk as shown above
        
        //execution performed
        $PDOStatement->execute();
        
        //for every row(use while if you have many row), fetch will give the result, fetch_assoc means fetch result in associative array
        if($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            $this->purchase_uuid = $row['purchase_uuid'];
            $this->product_uuid = $row['product_uuid'];
            $this->customer_uuid = $row['customer_uuid'];
            $this->quantity = $row['quantity'];
            $this->price = $row['price'];
            $this->comments = $row['comments'];
            $this->subtotal = $row['subtotal'];
            $this->taxes_amount = $row['taxes_amount'];
            $this->grandtotal = $row['grandtotal'];
            
            return true;
        }//end if
        else{
            $purchaseErrorMessage="purchase not found";
        }//end else
    }//end of load function
    
    //creating function to save the data which would insert the data in the database
    //uses purchases_insert subroutine
    public function save(){
        //used centralized connection query
        global $connection;
        
        //save new object(INSERT)
        //if purchase_uuid(primary key) is empty or does not exist then insert the data into purchase table.
        if($this->purchase_uuid == "" ){
            //call the purchases_insert procedure to insert the data           
            $sqlQuery = "CALL purchases_insert(:product_uuid,:customer_uuid,:quantity,:price,
                                               :comments,:subtotal,:taxes_amount,:grandtotal)"; 
            
            $PDOStatement =$connection->prepare($sqlQuery);
            
            //for each placeholder you need to call bind parameter
            $PDOStatement->bindParam(':product_uuid',$this->product_uuid); 
            $PDOStatement->bindParam(':customer_uuid',$this->customer_uuid);
            $PDOStatement->bindParam(':quantity',$this->quantity); 
            $PDOStatement->bindParam(':price',$this->price);
            $PDOStatement->bindParam(':comments',$this->comments);
            $PDOStatement->bindParam(':subtotal',$this->subtotal);
            $PDOStatement->bindParam(':taxes_amount',$this->taxes_amount);
            $PDOStatement->bindParam(':grandtotal', $this->grandtotal);
            
            //do the password_hash placed in variable here, and use that variable above in place of password above
            //execute the query
            $PDOStatement->execute();
            //if it's return true then using error handler it will handle it
            return true;
        }//end if
        else{
            //update existing row(UPDATE)
            // if primary key(purchase_uuid) is already exist then update the existing purchase data      
            $sqlQuery = "CALL purchases_update(:pk,:product_uuid,:customer_uuid,:quantity,:price,
                                               :comments,:subtotal,:taxes_amount,:grandtotal)"; // pk is placehoder here for product_uuid(primary key)
        
            //prepare the query, $pdostatement here is object represents (manage)sqlquery
            $PDOStatement =$connection->prepare($sqlQuery);

            //for each placeholder you need to call bind parameter
            $PDOStatement->bindParam(':pk',$this->purchase_uuid); 
            $PDOStatement->bindParam(':product_uuid',$this->product_uuid); 
            $PDOStatement->bindParam(':customer_uuid',$this->customer_uuid);
            $PDOStatement->bindParam(':quantity',$this->quantity); 
            $PDOStatement->bindParam(':price',$this->price);
            $PDOStatement->bindParam(':comments',$this->comments);
            $PDOStatement->bindParam(':subtotal',$this->subtotal);
            $PDOStatement->bindParam(':taxes_amount',$this->taxes_amount);
            $PDOStatement->bindParam(':grandtotal', $this->grandtotal);

            //execute the query
            $PDOStatement->execute();
            return true;
        }//end else
    }//end of save function
    
    //creating the delete function for deleting the data from the database
    //it uses purchases_delete subroutine
    //for delete we don't need to pass the $purchase_uuid, as we are already in singular object(purchase.php)
    //it's already loaded so no need to pass the primary key.
    public function delete(){
        //used centralized connection query 
        global $connection;
        
        //calling the procedure for delete customer
        // purchase_uuid is placehoder here for purchase_uuid(primary key), you can write any name for that(for ex. pk, or any name)
        $sqlQuery = "CALL purchases_delete(:purchase_uuid)";
        
        //prepare the query , $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        // here :purchase_uuid is stating that primarykey, 
        $PDOStatement->bindParam(':purchase_uuid',$this->purchase_uuid);
        
        //execute the function
        $affectedrows = $PDOStatement->execute();

        //best practice to return information 
        return $affectedrows;
    }//end of delete function
}//end of class purchase
