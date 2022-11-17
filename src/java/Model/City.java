/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class City {
    private String CityID;
    private String CityName;
    private String CityType;
    private String CitySlug;

    public City() {
    }

    public City(String CityID, String CityName, String CityType, String CitySlug) {
        this.CityID = CityID;
        this.CityName = CityName;
        this.CityType = CityType;
        this.CitySlug = CitySlug;
    }

    public String getCityID() {
        return CityID;
    }

    public void setCityID(String CityID) {
        this.CityID = CityID;
    }

    public String getCityName() {
        return CityName;
    }

    public void setCityName(String CityName) {
        this.CityName = CityName;
    }

    public String getCityType() {
        return CityType;
    }

    public void setCityType(String CityType) {
        this.CityType = CityType;
    }

    public String getCitySlug() {
        return CitySlug;
    }

    public void setCitySlug(String CitySlug) {
        this.CitySlug = CitySlug;
    }
    
}
