/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class OptionProduct {
    private int optionID;
    private String optionname;
    private float optionPrice;
    private int optionQuan;
    private int productID;

    public OptionProduct() {
    }

    public OptionProduct(int optionID, String optionname, float optionPrice, int optionQuan, int productID) {
        this.optionID = optionID;
        this.optionname = optionname;
        this.optionPrice = optionPrice;
        this.optionQuan = optionQuan;
        this.productID = productID;
    }

    public int getOptionID() {
        return optionID;
    }

    public void setOptionID(int optionID) {
        this.optionID = optionID;
    }

    public String getOptionname() {
        return optionname;
    }

    public void setOptionname(String optionname) {
        this.optionname = optionname;
    }

    public float getOptionPrice() {
        return optionPrice;
    }

    public void setOptionPrice(float optionPrice) {
        this.optionPrice = optionPrice;
    }

    public int getOptionQuan() {
        return optionQuan;
    }

    public void setOptionQuan(int optionQuan) {
        this.optionQuan = optionQuan;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }
    
}
