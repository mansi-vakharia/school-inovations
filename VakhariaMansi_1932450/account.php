<?php
//Revision History
//Mansi Vakharia(1932450)    29-Apr-2021    Created an empty file
//Mansi Vakharia(1932450)    30-Apr-2021    Changed the format of page
//Mansi Vakharia(1932450)    1-May-2021     Fixed the command==print upto an extent
//Mansi Vakharia(1932450)    2-May-2021     Checked the working of the project

session_start();

//including the php common functions file to call the common functions
include 'PHP_FUNCTIONS/phpFunctions.php';
//including database connection
require_once ("database-connection.php");
//check if user is logged in or not.
if(!checkSession()){
        header("location:login.php");
    }

    //include the external file
    require_once ('Classes/customer.php');
    require_once ('Classes/customers.php');

    $customer = new customer();
    
    //calling the header and passing the value of title
    createheader('Account');
    //calling the navigation function to acces the navigation bar
    navigation();
    //calling the function of logo in order to display the logo in the page
    logo();

    
    //if the user submitted the web form 
    if(isset($_POST['update'])){
        if(isset($_SESSION['final']) != ""){
        //defining the constants
        $firstname= htmlspecialchars($_POST['firstname']);
        $lastname= htmlspecialchars($_POST['lastname']);
        $address= htmlspecialchars($_POST['address']);
        $city= htmlspecialchars($_POST['city']);
        $province = htmlspecialchars($_POST['province']);
        $postalcode= htmlspecialchars($_POST['postal_code']);
        $username= htmlspecialchars($_POST['username']);
        $password=htmlspecialchars($_POST['password']);
        
        $flag=1;
        //checking the length of firstname
        if(mb_strlen($firstname)> FIRSTNAME_MAX_LENGTH){
            $firstnameErrorMessage = " The firstname cannot contain more than ". FIRSTNAME_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the firstname is null
        if(mb_strlen($firstname)== 0){
            $firstnameErrorMessage = " The firstname cannot be empty";
            $flag=0;
        }
        //checking the length of lastname
        if(mb_strlen($lastname)> LASTNAME_MAX_LENGTH){
            $lastnameErrorMessage = " The lastname cannot contain more than ". LASTNAME_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the lastname is null
        if(mb_strlen($lastname)== 0){
            $lastnameErrorMessage = " The lastname cannot be empty";
            $flag=0;
        }
        //checking the length of address
        if(mb_strlen($address)> ADDRESS_MAX_LENGTH){
            $addressErrorMessage = " The address cannot contain more than ". ADDRESS_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the address is null
        if(mb_strlen($address)== 0){
            $addressErrorMessage = " The address cannot be empty";
            $flag=0;
        }
        //checking the length of city
        if(mb_strlen($city)> CITY_MAX_LENGTH){
            $cityErrorMessage = " The city cannot contain more than ". CITY_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the city is null
        if(mb_strlen($city) == 0){
            $cityErrorMessage = " The city cannot be empty";
            $flag=0;
        }     
        //checking the length of province
        if(mb_strlen($province)> PROVINCE_MAX_LENGTH){
            $provinceErrorMessage = " The province cannot contain more than ". PROVINCE_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the province is null
        if(mb_strlen($province)== 0){
            $provinceErrorMessage = " The province cannot be empty";
            $flag=0;
        }
        //checking the length of postalcode
        if(mb_strlen($postalcode)> POSTALCODE_MAX_LENGTH){
            $postalcodeErrorMessage = " The postal code cannot contain more than ". POSTALCODE_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the postalcode is null
        if(mb_strlen($postalcode)== 0){
            $postalcodeErrorMessage = " The postal code cannot be empty";
            $flag=0;
        }
        //check the length of username
        if(mb_strlen($username)> USERNAME_MAX_LENGTH){
            $usernameErrorMessage = " The username cannot contain more than ". USERNAME_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the username is null
        if(mb_strlen($username)== 0){
            $usernameErrorMessage = " The username cannot be empty";
            $flag=0;
        }
        //check the length of password
        if(mb_strlen($password)> PASSWORD_MAX_LENGTH){
            $passwordErrorMessage = " The password cannot contain more than ". PASSWORD_MAX_LENGTH . " charaters";
            $flag=0;
        }
        //if the password is null
        if(mb_strlen($password)== 0){
            $passwordErrorMessage = "The password cannot be empty";
            $flag=0;
        }
        
        if($flag==1){
        $customer->setFirstname($firstname);
        $customer->setLastname($lastname);
        $customer->setAddress($address);
        $customer->setCity($city);
        $customer->setProvince($province);
        $customer->setPostalCode($postalcode);
        $customer->setUsername($username);
        $customer->setPassword($password);
        $customer->save();
        }
        else{
            echo("<script>alert('Please Enter proper data')</script>"); 
        }
    }
}
 
    // calling customer object to load the customer detail from database.
    // id = customer_uuid which stored in session
    $customer->load($_SESSION['final']);
       
?>

    <div class="sign-up-container">
        <h2> Update </h2>
        
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <?php?>
            <div class="row">
            <div class="inline-block">
                <label>First Name :</label>
                <input type="text" name="firstname" class="form-control"  value="<?php echo $customer->getFirstname(); ?>" ><span class="required"></span>
                <span class="error"><?php echo $firstnameErrorMessage;?></span>
            </div>
            </div> 
            <div class="row">
            <div class="inline-block">
                <label>Last Name:</label>
                <input type="text" name="lastname" class="form-control" value="<?php echo $customer->getLastname(); ?>" ><span class="required"></span>
                <span class="error"><?php echo $lastnameErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block">
                <label>Address :</label>
                <input type="text" name="address" class="form-control" value="<?php echo $customer->getAddress(); ?>" ><span class="required"></span>
                <span class="error"><?php echo $addressErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block">
                <label>City :  </label>
                <input type="text" name="city" class="form-control" value="<?php echo $customer->getCity(); ?>" ><span class="required"></span>
                <span class="error"><?php echo $cityErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block">
                <label>Province :  </label>
                <input type="text" name="province" class="form-control" value="<?php echo $customer->getProvince(); ?>" ><span class="required"></span>
                <span class="error"><?php echo $provinceErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block">
                <label>Postal Code :</label>
                <input type="text" name="postal_code" class="form-control" value="<?php echo $customer->getPostalcode(); ?>"><span class="required"></span>
                <span class="error"><?php echo $postalcodeErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block" >
                <label>Username</label>
                <input type="text" name="username" class="form-control" value="<?php echo $customer->getUsername(); ?>" ><span class="required"></span>
                <input type="hidden" name="customer_uuid" value="<?php $customer->getCustomerUUID(); ?>"/>
                <span class="error"><?php echo $usernameErrorMessage;?></span>
            </div>  
            </div>
            <div class="row">
            <div class="inline-block">
                <label>Password </label>
                <input type="password" name="password" class="form-control" value="<?php ?>" ><span class="required"></span>
                <span class="error"><?php echo $passwordErrorMessage;?></span>
            </div>
            </div>
            <div class="row">
            <div class="inline-block">
                <button type="submit" class="btn btn-primary" value="update" name="update">Update Info</button>
                
            </div>
            </div>
        </form>
    </div>
