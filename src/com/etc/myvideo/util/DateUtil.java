package com.etc.myvideo.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 
 * @author {linzhengtong}
 * 2015骞�0鏈�3鏃�
 * class:鏃ユ湡宸ュ叿
 * method:
 */
public class DateUtil {
	
	private static final Log LOG = LogFactory.getLog(DateUtil.class);

	private static final SimpleDateFormat DF_YMD = new SimpleDateFormat(
			"yyyyMMdd");

	private static final SimpleDateFormat DF_YMDHMS2 = new SimpleDateFormat(
			"yyyyMMddHHmmss");

	private static final SimpleDateFormat DF_YMD2 = new SimpleDateFormat(
			"yyyy-MM-dd");

	private static final SimpleDateFormat DF_YMDHMS = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	// 11/23/2012 2:34:11 PM
	private static final SimpleDateFormat DF_MDYHMS = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a", Locale.US);
	
	
	private static final SimpleDateFormat DF_MDHM = new SimpleDateFormat("MM/dd HH:mm");
	
	private static final SimpleDateFormat DF_YMDTHMS = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

	/**
	 * 鍒ゆ柇鏄惁鏄綋澶�
	 * 
	 * @param date
	 * @return <p>
	 *         true: 鏄綋澶�
	 *         </p>
	 *         <p>
	 *         false: 涓嶆槸褰撳ぉ
	 *         </p>
	 */
	public static boolean compareCurrDay(Date date) {
		if (null == date) {
			return false;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		Calendar curr = Calendar.getInstance();
		if (cal.get(Calendar.YEAR) == curr.get(Calendar.YEAR)
				&& cal.get(Calendar.MONTH) == curr.get(Calendar.MONTH)
				&& cal.get(Calendar.DAY_OF_MONTH) == curr
						.get(Calendar.DAY_OF_MONTH)) {
			return true;
		}
		return false;
	}

	/**
	 * 鑾峰緱褰撳墠鏃堕棿
	 * 
	 * @return yyyyMMdd
	 */
	public static String getDisplayYMD() {
		try {
			Calendar calendar = Calendar.getInstance();
			return ((SimpleDateFormat) DF_YMD.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 鑾峰緱date鏃堕棿
	 * 
	 * @param date
	 * @return yyyyMMdd
	 */
	public static String getDisplayYMD(Date date) {
		try {
			if (null == date) {
				return null;
			}
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			return ((SimpleDateFormat) DF_YMD.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 鑾峰緱date鏃堕棿
	 * 
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String getDisplayYMDHMS(Date date) {
		try {
			if (null == date) {
				return null;
			}
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			return ((SimpleDateFormat) DF_YMDHMS.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	 * 鑾峰緱date鏃堕棿
	 * 
	 * @param date
	 * @return	MM/dd HH:ss
	 */
	public static String getMDHM(Date date) {
		try {
			if (null == date) {
				return "";
			}
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			return ((SimpleDateFormat) DF_MDHM.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return "";
		}
	}


	/**
	 * 鑾峰緱褰撳墠鏃堕棿
	 * 
	 * @return yyyy-MM-dd
	 */
	public static String getDisplayYMD2() {
		try {
			Calendar calendar = Calendar.getInstance();
			return ((SimpleDateFormat) DF_YMD2.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 鑾峰緱date鏃堕棿
	 * 
	 * @param date
	 * @return yyyy-MM-dd
	 */
	public static String getDisplayYMD2(Date date) {
		try {
			if (null == date) {
				return null;
			}
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);
			return ((SimpleDateFormat) DF_YMD2.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 鑾峰緱褰撳墠date鏃堕棿
	 * 
	 * @return yyyyMMddHHmmss
	 */
	public static String getDisplayYMDHHMMSS() {
		try {
			Calendar calendar = Calendar.getInstance();
			return ((SimpleDateFormat) DF_YMDHMS2.clone()).format(calendar
					.getTime());
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 姣旇緝鏃堕棿
	 * 
	 * @param date
	 *            姣旇緝鐨勬椂闂寸偣
	 * @param field
	 *            鏃ュ巻
	 * @param amount
	 *            鏃堕棿閲�
	 * @return
	 */
	public static boolean compareTime(Date date, int field, int amount) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.add(field, amount);

			Calendar c = Calendar.getInstance();
			c.setTime(date);

			return cal.before(c);
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 鍙栧緱鏃ユ湡
	 * 
	 * @param date
	 *            yyyy-MM-dd
	 * @return
	 */
	public static Date getDate(String date) {
		try {
			return ((SimpleDateFormat) DF_YMD2.clone()).parse(date);
		} catch (ParseException e) {
			return null;
		}
	}
	
	/**
	 * 鍙栧緱鏃ユ湡
	 * 
	 * @param date
	 *            MM/dd/yyyy hh:mm:ss AM
	 * @return
	 */
	public static Date getDateByMDYHMS(String date) {
		try {
			return ((SimpleDateFormat) DF_MDYHMS.clone()).parse(date);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 鍙栧緱鏃ユ湡
	 * 
	 * @param date
	 *            yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static Date getDate2(String date) {
		try {
			return ((SimpleDateFormat) DF_YMDHMS.clone()).parse(date);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 鍙栧緱鏃ユ湡
	 * 
	 * @param date
	 *            2012-03-29T11:25:11+08:00
	 * @return
	 */
	public static Date getDateTime(String date) {
		try {
			if (StringUtil.isBlank(date))
				return null;

			return ((SimpleDateFormat) DF_YMDTHMS.clone()).parse(date);
		} catch (Exception e) {
			return null;
		}
	}
	
	
	/**
	 * 鏃堕棿闂撮殧
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static String getCompareTime(Date d1, Date d2) {
		try {
			SimpleDateFormat DF = new SimpleDateFormat("Z");
			Calendar calendar = Calendar.getInstance();
			String zone = ((SimpleDateFormat) DF.clone()).format(calendar
					.getTime());
			//LOG.info("褰撳墠鏃跺尯锛� + zone);
			
			if (!StringUtil.isBlank(zone) && zone.length() >= 5) {
				Integer z = Integer.valueOf(zone.substring(1));
				if (zone.indexOf("-") != -1) {
					z += 800;
				} else {
					z = 800 - z;
				}
				int t1 = z/100;
				int t2 = z%100;
				calendar.add(Calendar.HOUR_OF_DAY, t1);
				calendar.add(Calendar.MINUTE, t2);
				
			}
			
			//LOG.info("涓浗鏃堕棿锛� + DF_MDYHMS.format(calendar.getTime()));
			
			long currTime = calendar.getTimeInMillis(); 
			long time = currTime - d1.getTime();
			
			
			long day = time/(1000*60*60*24);
			if (day > 0) {
				long year = day/365;
				if (year > 0) {
					return  year + "y";
				}
				
				long month = day/30;
				if (month > 0) {
					return month + "M";
				}
				
				return day + "d";				
			}
			
			long hour = time/(1000*60*60);
			if (hour > 0) {
				return hour + "h";
			}
			return time/(1000*60) + "m";
			
		} catch (Exception e) {
			return "";
		}
	}
	
	public static void main(String[] args) {
		//System.out.println(DateUtil.getDisplayYMDHMS(DateUtil.getDateByMDYHMS("11/23/2012 2:34:11 PM")));
		
		
		
		/*try {
			SimpleDateFormat DF = new SimpleDateFormat("Z");
			Calendar calendar = Calendar.getInstance();
			calendar.set(2013, 2, 20, 22, 30, 13);
			String zone = "-0430";
			
			if (!StringUtil.isBlank(zone) && zone.length() >= 5) {
				Integer z = Integer.valueOf(zone);
				z = 800 - z;
				int t1 = z/100;
				int t2 = z%100;
				calendar.add(Calendar.HOUR_OF_DAY, t1);
				calendar.add(Calendar.MINUTE, t2);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
