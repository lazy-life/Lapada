/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class District {
    private String DistrictID;
    private String DistrictName;
    private String DistrictType;
    private String CityID;

    public District() {
    }

    public District(String DistrictID, String DistrictName, String DistrictType, String CityID) {
        this.DistrictID = DistrictID;
        this.DistrictName = DistrictName;
        this.DistrictType = DistrictType;
        this.CityID = CityID;
    }

    public String getDistrictID() {
        return DistrictID;
    }

    public void setDistrictID(String DistrictID) {
        this.DistrictID = DistrictID;
    }

    public String getDistrictName() {
        return DistrictName;
    }

    public void setDistrictName(String DistrictName) {
        this.DistrictName = DistrictName;
    }

    public String getDistrictType() {
        return DistrictType;
    }

    public void setDistrictType(String DistrictType) {
        this.DistrictType = DistrictType;
    }

    public String getCityID() {
        return CityID;
    }

    public void setCityID(String CityID) {
        this.CityID = CityID;
    }
     
}
