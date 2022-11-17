/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Cart {
    private int CartID;
    private int ProductAmount;
    private String UserID;
    private int ShopID;
    private int ProductID;
    private int OptionID;

    public Cart() {
    }

    public Cart(int CartID, int ProductAmount, String UserID, int ShopID, int ProductID, int OptionID) {
        this.CartID = CartID;
        this.ProductAmount = ProductAmount;
        this.UserID = UserID;
        this.ShopID = ShopID;
        this.ProductID = ProductID;
        this.OptionID = OptionID;
    }

    public int getOptionID() {
        return OptionID;
    }

    public void setOptionID(int OptionID) {
        this.OptionID = OptionID;
    }

    

    public int getCartID() {
        return CartID;
    }

    public void setCartID(int CartID) {
        this.CartID = CartID;
    }

    public int getProductAmount() {
        return ProductAmount;
    }

    public void setProductAmount(int ProductAmount) {
        this.ProductAmount = ProductAmount;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public int getShopID() {
        return ShopID;
    }

    public void setShopID(int ShopID) {
        this.ShopID = ShopID;
    }

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }
    
}
