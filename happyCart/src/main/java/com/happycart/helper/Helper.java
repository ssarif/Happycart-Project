package com.happycart.helper;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import com.happycart.entity.CartItem;
import com.happycart.entity.Product;

public class Helper {
	
	public static String get10Words(String description) {
		String[] descriptionWords = description.split(" ");
		if(descriptionWords.length > 10) {
			StringBuilder stringBuilder = new StringBuilder();
			for(int i=0;i<10;i++) {
				stringBuilder.append(descriptionWords[i] + " ");
			}
			return stringBuilder.toString() + "...";
		} else {
			return description + "...";
		}
	}
	
	public static String getProductName(String name) {
		String[] nameWords = name.split(" ");
		if(nameWords.length > 5) {
			StringBuilder stringBuilder = new StringBuilder();
			for(int i=0;i<4;i++) {
				stringBuilder.append(nameWords[i] + " ");
			}
			return stringBuilder.toString() + "...";
		} else {
			return name + "...";
		}
	}
	
	public static boolean checkIfProductExistInCart(int id, List<CartItem> cartList) {
		for(CartItem cartItem : cartList) {
			if(cartItem.getProduct().getpId() == id) {
				return true;
			}
		}
		return false;
	}
	
	
	public static void incrementCartItemQuantity(int id, List<CartItem> cartList) {
		for(CartItem cartItem : cartList) {
			if(cartItem.getProduct().getpId() == id) {
				cartItem.setQuantity(cartItem.getQuantity() + 1);
			}
		}
	}
	
	public static int getTotalCartItemsQuantity(List<CartItem> cartList) {
		int totalQuantity = 0;
		for(CartItem cartItem : cartList) {
			totalQuantity += cartItem.getQuantity();
		}
		return totalQuantity;
	}
	
	public static long getOriginalPrice(int discountedPrice, int discountPercentage) {
		long originalPrice = (discountedPrice / (100 - discountPercentage)) * 100;
		return originalPrice;
	}
	
	public static long getAmountPayableForAllCartItems(List<CartItem> cartList) {
		
		long totalAmount = 0;
		for(CartItem c : cartList) {
			totalAmount += c.getProduct().getpPrice() * c.getQuantity();
		}
		return totalAmount;
	}
	
	public static long getTotalOriginalPrice(List<CartItem> cartList) {
		long totalOriginalAmount = 0;
		for(CartItem c : cartList) {
			totalOriginalAmount += getOriginalPrice(c.getProduct().getpPrice(), c.getProduct().getpDiscount()) * c.getQuantity();
		}
		return totalOriginalAmount;
	}
	
	public static String getIndianNumberFormat(long price) {
	      //Get current locale information
	      Locale currentLocale = new Locale("en", "IN");
	      
	      //Currency Formatter specific to locale
	      NumberFormat currencyFormatter = NumberFormat.getInstance(currentLocale);
	      
	      return currencyFormatter.format(price);
	}

}
