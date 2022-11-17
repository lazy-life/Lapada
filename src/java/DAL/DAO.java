/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import javax.imageio.ImageIO;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 *
 * @author ducda
 */
public class DAO {

    public String status;
    static Connection con;

    ArrayList<Address> lstAdd;
    ArrayList<Cart> lstCart;
    ArrayList<Category> lstCategory;
    ArrayList<City> lstCity;
    ArrayList<District> lstDistrict;
    ArrayList<Order> lstOrder;
    ArrayList<Product> lstProduct;
    ArrayList<Product> lstTop3;
    ArrayList<Product> lstNextTop3;
    ArrayList<Shop> lstShop;
    ArrayList<User> lstUs;
    ArrayList<String> lstBrand;
    ArrayList<String> lstMaterial;
    ArrayList<tempOp> lstTempOp = new ArrayList<>();
    ArrayList<OptionProduct> lstOptionPro;

    public DAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error connection" + e.getMessage();
        }
    }

    public ArrayList<OptionProduct> getOptionPro() {

        lstOptionPro = new ArrayList<OptionProduct>();
        String sql = "select * from OptionProduct_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstOptionPro.add(new OptionProduct(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Address " + e.getMessage();
        }
        return lstOptionPro;
    }

    public ArrayList<OptionProduct> getOptionProS(String sqlS) {

        lstOptionPro = new ArrayList<OptionProduct>();
        String sql = sqlS;
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstOptionPro.add(new OptionProduct(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Address " + e.getMessage();
        }
        return lstOptionPro;
    }

    public ArrayList<OptionProduct> getOptionAsc() {

        lstOptionPro = new ArrayList<OptionProduct>();
        String sql = "SELECT * FROM OptionProduct_HE161204 order by OptionProductPrice asc";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstOptionPro.add(new OptionProduct(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Address " + e.getMessage();
        }
        return lstOptionPro;
    }

    public ArrayList<OptionProduct> getOptionDesc() {

        lstOptionPro = new ArrayList<OptionProduct>();
        String sql = "SELECT * FROM OptionProduct_HE161204 order by OptionProductPrice desc";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstOptionPro.add(new OptionProduct(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            status = "Error at read Address " + e.getMessage();
        }
        return lstOptionPro;
    }
//    public ArrayList<tempOp> getTemp() {
//
//        lstTempOp = new ArrayList<tempOp>();
//        String sql = "select * from addTemp";
//        try {
//            PreparedStatement ps = con.prepareCall(sql);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                lstTempOp.add(new tempOp(rs.getString(1), rs.getString(2), rs.getString(3)));
//            }
//        } catch (Exception e) {
//            status = "Error at read Address " + e.getMessage();
//        }
//        return lstTempOp;
//    }

    public ArrayList<tempOp> getTemp() {
        return lstTempOp;
    }

    //delete
    public void deleteAll() {
        String sql = "DELETE FROM addTemp";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.execute();
        } catch (Exception e) {
            status = "Error";
        }
    }

    //load
    public ArrayList<Address> getAddress() {

        lstAdd = new ArrayList<Address>();
        String sql = "select * from Address_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstAdd.add(new Address(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
            status = "Error at read Address " + e.getMessage();
        }
        return lstAdd;
    }

    public void InsertAdd(String detail, String phone, String usId, String city, String dis, String name) {
        String sql = "insert into Address_HE161204 values(?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, detail);
            ps.setString(2, phone);
            ps.setString(3, usId);
            ps.setString(4, city);
            ps.setString(5, dis);
            ps.setString(6, name);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert add " + e.getMessage();
        }
    }

    public ArrayList<Cart> getCart() {
        lstCart = new ArrayList<Cart>();
        String sql = "select * from Cart_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstCart.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            status = "Error at read Cart " + e.getMessage();
        }
        return lstCart;

    }

    //update cart
    public void updateCart(int amount, int cartid) {
        lstCart = new ArrayList<Cart>();
        String sql = "update Cart_HE161204 set ProductAmount = ? where CartID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, amount);
            ps.setInt(2, cartid);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update Cart " + e.getMessage();
        }
    }

    public ArrayList<Cart> getCartById(String id) {
        lstCart = new ArrayList<Cart>();
        String sql = "select * from Cart_HE161204 where UserID = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                lstCart.add(new Cart(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getInt(4), rs.getInt(5), rs.getInt(6)));
            }
        } catch (Exception e) {
            status = "Error at read Cart " + e.getMessage();
        }
        return lstCart;

    }

    public ArrayList<Order> getOrder() {
        lstOrder = new ArrayList<Order>();
        String sql = "select * from Order_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstOrder.add(new Order(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getInt(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at read Order " + e.getMessage();
        }
        return lstOrder;
    }

    public ArrayList<Category> getCategory() {
        lstCategory = new ArrayList<Category>();
        String sql = "select * from Category_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstCategory.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "Error at read Category " + e.getMessage();
        }
        return lstCategory;

    }

    public ArrayList<City> getCity() {
        lstCity = new ArrayList<City>();
        String sql = "select * from City_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstCity.add(new City(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read City " + e.getMessage();
        }
        return lstCity;
    }

    public ArrayList<District> getDistrict() {
        lstDistrict = new ArrayList<District>();
        String sql = "select * from District_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstDistrict.add(new District(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read District " + e.getMessage();
        }
        return lstDistrict;
    }

    public ArrayList<District> getDistrictByCity(String id) {
        lstDistrict = new ArrayList<District>();
        String sql = "select * from District_HE161204 where CityID = ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                lstDistrict.add(new District(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read District " + e.getMessage();
        }
        return lstDistrict;
    }

    public void deleteProduct(int prId) {
        String sql = "delete Product_HE161204 where ProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, prId);
            ps.execute();
        } catch (Exception e) {
            status = "Error";
        }
    }

    public void deleteOptionPro(int prId) {
        String sql = "delete OptionProduct_HE161204 where OptionProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, prId);
            ps.execute();
        } catch (Exception e) {
            status = "Error";
        }
    }

    public void deleteCart(int cartId) {
        String sql = "delete Cart_HE161204 where CartID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, cartId);
            ps.execute();
        } catch (Exception e) {
            status = "Error";
        }
    }

    public ArrayList<Product> getProduct() {
        lstProduct = new ArrayList<Product>();
        String sql = "select * from Product_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public ArrayList<Product> getProductSearch(String sqlS) {
        lstProduct = new ArrayList<Product>();
        String sql = sqlS;
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public ArrayList<Product> getTop24() {
        lstProduct = new ArrayList<Product>();
        String sql = "select top 12 * from Product_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public ArrayList<Product> getNext3Product(int amount) {
        lstProduct = new ArrayList<Product>();
        String sql = "SELECT * FROM Product_HE161204 ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public ArrayList<Shop> getShop() {
        lstShop = new ArrayList<Shop>();
        String sql = "select * from Shop_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstShop.add(new Shop(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4)));
            }
        } catch (Exception e) {
            status = "Error at read Shop " + e.getMessage();
        }
        return lstShop;
    }

    public ArrayList<User> getUs() {
        lstUs = new ArrayList<User>();
        String sql = "select * from User_HE161204";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstUs.add(new User(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getString(4),
                        rs.getInt(5), rs.getString(6),
                        rs.getString(7), rs.getInt(8)));
            }
        } catch (Exception e) {
            status = "Error at read User " + e.getMessage();
        }
        return lstUs;
    }

    //insert
    public void InsertUser(String UserID, String UserName, String UserPass,
            int UserVeri, String UserEmail, String UserImg, int UserStatus) {
        String sql = "insert into User_HE161204(UserID, UserName, UserPass,UserVeri, UserEmail,UserImg,UserStatus) values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, UserID);
            ps.setString(2, UserName);
            ps.setString(3, UserPass);
            ps.setInt(4, UserVeri);
            ps.setString(5, UserEmail);
            ps.setString(6, UserImg);
            ps.setInt(7, UserStatus);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert User " + e.getMessage();
        }
    }

    //insert shop
    public void InsertShop(String name, String avt, String usId, String detail) {
        String sql = "insert into Shop_HE161204 values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, avt);
            ps.setString(3, usId);
            ps.setString(4, detail);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Shop " + e.getMessage();
        }
    }

    public void InsertTemp(String name, String pr, String qu) {
        tempOp t = new tempOp(name, pr, qu);
        lstTempOp.add(t);
    }

    public void InsertOrder(int amount, float price, int sta, String usID, int shopID, int proID, int addid) {
        String sql = "insert into Order_HE161204 values(?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, amount);
            ps.setFloat(2, price);
            ps.setInt(3, sta);
            ps.setString(4, usID);
            ps.setInt(5, shopID);
            ps.setInt(6, proID);
            ps.setInt(7, addid);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Order " + e.getMessage();
        }
    }

    public void updateOrder(int id, int sta) {
        String sql = "update Order_HE161204 set OrderStatus = ? where OrderID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, sta);
            ps.setInt(2, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Order " + e.getMessage();
        }
    }

    //insert add
//    public void InsertAdd(String detail, String phone, String usId, String city, String district) {
//        String sql = "insert into Address_HE161204 values(?,?,?,?,?)";
//        try {
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, detail);
//            ps.setString(2, phone);
//            ps.setString(3, usId);
//            ps.setString(4, city);
//            ps.setString(5, district);
//            ps.execute();
//        } catch (Exception e) {
//            status = "Error at insert Shop " + e.getMessage();
//        }
//    }
    //insert cart
    public void InsertCart(int prAmount, String UsId, int ShopId, int prId, int opId) {
        String sql = "insert into Cart_HE161204 values(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, prAmount);
            ps.setString(2, UsId);
            ps.setInt(3, ShopId);
            ps.setInt(4, prId);
            ps.setInt(5, opId);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Cart " + e.getMessage();
        }
    }

    //update product
    public void updateProduct(int productID, String ProductDetail, String ProductName, String ProductImg1,
            String ProductImg2, String ProductImg3, String ProductImg4, String ProductImg5, int ShopID, int CategoryID, String ProductBrand, String ProductCountry,
            float ProductWeight, String ProductMaterial) {
        String sql = "update Product_HE161204 set ProductDetail = ?, ProductName = ?,ProductImg1 = ?, ProductImg2 = ?,\n"
                + "ProductImg3 = ?,ProductImg4 = ?, ProductImg5 = ?,ShopID = ?,CategoryID = ?,ProductBrand = ?,\n"
                + "ProductCountry = ?,ProductWeight = ?,ProductMaterial = ? where ProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ProductDetail);
            ps.setString(2, ProductName);
            ps.setString(3, ProductImg1);
            ps.setString(4, ProductImg2);
            ps.setString(5, ProductImg3);
            ps.setString(6, ProductImg4);
            ps.setString(7, ProductImg5);
            ps.setInt(8, ShopID);
            ps.setInt(9, CategoryID);
            ps.setString(10, ProductBrand);
            ps.setString(11, ProductCountry);
            ps.setFloat(12, ProductWeight);
            ps.setString(13, ProductMaterial);
            ps.setInt(14, productID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update product" + e.getMessage();
        }

    }

    public void updateProductCode(int productID, int code) {
        String sql = "update Product_HE161204 set ProudctKeyCheck = ? where ProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, code);
            ps.setInt(2, productID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update product" + e.getMessage();
        }

    }

    public void updateQuan(int productID, int ProductQuantity) {
        String sql = "update OptionProduct_HE161204 set OptionProductQuantity = ? where OptionProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, ProductQuantity);
            ps.setInt(2, productID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update product" + e.getMessage();
        }

    }
    public void updateCmt(int productID, String cmt) {
        String sql = "update Product_HE161204 set ProductComment = ? where ProductID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cmt);
            ps.setInt(2, productID);
            ps.execute();
        } catch (Exception e) {
            status = "Error at update product" + e.getMessage();
        }

    }

    public void UpdateUser(String UserID, String UserName, String UserPass, int UserVeri, String UserEmail, String UserImg, int UserStatus) {
        String sql = "Update User_HE161204 set UserName = ?, UserPass = ?, UserVeri = ?, UserEmail = ?, UserImg = ?, UserStatus = ? where UserID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, UserName);
            ps.setString(2, UserPass);
            ps.setInt(3, UserVeri);
            ps.setString(4, UserEmail);
            ps.setString(5, UserImg);
            ps.setInt(6, UserStatus);
            ps.setString(7, UserID);
            ps.execute();
        } catch (Exception e) {
            status = "Error Update User" + e.getMessage();
        }
    }
    public void UpdateUserStatus(String UserID,int UserStatus) {
        String sql = "Update User_HE161204 set UserStatus = ? where UserID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, UserStatus);
            ps.setString(2, UserID);
            ps.execute();
        } catch (Exception e) {
            status = "Error Update User" + e.getMessage();
        }
    }

    public void UpdateFullUser(String UserID, String phone, String UserName, String UserPass, int UserVeri, String UserEmail, String UserImg, int UserStatus) {
        String sql = "Update User_HE161204 set UserName = ?, UserPass = ?, UserVeri = ?, UserEmail = ?, UserImg = ?, UserStatus = ?,UserPhone = ? where UserID = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, UserName);
            ps.setString(2, UserPass);
            ps.setInt(3, UserVeri);
            ps.setString(4, UserEmail);
            ps.setString(5, UserImg);
            ps.setInt(6, UserStatus);
            ps.setString(7, phone);
            ps.setString(8, UserID);
            ps.execute();
        } catch (Exception e) {
            status = "Error Update User" + e.getMessage();
        }
    }

    public ArrayList<Product> getSearchProduct(String key) {
        lstProduct = new ArrayList<Product>();
//        ProductPrice1
        String sql = "select * from Product_HE161204 where ProductName like ?";
        try {
            
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public ArrayList<String> getSearchBrand(String key) {
        lstBrand = new ArrayList<String>();
//        ProductPrice1
        String sql = "SELECT DISTINCT ProductBrand\n"
                + "FROM Product_HE161204\n"
                + "WHERE ProductName like ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                lstBrand.add(rs.getString(1));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstBrand;
    }

    public ArrayList<String> getMaterial(String key) {
        lstMaterial = new ArrayList<String>();
//        ProductPrice1
        String sql = "SELECT DISTINCT ProductMaterial\n"
                + "FROM Product_HE161204\n"
                + "WHERE ProductName like ?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                lstMaterial.add(rs.getString(1));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstMaterial;
    }

    public ArrayList<String> getMaterialS(String key) {
        lstMaterial = new ArrayList<String>();
//        ProductPrice1
        String sql = key;
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstMaterial.add(rs.getString(1));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstMaterial;
    }

    public ArrayList<String> getSearchBrandS(String key) {
        lstBrand = new ArrayList<String>();
//        ProductPrice1
        String sql = key;
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lstBrand.add(rs.getString(1));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstBrand;
    }
//    public ArrayList<Product> getProducSearch(String key) {
//        lstProduct = new ArrayList<Product>();
////        ProductPrice1
//        String sql = "SELECT * FROM Product_HE161204 WHERE ProductName like ?";
//        try {
//            PreparedStatement ps = con.prepareCall(sql);
//            ResultSet rs = null;
//            ps.setString(1, "%" + key + "%");
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                lstMaterial.add(rs.getString(1));
//            }
//        } catch (Exception e) {
//            status = "Error at read Product " + e.getMessage();
//        }
//        return lstProduct;
//    }

    public ArrayList<Product> getSearchProduct1(String key) {
        lstProduct = new ArrayList<Product>();
//        ProductPrice1
        String sql = "select * from Product_HE161204 where ProductName like ? order by ProductPrice1 desc";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = null;
            ps.setString(1, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                lstProduct.add(new Product(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6),
                        rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getInt(11), rs.getInt(12), rs.getString(13),
                        rs.getString(14), rs.getFloat(15), rs.getString(16), rs.getInt(17)));
            }
        } catch (Exception e) {
            status = "Error at read Product " + e.getMessage();
        }
        return lstProduct;
    }

    public void InsertOption(String name, float price, int quan, int id) {
        String sql = "insert into OptionProduct_HE161204 values(?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setFloat(2, price);
            ps.setInt(3, quan);
            ps.setInt(4, id);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert Option " + e.getMessage();
        }

    }

    //insert product
    public void InsertProduct(String ProductDetail, String ProductName, String ProductImg1,
            String ProductImg2, String ProductImg3, String ProductImg4, String ProductImg5, int ShopID, int CategoryID, String ProductBrand, String ProductCountry,
            float ProductWeight, String ProductMaterial, int codeCheck) {
        String sql = "insert into Product_HE161204(ProductDetail, ProductName,ProductImg1,ProductImg2,ProductImg3,ProductImg4,\n"
                + "ProductImg5,ShopID,CategoryID,ProductBrand,ProductCountry,ProductWeight,ProductMaterial,ProudctKeyCheck) "
                + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, ProductDetail);
            ps.setString(2, ProductName);
            ps.setString(3, ProductImg1);
            ps.setString(4, ProductImg2);
            ps.setString(5, ProductImg3);
            ps.setString(6, ProductImg4);
            ps.setString(7, ProductImg5);
            ps.setInt(8, ShopID);
            ps.setInt(9, CategoryID);
            ps.setString(10, ProductBrand);
            ps.setString(11, ProductCountry);
            ps.setFloat(12, ProductWeight);
            ps.setString(13, ProductMaterial);
            ps.setInt(14, codeCheck);
            ps.execute();
        } catch (Exception e) {
            status = "Error at insert User " + e.getMessage();
        }

    }

    public List<Product> getListByPage(List<Product> list, int start, int end) {
        List<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        for (Product product : dao.getSearchProduct("")) {
            System.out.println(product);
        }
    }
    //update
    //delete

}
