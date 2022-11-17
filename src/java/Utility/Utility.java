/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Utility;

import DAL.DAO;
import Model.*;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 *
 * @author ducda
 */
public class Utility implements Comparator<OptionProduct> {

//    public int compare(Product o1, Product o2) {
//        float p1 = o1.getProductPrice1();
//        float p2 = o2.getProductPrice1();
//        if (p1 > p2) {
//            return 1;
//        } else if (p1 == p2) {
//            return 0;
//        } else {
//            return -1;
//        }
//    }
    public byte[] getSHA(String input) throws NoSuchAlgorithmException {
        // Static getInstance method is called with hashing SHA
        MessageDigest md = MessageDigest.getInstance("SHA-256");

        // digest() method called
        // to calculate message digest of an input
        // and return array of byte
        return md.digest(input.getBytes(StandardCharsets.UTF_8));
    }

    public String toHexString(byte[] hash) {
        // Convert byte array into signum representation
        BigInteger number = new BigInteger(1, hash);

        // Convert message digest into hex value
        StringBuilder hexString = new StringBuilder(number.toString(16));

        // Pad with leading zeros
        while (hexString.length() < 64) {
            hexString.insert(0, '0');
        }

        return hexString.toString();
    }

    public static ArrayList<tempOp> lstTmp = new ArrayList<>();

    public static ArrayList<tempOp> getTemp() {
        return lstTmp;
    }

    public static void removeAll() {
        lstTmp.removeAll(lstTmp);
    }

    public static void addOP(String n, String p, String q) {
        lstTmp.add(new tempOp(n, p, q));
    }

    public static ArrayList<OptionProduct> getDis(ArrayList<OptionProduct> lstO) {
        ArrayList<OptionProduct> st = lstO;
        Set<OptionProduct> set = new TreeSet<>(new Comparator<OptionProduct>() {
            @Override
            public int compare(OptionProduct o1, OptionProduct o2) {
                if (o1.getProductID() == (o2.getProductID())) {
                    return 0;
                }
                return 1;
            }
        });

        set.addAll(st);
        st.clear();
        st.addAll(set);
        return st;
    }

    public static ArrayList<City> getLstC(ArrayList<City> lstO) {
        ArrayList<City> st = lstO;
        Set<City> set = new TreeSet<>(new Comparator<City>() {
            @Override
            public int compare(City o1, City o2) {
                if (o1.getCityID().equals(o2.getCityID())) {
                    return 0;
                }
                return 1;
            }
        });

        set.addAll(st);
        st.clear();
        st.addAll(set);
        return st;
    }

    public static void main(String[] args) {
        DAO dao  = new DAO();
        ArrayList<OptionProduct> st = dao.getOptionPro();
        for (OptionProduct optionProduct : st) {
            System.out.println(optionProduct.getProductID());
        }
        System.out.println("--------------");
      List<OptionProduct> lstOp = getPriceWithoutDuplicates(st);
        for (OptionProduct optionProduct : lstOp) {
            System.out.println(optionProduct.getProductID() + " " + optionProduct.getOptionID() + " " + optionProduct.getOptionPrice() );
        }
    }

    @Override
    public int compare(OptionProduct c1, OptionProduct c2) {
        return Integer.compare(c1.getProductID(), c2.getProductID());
    }

    private static List<OptionProduct> getPriceWithoutDuplicates(final List<OptionProduct> cars) {
        Set<OptionProduct> carSet = new TreeSet<OptionProduct>(new Utility());
        for (OptionProduct car : cars) {
            carSet.add(car);
        }
        List<OptionProduct> withoutDuplicates = new ArrayList<OptionProduct>(carSet);
        return withoutDuplicates;
    }

   
}
