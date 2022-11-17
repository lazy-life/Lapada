/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Order {
    private int OrderID;
    private int ProductAmount;
    private float OrderTotalPrice;
    private int OrderStatus;
    private String UserID;
    private int ShopID;
    private int ProductID;
    private int addID;

    public Order() {
    }

    public Order(int OrderID, int ProductAmount, float OrderTotalPrice, int OrderStatus, String UserID, int ShopID, int ProductID, int addID) {
        this.OrderID = OrderID;
        this.ProductAmount = ProductAmount;
        this.OrderTotalPrice = OrderTotalPrice;
        this.OrderStatus = OrderStatus;
        this.UserID = UserID;
        this.ShopID = ShopID;
        this.ProductID = ProductID;
        this.addID = addID;
    }

    public int getAddID() {
        return addID;
    }

    public void setAddID(int addID) {
        this.addID = addID;
    }

    

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getProductAmount() {
        return ProductAmount;
    }

    public void setProductAmount(int ProductAmount) {
        this.ProductAmount = ProductAmount;
    }

    public float getOrderTotalPrice() {
        return OrderTotalPrice;
    }

    public void setOrderTotalPrice(float OrderTotalPrice) {
        this.OrderTotalPrice = OrderTotalPrice;
    }

    public int getOrderStatus() {
        return OrderStatus;
    }

    public void setOrderStatus(int OrderStatus) {
        this.OrderStatus = OrderStatus;
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
