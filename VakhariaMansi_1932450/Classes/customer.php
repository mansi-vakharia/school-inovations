<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of customer
 *
 * @author hp
 */

//giving the database connection
require_once("database-connection.php");

//variable declaration for error message
    $firstnameErrorMessage ="";
    $lastnameErrorMessage ="";
    $addressErrorMessage ="";
    $cityErrorMessage ="";
    $postalcodeErrorMessage ="";
    $provinceErrorMessage ="";
    $usernameErrorMessage = "";
    $passwordErrorMessage ="";

class customer {
    //put your code here
    //only visible inside the object
    private $customer_uuid = "";
    private $firstname = ""; 
    private $lastname = "";
    private $address = "";
    private $city = "";
    private $province = "";
    private $postal_code = "";
    private $username = "";
    private $password = "";
    
    //creating constructor and passing the object , parameters in constructor is optional
    //only pass parameters if the values come from database          
    public function __construct($customer_uuid ="",$firstname ="",$lastname ="",$address ="", $city="",$province ="",$postal_code = "",$username ="",$password =""){
        //$this used for pointing to the current object

        //if primary key which is received is not empty
        if($customer_uuid != "")
        {
            //fill all the object property , this below all will be used for customer.php(plural class)
            $this->customer_uuid = $customer_uuid;
            $this->firstname = $firstname;
            $this->lastname = $lastname;
            $this->address = $address;
            $this->city = $city;
            $this->province = $province;
            $this->postal_code = $postal_code;
            $this->username = $username;
            $this->password = $password;
        }
    }
    
    //creating a function for getting customer_uuid
    function getCustomerUUID(){
        return $this->customer_uuid;
    }
    
    //creating a function for getting firstname
    function getFirstname(){
        return $this->firstname;
    }
    
    //function for setting firstname
    function setFirstname($firstname){
        $this->firstname = $firstname;
        //returns null by default}
        return "";
    }
    
    //function for getting lastname
    function getLastname(){
        return $this->lastname;
    }
    
    //function for setting lastname
    function setLastname($lastname){
        $this->lastname = $lastname;
        //returns null by default
        return "";
    }
    
    //function for getting address
    function getAddress(){
        return $this->address;
    }
    
    function setAddress($address){
        $this->address = $address;
        //returns null by default
        return "";
    }
    
    //function for getting city
    function getCity(){
        return $this->city;
    }
    
    //function for setting city
    function setCity($city){
        $this->city = $city;
        //returns null by default
        return "";
    }
    
    //function for getting province
    function getProvince(){
        return $this->province;
    }
    
    //function for setting province
    function setProvince($province){
        $this->province = $province;
        //returns null by default
        return "";
    }
    
    //function for getting postalcode
    function getPostalcode(){
        return $this->postal_code;
    }
    
    function setPostalcode($postalcode){
        $this->postal_code = $postalcode;
        //returns null by default
        return "";
    }
    
    //function for getting username
    function getUsername(){
        return $this->username;
    }
    
    //function for setting username
    function setUsername($username){
        $this->username = $username;
        //returns null by default
        return "";
    }
    
    //function for getting password
    function getPassword(){
        return $this->password;
    }
    
    //function for setting password
    function setPassword($password){
        $this->password = $password;
        //returns null by default
        return "";
    }
    
    //object will load automatically, load method will receive customer_uuid(for custoemr_uuid)
    //uses customer_load subroutine
    public function load($customer_uuid){
        //used centralized connection query 
        global $connection;
        global $usernameErrorMessage;
        
        //call the customer_load database procedure
        //pk is placehoder here for cutomer_uuid(primary key)
        $sqlQuery = "CALL customers_load(:customer_uuid)";
        
        //prepare the query, $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        //pk is stating that primarykey, and value of one of customer_uuid placed under $pk as shown above
        $PDOStatement->bindParam(':customer_uuid',$customer_uuid);
        
        //execution
        $PDOStatement->execute();
        
        //for every row(use while if you have many row), fetch will give the result, 
        //fetch_assoc means fetch result in associative array
        if($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){              
           // echo 'inside load method';
           // var_dump($row);
            $this->customer_uuid = $row['customer_uuid'];
            $this->firstname = $row['firstname'];
            $this->lastname = $row['lastname'];
            $this->address = $row['address'];
            $this->city = $row['city'];
            $this->province = $row['province'];
            $this->postal_code = $row['postal_code'];
            $this->username = $row['username'];
            $this->password = $row['password'];
            return true;
        }//end if
        else{
            $usernameErrorMessage="User account not found";
        }//end else
    }//end of load function
    
    //creating function to save the data which would insert the data in the database
    //uses customer_insert subroutine
    public function save(){
        
        global $connection;
            
        
        //save new object(INSERT)
        //if customer_uuid(primary key) is empty or does not exist then insert the data into register page.
        if($this->customer_uuid == "" && $_SESSION['final'] == "")
        {
           
            $password = $this->password;
            $encryptedPassword = password_hash($password, PASSWORD_DEFAULT);
            //call the customers_insert procedure to insert the data           
            $sqlQuery = "CALL customers_insert(:firstname,:lastname,:address,:city,:province,:postal_code,:username,:password)"; 
            
           //prepare the query, $pdostatement here is object represents (manage)sqlquery
           $PDOStatement =$connection->prepare($sqlQuery);
           
           //for each placeholder you need to call bind parameter
           $PDOStatement->bindParam(':firstname',$this->firstname); 
           $PDOStatement->bindParam(':lastname',$this->lastname);
           $PDOStatement->bindParam(':address',$this->address); 
           $PDOStatement->bindParam(':city',$this->city);
           $PDOStatement->bindParam(':province',$this->province);
           $PDOStatement->bindParam(':postal_code',$this->postal_code);
           $PDOStatement->bindParam(':username',$this->username);
           $PDOStatement->bindParam(':password',$encryptedPassword);
           
           //execute the query
           $PDOStatement->execute();
           
           return true; // if it's return true then using error handler it will handle it
   
           }
           
        else{
               
            //update existing row(UPDATE)
            // if primary key(customer_uuid) is already exist then update the existing user data 
            $password = $this->password;
            //using encryption for the password(password_hash)
            $encryptedPassword = password_hash($password, PASSWORD_DEFAULT);
            
            $sqlQuery = "CALL customers_update(:pk,:firstname,:lastname,:address,:city,:province,:postal_code,:username,:password)"; // pk is placehoder here for customer_uuid(primary key)
        
            //prepare the query, $pdostatement here is object represents (manage)sqlquery
            $PDOStatement =$connection->prepare($sqlQuery);

            //for each placeholder you need to call bind parameter
           $PDOStatement->bindParam(':pk',$_SESSION['final']); 
           $PDOStatement->bindParam(':firstname', $this->firstname); 
           $PDOStatement->bindParam(':lastname',$this->lastname);
           $PDOStatement->bindParam(':address',$this->address); 
           $PDOStatement->bindParam(':city',$this->city);
           $PDOStatement->bindParam(':province',$this->province);
           $PDOStatement->bindParam(':postal_code',$this->postal_code);
           $PDOStatement->bindParam(':username',$this->username);
           $PDOStatement->bindParam(':password',$encryptedPassword);
           
           //execute the query
            $PDOStatement->execute();
            
            return true;
        }
       
    }
    
    //creating the delete function for deleting the data from the database
    //it uses customers_delete subroutine
     public function delete(){ 
        //for delete we don't need to pass the $customer_uuid, as we are already in singular object(person.php)
        //it's already loaded so no need to pass the primary key.
        //used centralized connection query 
        global $connection;
        
        //calling the procedure for delete customer
        //customer_uuid is placehoder here for customer_uuid(primary key), 
        //you can write any name for that(for ex. pk, employye_uuid or any name)
        $sqlQuery = "CALL customers_delete(:customer_uuid)";
        
        //prepare the query , $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        // here :employee_uuid is stating that primarykey, 
        $PDOStatement->bindParam(':customer_uuid',$this->customer_uuid);
        
        //execute the function
        $affectedrows = $PDOStatement->execute();

        //best practice to return information 
        return $affectedrows;
    }//end delete function
    
    //create a function for login which uses the subroutine customers_login
    public function login($username,$password){
        //used centralized connection query 
        global $connection;
        
        //calling the procedure for login
        //customer_uuid is placehoder here for customer_uuid(primary key), you can write any name for that(for ex. pk, employye_uuid or any name)
        $sqlQuery = "CALL customers_login_username(:username)";
        
        //prepare the query, $pdostatement here is object represents (manage)sqlquery
        $PDOStatement =$connection->prepare($sqlQuery);
        
        //for each placeholder you need to call bind parameter
        //here pk is stating that primarykey, and value of one of customer_uuid placed under $pk as shown above
        $PDOStatement->bindParam(':username',$username);
        
        //execution performed
        $PDOStatement->execute();
        
        // if($PDOStatement->rowCount() >= 1){
        if($row =$PDOStatement->fetch(PDO::FETCH_ASSOC)){
            // var_dump($row);
            $this->customer_uuid = $row["customer_uuid"];
            $this->username = $row["username"];
            $this->password = $row["password"];

            $encryptedPassword =$this->password;
            //$password = md5($password);
            //var_dump($encryptedpassword);
            if(password_verify($password, $encryptedPassword)){
                $_SESSION['final'] = $this->customer_uuid;
            }//end if
            else{
                echo '("<script>alert("wrong userame or Password")</script>")';
            }//end else
        return true;
        }//endif
    }//end of login function
}
