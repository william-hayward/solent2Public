/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.solent.com504.oodd.cart.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.solent.com504.oodd.cart.model.service.ShoppingCart;
import org.solent.com504.oodd.cart.model.dto.ShoppingItem;

/**
 *
 * @author cgallen
 */
public class ShoppingCartImpl implements ShoppingCart {

    private HashMap<String, ShoppingItem> itemMap = new HashMap<String, ShoppingItem>();

    @Override
    public List<ShoppingItem> getShoppingCartItems() {
        List<ShoppingItem> itemlist = new ArrayList();
        for (String itemUUID : itemMap.keySet()) {
            ShoppingItem shoppingCartItem = itemMap.get(itemUUID);
            itemlist.add(shoppingCartItem);
        }
        return itemlist;
    }

    @Override
    public void addItemToCart(ShoppingItem shoppingItem) {
        //itemMap.put(shoppingItem.getUuid(), shoppingItem);
        
        boolean Existing = false;
        for (String itemUUID : itemMap.keySet()){
            ShoppingItem shoppingCartItem = itemMap.get(itemUUID);
            if (shoppingItem.getName().equals(shoppingCartItem.getName())) {
            Integer p = shoppingCartItem.getQuantity();
            shoppingCartItem.setQuantity(p+1);
            double m = shoppingItem.getPrice();
            double t = shoppingCartItem.getPrice();
            shoppingCartItem.setPrice(m+t);
            Existing = true;
            break;
            }
            
        }
        
        if (!Existing){
            shoppingItem.setQuantity(1);
            itemMap.put(shoppingItem.getUuid(), shoppingItem);
        }
    }

    
    @Override
    public void removeItemFromCart(String itemUuid) {
        itemMap.remove(itemUuid);
        
         //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getTotal() {
        double total = 0;
        for (String itemUUID : itemMap.keySet()) {
            ShoppingItem shoppingCartItem = itemMap.get(itemUUID);
            total = total + shoppingCartItem.getPrice();
            
       }
            
       return total;
            
        
    }

}
