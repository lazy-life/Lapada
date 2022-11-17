/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Category {
    private int CateggoryID;
    private String CategoryName;
    private String CategoryImg;

    public Category() {
    }

    public Category(int CateggoryID, String CategoryName, String CategoryImg) {
        this.CateggoryID = CateggoryID;
        this.CategoryName = CategoryName;
        this.CategoryImg = CategoryImg;
    }

    public int getCateggoryID() {
        return CateggoryID;
    }

    public void setCateggoryID(int CateggoryID) {
        this.CateggoryID = CateggoryID;
    }

    public String getCategoryName() {
        return CategoryName;
    }

    public void setCategoryName(String CategoryName) {
        this.CategoryName = CategoryName;
    }

    public String getCategoryImg() {
        return CategoryImg;
    }

    public void setCategoryImg(String CategoryImg) {
        this.CategoryImg = CategoryImg;
    }
    
}
