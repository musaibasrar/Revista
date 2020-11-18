/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Mayur
 */
public class DataUtil {
    
     static SimpleDateFormat simpleDateFormat;
    static Date returnDate;
    /**
     *
     * @param source String Object
     * @return String Object
     */
    public static String emptyString(String source){
        String target="";
        if(source==null || source.equalsIgnoreCase("")){
            target="";

        }
        else{
            target=source;
        }
        return  target;
    }
    /**
     *
     * @param src
     * @return
     */
    public static short parseShort(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0;
        }
        else{
            return Short.parseShort(src);
        }
        
    }
    /**
     *
     * @param src
     * @return
     */
    public static long parseLong(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0l;
        }
        else{
            return Long.parseLong(src);
        }

    }
    /**
     *
     * @param src
     * @return
     */
    public static double parseDouble(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0.0;
        }
        else{
            return Double.parseDouble(src);
        }

    }

     public static int parseInt(String src){
        if(src==null || src.equalsIgnoreCase("")){
            return 0;
        }
        else{
            return Short.parseShort(src);
        }
        
    }  


   
    

}
