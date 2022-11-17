/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Shop {
    private int ShopID;
    private String ShopName;
    private String ShopImg;
    private String UserID;

    public Shop() {
    }

    public Shop(int ShopID, String ShopName, String ShopImg, String UserID) {
        this.ShopID = ShopID;
        this.ShopName = ShopName;
        this.ShopImg = ShopImg;
        this.UserID = UserID;
    }

    public int getShopID() {
        return ShopID;
    }

    public void setShopID(int ShopID) {
        this.ShopID = ShopID;
    }

    public String getShopName() {
        return ShopName;
    }

    public void setShopName(String ShopName) {
        this.ShopName = ShopName;
    }

    public String getShopImg() {
        return ShopImg;
    }

    public void setShopImg(String ShopImg) {
        this.ShopImg = ShopImg;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }
}
