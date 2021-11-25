<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of collection
 *
 * @author hp
 */
class collection {
    //put your code here
    //create array, containing all the customers,products,purchases
    public $items = array();
    
    //$item is object of type customer,product,purchase
    public function add($primarykey,$item){
        $this->items[$primarykey] = $item;    
    }//end of add function
    
    //use to remove item,(if i tried to delete product etc.. with this primary key then, if it's isset then unset it)
    public function remove($primarykey){
        //if isset primarykey then unset it(remove item)
        if(isset($this->items[$primarykey])){
            // destroy the item in array
            unset($this->items[$primarykey]);
        }//end if
    }//end of remove function
    
    // get the item in array
    public function get($primarykey){
        //if the item is isset then unset it(remove item)
        if(isset($this->items[$primarykey])){
            // destroy the item in array
            return($this->items[$primarykey]);
        }//end if
    }//end of function
    
    // return the count of item, so not need any
    // not receive any parameter as we want to return the count of item
     public function count(){
        return count($this->items);
    }//end of function count
}
