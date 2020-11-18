/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.FileReader;
import java.util.Properties;

/**
 *
 * @author Musaib_2
 */
public class test {

   public static void main(String args[]) throws Exception{
       
       Properties prop = new Properties();
       FileReader reader = new FileReader("src\\Backuplocation.properties");
       prop.load(reader);
       
       String test = prop.getProperty("backupdirectory");
       
       System.out.println("The value from the properties is "+test);
       
   }
}
