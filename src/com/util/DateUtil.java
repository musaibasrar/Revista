/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Mayur
 */
public class DateUtil {

    static SimpleDateFormat simpleDateFormat;
    static Date returnDate;

    /**
     *
     * @param source String Object
     * @return Date Object
     */
    public static Date dateParser1(String source) {
        simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy kk:mm");
        try {
            returnDate = simpleDateFormat.parse(source);

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source String Object
     * @return
     */
    public static Date dateParser(String source) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        try {
            returnDate = simpleDateFormat.parse(source);

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source
     * @return
     */
    public static Date simpleDateParser(String source) {
        //simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
        DateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
        try {
            returnDate = formatter.parse(source);
            System.out.println("the date in the dateutil is "+returnDate);

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source
     * @return
     */
    public static Date yesterdayDateParser(String source) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();

        try {
            returnDate = simpleDateFormat.parse(source);
            calender.setTime(returnDate);
            calender.add(Calendar.HOUR_OF_DAY, -24);
            returnDate = calender.getTime();

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source
     * @return
     */
    public static Date yesterdayDateParser1(String source) {
        simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy kk:mm");
        Calendar calender = Calendar.getInstance();

        try {
            returnDate = simpleDateFormat.parse(source);
            calender.setTime(returnDate);
            calender.add(Calendar.HOUR_OF_DAY, -24);
            returnDate = calender.getTime();

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source
     * @return
     */
    public static Date tomorrowsDateParser(String source) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();

        try {
            returnDate = simpleDateFormat.parse(source);
            calender.setTime(returnDate);
            calender.add(Calendar.HOUR_OF_DAY, 24);
            returnDate = calender.getTime();

        } catch (ParseException ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @param source
     * @return
     */
    public static Date tomorrowsDate(Date source) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();

        try {
            calender.setTime(source);
            calender.add(Calendar.HOUR_OF_DAY, 24);
            returnDate = calender.getTime();

        } catch (Exception ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }

    /**
     *
     * @return
     */
    public static Date todaysDate() {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();
        calender.set(Calendar.HOUR_OF_DAY, 0);
        calender.set(Calendar.MINUTE, 0);
        calender.set(Calendar.SECOND, 0);
        returnDate = calender.getTime();
        return returnDate;
    }

    /**
     *
     * @return
     */
    public static Date todaysDateTime() {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();
        returnDate = calender.getTime();
        return returnDate;
    }

    /**
     *
     * @param hour
     * @param min
     * @return
     */
    public static Date todaysDateTime(int hour, int min) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");

        Calendar calender = Calendar.getInstance();
        calender.set(Calendar.MINUTE, min);
        calender.set(Calendar.HOUR_OF_DAY, hour);
        returnDate = calender.getTime();
        return returnDate;
    }

    /**
     *
     * @param src
     * @return
     */
    public static String format(Date src) {
        simpleDateFormat = new SimpleDateFormat("hh:mm a");
        return simpleDateFormat.format(src);
    }

    /**
     *
     * @param source
     * @param months
     * @return
     */
    public static Date forwardMonths(Date source, int months) {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
        Calendar calender = Calendar.getInstance();
        try {
            calender.setTime(source);
            calender.add(Calendar.MONTH, months);
            returnDate = calender.getTime();

        } catch (Exception ex) {
            ex.printStackTrace();
            returnDate = null;
        } finally {
            return returnDate;
        }

    }
}
