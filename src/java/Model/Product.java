/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Product {
    private int ProductID;
    private int ProductStar;
    private String ProductComment;
    private String ProductDetail;
    private String ProductName;
    private String ProductImg1;
    private String ProductImg2;
    private String ProductImg3;
    private String ProductImg4;
    private String ProductImg5;
    private int ShopID;
    private int CategoryID;
    private String ProductBrand;
    private String ProductCountry;
    private float ProductWeight;
    private String ProductMaterial;
    private int codeCheck;

    public Product() {
    }

    public Product(int ProductID, int ProductStar, String ProductComment, String ProductDetail, String ProductName, String ProductImg1, String ProductImg2, String ProductImg3, String ProductImg4, String ProductImg5, int ShopID, int CategoryID, String ProductBrand, String ProductCountry, float ProductWeight, String ProductMaterial, int codeCheck) {
        this.ProductID = ProductID;
        this.ProductStar = ProductStar;
        this.ProductComment = ProductComment;
        this.ProductDetail = ProductDetail;
        this.ProductName = ProductName;
        this.ProductImg1 = ProductImg1;
        this.ProductImg2 = ProductImg2;
        this.ProductImg3 = ProductImg3;
        this.ProductImg4 = ProductImg4;
        this.ProductImg5 = ProductImg5;
        this.ShopID = ShopID;
        this.CategoryID = CategoryID;
        this.ProductBrand = ProductBrand;
        this.ProductCountry = ProductCountry;
        this.ProductWeight = ProductWeight;
        this.ProductMaterial = ProductMaterial;
        this.codeCheck = codeCheck;
    }

    public int getCodeCheck() {
        return codeCheck;
    }

    public void setCodeCheck(int codeCheck) {
        this.codeCheck = codeCheck;
    }

    

    public int getProductID() {
        return ProductID;
    }

    public void setProductID(int ProductID) {
        this.ProductID = ProductID;
    }

    public int getProductStar() {
        return ProductStar;
    }

    public void setProductStar(int ProductStar) {
        this.ProductStar = ProductStar;
    }

    public String getProductComment() {
        return ProductComment;
    }

    public void setProductComment(String ProductComment) {
        this.ProductComment = ProductComment;
    }

    public String getProductDetail() {
        return ProductDetail;
    }

    public void setProductDetail(String ProductDetail) {
        this.ProductDetail = ProductDetail;
    }

    public String getProductName() {
        return ProductName;
    }

    public void setProductName(String ProductName) {
        this.ProductName = ProductName;
    }

    public String getProductImg1() {
        return ProductImg1;
    }

    public void setProductImg1(String ProductImg1) {
        this.ProductImg1 = ProductImg1;
    }

    public String getProductImg2() {
        return ProductImg2;
    }

    public void setProductImg2(String ProductImg2) {
        this.ProductImg2 = ProductImg2;
    }

    public String getProductImg3() {
        return ProductImg3;
    }

    public void setProductImg3(String ProductImg3) {
        this.ProductImg3 = ProductImg3;
    }

    public String getProductImg4() {
        return ProductImg4;
    }

    public void setProductImg4(String ProductImg4) {
        this.ProductImg4 = ProductImg4;
    }

    public String getProductImg5() {
        return ProductImg5;
    }

    public void setProductImg5(String ProductImg5) {
        this.ProductImg5 = ProductImg5;
    }

    public int getShopID() {
        return ShopID;
    }

    public void setShopID(int ShopID) {
        this.ShopID = ShopID;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public String getProductBrand() {
        return ProductBrand;
    }

    public void setProductBrand(String ProductBrand) {
        this.ProductBrand = ProductBrand;
    }

    public String getProductCountry() {
        return ProductCountry;
    }

    public void setProductCountry(String ProductCountry) {
        this.ProductCountry = ProductCountry;
    }

    public float getProductWeight() {
        return ProductWeight;
    }

    public void setProductWeight(float ProductWeight) {
        this.ProductWeight = ProductWeight;
    }

    public String getProductMaterial() {
        return ProductMaterial;
    }

    public void setProductMaterial(String ProductMaterial) {
        this.ProductMaterial = ProductMaterial;
    }

    
    
    
}
