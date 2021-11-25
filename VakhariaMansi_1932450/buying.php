<?php
//Revision History

//Mansi Vakharia(1932450)    07-Feb-2021    Created an empty file
//Mansi Vakharia(1932450)    13-Feb-2021    Added the common function file and called the functions to setup basic page
//Mansi Vakharia(1932450)    24-Feb-2021    Created an html form to display in the page
//Mansi Vakharia(1932450)    07-Mar-2021    Handled the validations of the form by calling the error messages when needed
//Mansi Vakharia(1932450)    13-Mar-2021    Checked the malfunctioned html code generating from the file and corrected the validations
//Mansi Vakharia(1932450)    14-Mar-2021    Finalized and reviewed the project, still not able to figure out the reson why the data passed in the form is not being saved
//Mansi Vakharia(1932450)    29-April-2021  Added the classes for reference and checked if the session is logged in or not
//Mansi Vakharia(1932450)    2-May-2021     Changed the file for buying the product

session_start();

//including the php common functions file to call the common functions
include 'PHP_FUNCTIONS/phpFunctions.php';
//including database connection
require_once ("database-connection.php");
//including classes
include_once 'Classes/customer.php';
include_once 'Classes/product.php';
include_once 'Classes/products.php';
include_once 'Classes/purchase.php';
include_once 'Classes/purchases.php';

//check if user is logged in or not.
if(!checksession()){            
    header("location:login.php");
}

//calling the header
createheader('Buy');
//calling the navigation menu to acces it in the page
navigation();
//calling the logo to display the logo in this page
logo();

//error reporting when defined 0, the error if occuring in the page would not be shown to the user
error_reporting(0);

//defining constants
$quantityErrorMessage="";
$commentsErrorMessage="";

$product = new product();
if(isset($_POST['buy'])){
    $select_product=(htmlspecialchars($_POST['products']));
    $quantity =htmlspecialchars($_POST['quantity']);
    $product->load($select_product);
    
    $customer_uuid = $_SESSION['final'];   // id here for session of customer_uuid
    echo '$customerId';
    $price= $product->getPrice();
    $comments=htmlspecialchars($_POST['comments']);
    
    //multiply the price by the quantity, which gives you the subtotal:
    $subtotal = round($price *$quantity,2);
    $taxes_amount = round($subtotal * TAX_RATE,2);
    $grandtotal = round($subtotal + $taxes_amount,2);
    
    $flag=1;
    if(mb_strlen($quantity)> QUANTITY_MAX_LENGTH)
    {
        $quantityErrorMessage = " The quantity cannot contain more than ". QUANTITY_MAX_LENGTH . " charaters";
        
        $flag=0;
    }
    if(mb_strlen($quantity)== 0)
    {
        $quantityErrorMessage = " The quantity cannot be empty";
        
        $flag=0;
    }
    if(mb_strlen($comments)> COMMENTS_MAX_LENGTH)
    {
        $commentsErrorMessage = " The comments cannot contain more than ". COMMENTS_MAX_LENGTH . " charaters";
        
        $flag=0;
    }
    
    if($flag==1){
        $purchase = new purchase();

        $purchase->setProductUUID($select_product);
        $purchase->setCustomerUUID($customerId);
        $purchase->setQuantity($quantity);
        $purchase->setPrice($price);
        $purchase->setComments($comments);  
        $purchase->setSubtotal($subtotal);
        $purchase->setTaxesamount($taxes_amount);
        $purchase->setGrandtotal($grandtotal);

        $purchase->save();
    }  
}
?>

<div class="buyform-container">
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" > 
           <div class="row">
            <div class="inline-block">
                <label for="aligned-name"> Product code: </label>
            <select name="products" id="products" value="products">
              <?php
                foreach($products->items as $product){
                   echo '<option value=" '.$product->getProductUUID() .'">'.$product->getProductcode()." ".$product->getDescription().",Price:$".$product->getPrice().'</option>';
                }
              ?>
              
            </select>  
           </div>
          </div>     

          <div class="row">
            <div class="inline-block">
                <label>Comments:</label>
                <input type="text" class="form-control" name="comments" value="<?php //echo $comments; ?>"><span class="required"></span><span class="error"><?php //echo $quantityErrorMessage;?></span>
            </div>
          </div>
                
          <div class="row">
            <div class="inline-block">
                <label>Quantity:</label>
                <input type="number" class="form-control" name="quantity" value="<?php //echo $quantity; ?>"><span class="required"></span><span class="error"><?php //echo $quantityErrorMessage;?></span>
            </div>
          </div>
                
          <div class="row">
            <div class="inline-block btn">            
                <button type="submit" class="form-control" value="buy" name="buy">Buy</button>                
            </div>
          </div>
        </form>
</div>
<?php
//calling the footer from the common file to display the common footer of the website
footer();
?>