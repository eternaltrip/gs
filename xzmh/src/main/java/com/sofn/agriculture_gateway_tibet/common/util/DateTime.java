package com.sofn.agriculture_gateway_tibet.common.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期、时间转换处理工�?
 * <pre>
 * 本类提供时间日期、处理转化处理的静�?�方法，主要方法有：
 * 1、转化时间成指定格式的字符串 convertDateTime()
 * 2、将指定格式的字符串日期时间转化为Date类型的日期时�? parseDateTime()
 * 3、日�? �? 年，月，天，时，分，�? �? addDateTime()
 *
 * 4、获取当前时间，格式：yyyy-MM-dd getCurrentDate_YYYYMMDD()
 * 5、获取当前时间，格式：yyyy-MM-dd HH:mm getCurrentDate_YYYYMMDDHHMM()
 * 6、获取当前时间，格式：yyyy-MM-dd HH:mm:ss getCurrentDate_YYYYMMDDHHMMSS()
 * 7、获取当前时间，格式：yyyyMMddHHmmss getCurrentDate_YYYYMMDDHHMMSS_EX () 
 * 8、获取当前时间，格式：yyyy年MM月dd�? getCurrentDate_YYYYMMDD_CN()
 * 9、获取当前时间，格式：yyyy年MM月dd日HH时mm�? getCurrentDate_YYYYMMDDHHMM_CN()
 * 10、获取当前时间，格式：yyyy年MM月dd日HH时mm分ss�? getCurrentDate_YYYYMMDDHHMMSS_CN()
 *
 * 11、转换时间，格式：yyyy-MM-dd convertDateTime_YYYYMMDD()
 * 12、转换时间，格式：yyyy-MM-dd HH:mm convertDateTime_YYYYMMDDHHMM()
 * 13、转换时间，格式：yyyy-MM-dd HH:mm:ss convertDateTime_YYYYMMDDHHMMSS()
 * 14、转换时间，格式：dd日HH:mm convertDateTime_DDHHMM()
 * 15、转换时间，格式：HH:mm:ss convertDateTime_HHMMSS()
 * 16、转换时间，格式：HH:mm convertDateTime_HHMM()
 * 17、转换时间，格式：yyyy年MM月dd�? convertDateTime_YYYYMMDD_CN()
 * 18、转换时间，格式：yyyy年MM月dd日HH时mm�? convertDateTime_YYYYMMDDHHMM_CN()
 * 19、转换时间，格式：yyyy年MM月dd日HH时mm分ss�? convertDateTime_YYYYMMDDHHMMSS_CN()
 *
 * 20、解析时间，格式：yyyy-MM-dd parseDateTime_YYYYMMDD()
 * 21、解析时间，格式：yyyy-MM-dd HH:mm parseDateTime_YYYYMMDDHHMM()
 * 22、解析时间，格式：yyyy-MM-dd HH:mm:ss parseDateTime_YYYYMMDDHHMMSS()
 * 23、解析时间，格式：yyyy年MM月dd parseDateTime_YYYYMMDD_CN()
 * 24、解析时间，格式：yyyy年MM月dd日HH时mm�? parseDateTime_YYYYMMDDHHMM_CN()
 * 25、解析时间，格式：yyyy年MM月dd日HH时mm分ss�? parseDateTime_YYYYMMDDHHMMSS_CN()
 * 
 * 26、日�? �? �? �? addYears()
 * 27、日�? �? �? �? addMonths()
 * 28、日�? �? �? �? addDays()
 * 29、日�? �? 小时 �? addHours()
 * 30、日�? �? �? �? addMinutes()
 * 31、日�? �? �? �? addSeconds()
 * 32、生�? MS SQL SERVER 的日期字段的日期�? nowForMSSQLDateField()
 * 33、取星期�? getWeekByDate()
 * 34、获取两�? Date 相差�? 天数 getDays()
 * 35、获取两�? Date 相差�? 分钟�? getMinutes()
 * 36、获取两�? Date 相差�? 分钟�? getMinutes_No_abs()
 * 37、生成日期列�? listDays()
 * </pre>
 * @modify frameWork 
 */
public class DateTime {
	
	/**
	 * 转化时间成指定格式的字符�?
	 * @param currentDate 待转化给定日期时�?
	 * @param datetimeFormat 为日期�?�时间指定的格式
	 * @return 按指定格式转后的日期、时间字符串
	 * @author frameWork
	 */
	public static synchronized String convertDateTime(Date currentDate, String datetimeFormat) {
		if (currentDate == null || "".equals(currentDate)) {
			return "";
		}
		else if (datetimeFormat == null || "".equals(datetimeFormat)) {
			return "";
		}
		else {
			try {
				SimpleDateFormat formatter = new SimpleDateFormat(datetimeFormat);
				return formatter.format(currentDate);
			} catch (Exception e) {
				return "";
			}
		}
	}
	
	/**
	 * 将指定格式的字符串日期时间转化为Date类型的日期时�?
	 * @param datetimeStr 指定格式的日期日期字符串
	 * @param datetimeFormat 为日期�?�时间指定的格式
	 * @return 转换成的Date类型的日期时�?
	 * @author frameWork
	 */
	public static synchronized Date parseDateTime(String datetimeStr, String datetimeFormat) {  
		Date parsedDate = null;  
		if (datetimeStr == null || "".equals(datetimeStr)) {
			return parsedDate;
		}
		if (datetimeFormat == null || "".equals(datetimeFormat)) {
			return parsedDate;
		}
		try {
			SimpleDateFormat formatter = new SimpleDateFormat(datetimeFormat);  
			parsedDate = (Date)formatter.parse(datetimeStr);  
		}
		catch  (Exception  e)  {  
		}  
		return  parsedDate;  
	}  	
	
    /**
     * 日期 �? 年，月，天，时，分，�? �?
     * @param currentDate 当前时间
     * @param AddType 添加类型  年，月，天，时，分，�?
     * @param dateTimeCount 数量
     * @return 加后的日�?
     * @author frameWork
     */
    public static synchronized Date addDateTime(Date currentDate, int AddType, int dateTimeCount) {
    	Date addedDate = currentDate;
    	if (currentDate != null && dateTimeCount != 0) {
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(currentDate);    			
			calendar.add(AddType, dateTimeCount);
			addedDate = calendar.getTime();
    	}
    	return addedDate;
    }

	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 获取当前时间
	 * 格式：yyyy-MM-dd
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDD() {
		return convertDateTime(new Date(), "yyyy-MM-dd");
	}

	/**
	 * 获取当前时间
	 * 格式：yyyy-MM-dd HH:mm
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMM() {
		return convertDateTime(new Date(), "yyyy-MM-dd HH:mm");
	}
	
	/**
	 * 获取当前时间
	 * 格式：yyyy-MM-dd HH:mm:ss
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMMSS() {
		return convertDateTime(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 获取当前时间
	 * 格式：yyyy-MM-dd HH:mm:ss:SS 包含毫秒
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMMSS_millisecond() {
		return convertDateTime(new Date(), "yyyy-MM-dd HH:mm:ss:SS");
	}

	/**
	 * 获取当前时间
	 * 格式：HH:mm:ss
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_HHMMSS() {
		return convertDateTime(new Date(), "HH:mm:ss");
	}
	
	/**
	 * 获取当前时间
	 * 格式：yyyyMMddHHmmss
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMMSSWithOutSeparator() {
		return convertDateTime(new Date(), "yyyyMMddHHmmss");
	}
    /////////////////////////////////////////////////////////////////////////////////////

	
	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 获取当前时间
	 * 格式：yyyy年MM月dd�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDD_CN() {
		return convertDateTime(new Date(), "yyyy年MM月dd�?");
	}

	/**
	 * 获取当前时间
	 * 格式：yyyy年MM月dd日HH时mm�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMM_CN() {
		return convertDateTime(new Date(), "yyyy年MM月dd日HH时mm�?");
	}
	
	/**
	 * 获取当前时间
	 * 格式：yyyy年MM月dd日HH时mm分ss�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String getCurrentDate_YYYYMMDDHHMMSS_CN() {
		return convertDateTime(new Date(), "yyyy年MM月dd日HH时mm分ss�?");
	}
	/////////////////////////////////////////////////////////////////////////////////////
   
	
	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 转换时间
	 * 格式：yyyy-MM-dd
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDD(Date currentDate) {
		return convertDateTime(currentDate, "yyyy-MM-dd");
	}
	
	/**
	 * 转换时间
	 * 格式：yyyy-MM-dd HH:mm
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDDHHMM(Date currentDate) {
		return convertDateTime(currentDate, "yyyy-MM-dd HH:mm");
	}
	
	
	/**
	 * 转换时间
	 * 格式：yyyy-MM-dd HH:mm:ss
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDDHHMMSS(Date currentDate) {
		return convertDateTime(currentDate, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 转换时间
	 * 格式：yyyy-MM-dd HH:mm:ss:SS
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDDHHMMSS_SS(Date currentDate) {
		return convertDateTime(currentDate, "yyyy-MM-dd HH:mm:ss:SS");
	}
	
	/**
	 * 转换时间
	 * 格式：dd日HH:mm
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_DDHHMM(Date currentDate) {
		return convertDateTime(currentDate, "dd日HH:mm");
	}

	/**
	 * 转换时间
	 * 格式：HH:mm:ss
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_HHMMSS(Date currentDate) {
		return convertDateTime(currentDate, "HH:mm:ss");
	}

	/**
	 * 转换时间
	 * 格式：HH:mm
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_HHMM(Date currentDate) {
		return convertDateTime(currentDate, "HH:mm");
	}
	/////////////////////////////////////////////////////////////////////////////////////

	
	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 转换时间
	 * 格式：yyyy年MM月dd�?
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDD_CN(Date currentDate) {
		return convertDateTime(currentDate, "yyyy年MM月dd�?");
	}
	
	/**
	 * 转换时间
	 * 格式：yyyy年MM月dd�?
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMM_CN(Date currentDate) {
		return convertDateTime(currentDate, "yyyy年MM�?");
	}
	
	
	/**
	 * 转换时间
	 * 格式：yyyy年MM月dd日HH时mm�?
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDDHHMM_CN(Date currentDate) {
		return convertDateTime(currentDate, "yyyy年MM月dd日HH时mm�?");
	}
	
	
	/**
	 * 转换时间
	 * 格式：yyyy年MM月dd日HH时mm分ss�?
	 * @param currentDate 等转换日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static String convertDateTime_YYYYMMDDHHMMSS_CN(Date currentDate) {
		return convertDateTime(currentDate, "yyyy年MM月dd日HH时mm分ss�?");
	}
	/////////////////////////////////////////////////////////////////////////////////////
	
	
	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 解析时间
	 * 格式：yyyy-MM-dd
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDD(String currentDate) {
		return parseDateTime(currentDate, "yyyy-MM-dd");
	}
	
	/**
	 * 解析时间
	 * 格式：yyyy-MM-dd HH:mm
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDDHHMM(String currentDate) {
		return parseDateTime(currentDate, "yyyy-MM-dd HH:mm");
	}
	
	
	/**
	 * 解析时间
	 * 格式：yyyy-MM-dd HH:mm:ss
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDDHHMMSS(String currentDate) {
		return parseDateTime(currentDate, "yyyy-MM-dd HH:mm:ss");
	}
	/////////////////////////////////////////////////////////////////////////////////////
	

	/////////////////////////////////////////////////////////////////////////////////////
	/**
	 * 解析时间
	 * 格式：yyyy年MM月dd
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDD_CN(String currentDate) {
		return parseDateTime(currentDate, "yyyy年MM月dd");
	}
	
	/**
	 * 解析时间
	 * 格式：yyyy年MM月dd日HH时mm�?
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDDHHMM_CN(String currentDate) {
		return parseDateTime(currentDate, "yyyy年MM月dd日HH时mm�?");
	}
	
	
	/**
	 * 解析时间
	 * 格式：yyyy年MM月dd日HH时mm分ss�?
	 * @param currentDate 等解析日�?
	 * @return 当前时间的字符串形式
	 * @author frameWork
	 */
	public static Date parseDateTime_YYYYMMDDHHMMSS_CN(String currentDate) {
		return parseDateTime(currentDate, "yyyy年MM月dd日HH时mm分ss�?");
	}
	/////////////////////////////////////////////////////////////////////////////////////
	
	
	/////////////////////////////////////////////////////////////////////////////////////
    /**
     * 日期 �? �? �?
     * @param currentDate 当前时间
     * @param years 年数�?
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addYears(Date currentDate, int years) {
    	return addDateTime(currentDate, Calendar.YEAR, years);
    }
    
    /**
     * 日期 �? �? �?
     * @param currentDate 当前时间
     * @param months 月数�?
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addMonths(Date currentDate, int months) {
    	return addDateTime(currentDate, Calendar.MONTH, months);
    }

    
    /**
     * 日期 �? �? �?
     * @param currentDate 当前时间
     * @param days 日数�?
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addDays(Date currentDate, int days) {
    	return addDateTime(currentDate, Calendar.DATE, days);
    }

    /**
     * 日期 �? 小时 �?
     * @param currentDate 当前时间
     * @param hours 小时数量
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addHours(Date currentDate, int hours) {
    	return addDateTime(currentDate, Calendar.HOUR, hours);
    }

    /**
     * 日期 �? �? �?
     * @param currentDate 当前时间
     * @param minutes 分钟数量
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addMinutes(Date currentDate, int minutes) {
    	return addDateTime(currentDate, Calendar.MINUTE, minutes);
    }

    /**
     * 日期 �? �? �?
     * @param currentDate 当前时间
     * @param seconds 秒数�?
     * @return 加后的日�?
     * @author frameWork
     */
    public static Date addSeconds(Date currentDate, int seconds) {
    	return addDateTime(currentDate, Calendar.SECOND, seconds);
    }
	/////////////////////////////////////////////////////////////////////////////////////
	
	/////////////////////////////////////////////////////////////////////////////////////
    /**
     * 生成 MS SQL SERVER 的日期字段的日期�?
     * @author frameWork
     */
    public static Date nowForMSSQLDateField() {
    	return new Date();
    }
	/////////////////////////////////////////////////////////////////////////////////////
    
   
	/////////////////////////////////////////////////////////////////////////////////////
   /**
    * �? 星期�?
    * @param currentDate 当前日期
    * @return 星期�?
    * @author frameWork
    */
   public static synchronized String getWeekByDate(Date currentDate) {
       String week = "";
	   if (currentDate != null) {
		   Calendar calendar = Calendar.getInstance();
		   calendar.setTime(currentDate);
		   week = getWeek(calendar, true);
	   }
	   return week;
   }
   
   /**
    * �? 星期�? ，具体取�?
    * @param currentDate 当前日期
    * @param toChinese 是否输出中文
    * @return 星期�?
    * @author frameWork
    */
    @SuppressWarnings("static-access")
    private static synchronized String getWeek(Calendar calendar, boolean toChinese) {
       String strRet = "";   
       int intWeek = 0;
       
       /**
        * 获取本周的第几天
        */
       intWeek = calendar.get(calendar.DAY_OF_WEEK) - 1;   
       if (!toChinese) {   
          return (String.valueOf(intWeek));   
       }   
       switch (intWeek) {
       		case 1: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 2: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 3: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 4: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 5: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 6: {
       			strRet = "星期�?";
       			break;   
       		}
       		case 0: {
       			strRet = "星期�?";   
       			break;   
       		}
       		default: {
       			strRet = "不详";   
           		break;   
       		}
       }   
       return  strRet;
	}     
   
    /**
     * 获取两个 Date 相差�? 天数
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 天数
     * @author frameWork
     */
    public static long getDays(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
        	return (Math.abs(dateEnd.getTime() - dateBeg.getTime()) / 24 / 3600 / 1000 );
    	}
    	else {
    		return 0;
    	}
    }
    
    /**
     * 获取两个 Date 相差�? 小时�?
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 天数
     * @author frameWork
     */
    public static long getHours(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
    		return (Math.abs(dateEnd.getTime() - dateBeg.getTime()) / 3600 / 1000 );
    	}
    	else {
    		return 0;
    	}
    }
    /**
     * 获取两个 Date 相差�? 小时数（可能为负�?
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 天数
     * @author frameWork
     */
    public static long getHours_No_abs(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
    		return ((dateEnd.getTime() - dateBeg.getTime()) / 3600 / 1000 );
    	}
    	else {
    		return 0;
    	}
    }

    /**
     * 获取两个 Date 相差�? 分钟�?
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 分钟�?
     * @author frameWork
     */
    public static long getMinutes(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
        	return (Math.abs(dateEnd.getTime() - dateBeg.getTime()) / 60 / 1000 );
    	}
    	else {
    		return 0;
    	}
    }

    /**
     * 获取两个 Date 相差�? 秒数
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 秒数
     * @author frameWork
     */
    public static long getSecond(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
        	return (Math.abs(dateEnd.getTime() - dateBeg.getTime()) / 1000 );
    	}
    	else {
    		return 0;
    	}
    }
    
    /**
     * 获取两个 Date 相差�? 毫秒�?
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 毫秒�?
     * @author frameWork
     */
    public static long getMilliSecond(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
    	    return Math.abs(dateEnd.getTime() - dateBeg.getTime());
    	}else {
    	    return 0;
    	}
    }
    
    /**
     * 毫秒转日�?
     * @param msec 毫秒
     * @return
     * @author jh
     */
    public static String getDateTime_MilliSecond(long msec) {
	DateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss�?");
	
	Calendar calendar = Calendar.getInstance();
	calendar.setTimeInMillis(msec);
	
	return formatter.format(calendar.getTime());
    }


    /**
     * 获取两个 Date 相差�? 分钟�?
     * @param dateBeg �?始日�?
     * @param dateEnd 结束日期
     * @return 两个 Date 相差�? 分钟�?
     * @author frameWork
     */
    public static long getMinutes_No_abs(Date dateBeg, Date dateEnd) {
    	if (dateEnd != null && dateEnd != null) {
        	return ((dateEnd.getTime() - dateBeg.getTime()) / 60 / 1000 );
    	}
    	else {
    		return 0;
    	}
    }
    
    /**
     * 生成日期列表
     * @param dateBeg �? 日期
     * @param dateEnd �? 日期
     * @return 日期列表
     * @author Ze Chen
     */
    public static synchronized ArrayList<String> listDays(Date dateBeg, Date dateEnd) {
    	ArrayList<String> listday = new ArrayList<String>();
    	//如果�?始时间比结束时间小，才继续，否则不予操作
    	if (dateBeg != null && dateEnd != null&&dateBeg.before(dateEnd)) {
        	long days = getDays(dateBeg, dateEnd);
        	if (days > 0) {
        		String dateBegStr = convertDateTime_YYYYMMDD(dateBeg);
//        		if (dateBeg.before(dateEnd)) {
//        		else {
//            		dateBegStr = convertDateTime_YYYYMMDD(dateEnd);
//        		}
        		for (int i = 0 ; i < days ; i ++ ) {
        			Date date = addDays(parseDateTime_YYYYMMDD(dateBegStr + " 00:00:00"), i);
        			String dateBegNextDayStr = convertDateTime_YYYYMMDD(date);
    				if (!listday.contains(dateBegNextDayStr)) {
    					listday.add(dateBegNextDayStr);
    				}
    			}   
    		}
    	}
    	return listday;
    }
    

    /**
     * 获取当前日期的第二天
     * @param day
     * @return
     * 创建日期:Apr 2, 2010-9:36:07 AM
     * @author jh
     */
    public static String getTomorrow_YYYYMMDD(String day){
	Date date=DateTime.parseDateTime_YYYYMMDD(day);
	Date tomorrowDate=DateTime.addDays(date, 1);
	
	return convertDateTime_YYYYMMDD(tomorrowDate);
    }
    //返回公历y年m+1月的天数
    public static int solarDays(String year,String month){
  	  int[] solarMonth=new int[]{31,28,31,30,31,30,31,31,30,31,30,31};
  	  int y = Integer.parseInt(year);
  	  int m = Integer.parseInt(month);
       if(m==2)
          return(((y%4==0)&&(y%100!=0)||(y%400==0))?29:28);
       else
          return(solarMonth[m-1]);
    }
}