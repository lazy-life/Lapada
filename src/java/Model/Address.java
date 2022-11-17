/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class Address {
    private int AddressID;
    private String AddressDetail;
    private String AddressPhone;
    private String UserID;
    private String CityID;
    private String DistrictID;
    private String cusName;

    public Address() {
    }

    public Address(int AddressID, String AddressDetail, String AddressPhone, String UserID, String CityID, String DistrictID, String cusName) {
        this.AddressID = AddressID;
        this.AddressDetail = AddressDetail;
        this.AddressPhone = AddressPhone;
        this.UserID = UserID;
        this.CityID = CityID;
        this.DistrictID = DistrictID;
        this.cusName = cusName;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    

    public int getAddressID() {
        return AddressID;
    }

    public void setAddressID(int AddressID) {
        this.AddressID = AddressID;
    }

    public String getAddressDetail() {
        return AddressDetail;
    }

    public void setAddressDetail(String AddressDetail) {
        this.AddressDetail = AddressDetail;
    }

    public String getAddressPhone() {
        return AddressPhone;
    }

    public void setAddressPhone(String AddressPhone) {
        this.AddressPhone = AddressPhone;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getCityID() {
        return CityID;
    }

    public void setCityID(String CityID) {
        this.CityID = CityID;
    }

    public String getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(String DistrictID) {
        this.DistrictID = DistrictID;
    }
    
}
