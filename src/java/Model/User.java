/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ducda
 */
public class User {
    private String UserID;
    private String UserName;
    private String UserPhone;
    private String UserPass;
    private int UserVeri;
    private String UserEmail;
    private String UserImg;
    private int UserStatus;

    public User() {
    }

    public User(String UserID, String UserName, String UserPhone, String UserPass, int UserVeri, String UserEmail, String UserImg, int UserStatus) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.UserPhone = UserPhone;
        this.UserPass = UserPass;
        this.UserVeri = UserVeri;
        this.UserEmail = UserEmail;
        this.UserImg = UserImg;
        this.UserStatus = UserStatus;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    public String getUserPhone() {
        return UserPhone;
    }

    public void setUserPhone(String UserPhone) {
        this.UserPhone = UserPhone;
    }

    public String getUserPass() {
        return UserPass;
    }

    public void setUserPass(String UserPass) {
        this.UserPass = UserPass;
    }

    public int getUserVeri() {
        return UserVeri;
    }

    public void setUserVeri(int UserVeri) {
        this.UserVeri = UserVeri;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }

    public String getUserImg() {
        return UserImg;
    }

    public void setUserImg(String UserImg) {
        this.UserImg = UserImg;
    }

    public int getUserStatus() {
        return UserStatus;
    }

    public void setUserStatus(int UserStatus) {
        this.UserStatus = UserStatus;
    }

    
    
}
