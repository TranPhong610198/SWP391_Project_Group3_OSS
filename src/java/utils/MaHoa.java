/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.security.MessageDigest;
import org.apache.tomcat.util.codec.binary.Base64;
import utils.BCrypt;

/**
 *
 * @author nguye
 */


public class MaHoa {
    public static String toBcrypt(String pass){
        String result = null;
        try {
              BCrypt bCrypt = new BCrypt();
              result = bCrypt.hashpw(pass, bCrypt.gensalt());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) {
        System.out.println(toBcrypt("123"));
        System.out.println(toBcrypt("123"));
        System.out.println(toBcrypt("123"));
    }
}