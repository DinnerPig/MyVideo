package com.etc.myvideo.util;

import java.beans.PropertyDescriptor;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;




public class StringUtil {
	
	// 数字正则
	private static final Pattern RE_NUMBER = Pattern.compile("[0-9]+");
	// 字符正则
	private static final Pattern RE_CHARACTER = Pattern.compile("\\w+");
	
	// 千分位显�?
	private static final Pattern Html_TAG = Pattern.compile("<style.*?</style>|<script.*?</script>|<([^>]*)>");
	private static final DecimalFormat THOUSANDS_TAG = new DecimalFormat("#,###");
     /**
      * 将字符串和字符进行连接生成字符串
      * @param strs
      * @param s
      * @return
      */
	public static String join(String[] strs, String s) {
		
		if (null == strs)
			return "";
		
		StringBuilder sb = new StringBuilder();

		for (int i = 0; i < strs.length; i++) {
			sb.append(strs[i]);
			if (i != strs.length - 1)
				sb.append(s);
		}

		return sb.toString();
	}
	/**
	 *根据字符进行分解字符串，将分解的数据放入字符串中
	 * @param str
	 * @param separatorChar
	 * @return
	 */
	public static String[] split(String str, char separatorChar) {

		return StringUtils.split(str, separatorChar);

	}
	/**
	 * 按规定的字符进行分解，分解后放入list里面
	 * @param str
	 * @param separatorChar
	 * @return
	 */
	public static List<String> splitToList(String str, char separatorChar) {//
		if (StringUtil.isBlank(str)) {
			return null;
		}
		List<String> list = new ArrayList<String>();
		for (String s : StringUtil.split(str, separatorChar)) {
			list.add(s);
		}
		return list;
	}
	/**
	 * 判断是否为空
	 * @param str
	 * @return
	 */
	public static boolean isBlank(String str) {
		if (null == str)
			return true;
		if ("".equals(str.replaceAll(" "," ").trim()))
			return true;
		return false;
	}
	/**
	 * 生成随机�?
	 * @param j
	 * @return
	 */
	public static String toRandom(int j) {

		StringBuilder s = new StringBuilder();

		for (int i = 0; i < j; i++) {
			Random r = new Random();
			int n = r.nextInt(3);
			if (n == 0) {
				s.append(r.nextInt(9));
			} else if (n == 1) {
				s.append((char) ('a' + Math.random() * 26));
			} else {
				s.append((char) ('A' + Math.random() * 26));
			}
		}

		return s.toString();
	}
	/**
	 * 创建随机数的字符内容
	 */
	private static char[] numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
            "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();
	/**
	 * 生成多少位的随机�?
	 * @param length
	 * @return
	 */
	public static String randomString(int length) {
        if (length < 1) {
            return null;
        }
        // Create a char buffer to put random letters and numbers in.
        char[] randBuffer = new char[length];
        for (int i = 0; i < randBuffer.length; i++) {
            randBuffer[i] = numbersAndLetters[new Random().nextInt(71)];
        }
        return new String(randBuffer);
    }
	/**
	 * 是否是邮箱地�?
	 * @param mailAddr
	 * @return
	 */
	public static boolean isMailAddr(String mailAddr) {

		String check = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
		Pattern regex = Pattern.compile(check);
		Matcher matcher = regex.matcher(mailAddr);
		return matcher.matches();
	}
	/**
	 * 生成是否是数�?
	 * @param str
	 * @return
	 */
	public static boolean isNumber(String str) {
		return (str != null) && RE_NUMBER.matcher(str).matches();
	}
	/**
	 * 将list转化生字符串
	 * @param list
	 * @param separatorChar
	 * @return
	 */
	public static String getListToString(List<String> list, char separatorChar) {
		if (null != list && list.size() > 0) {
			StringBuilder sb = new StringBuilder();
			
			for (int i = 0; i < list.size(); i++) {
				sb.append(list.get(i));
				if (i != list.size() -1) {
					sb.append(separatorChar);
				}
			}
			return sb.toString();
		}
		return null;
	}
	
	/**
	 * 取出html里所有标签和<scritp><style>内容
	 * 
	 * @param html		html内容
	 * @param replace	替换内容
	 * @return
	 */
	public static String getHtmlToText(String html, String replace) {
		Matcher m = Html_TAG.matcher(html);
		return m.replaceAll(replace);
	}
	
	/**
	 * 判断是否只字�?
	 * 
	 * @param s
	 * @return	
	 */
	public static boolean regularCharacter(String s) {
		return RE_CHARACTER.matcher(s).matches();
	}
	
	/**
	 * 解析bean对象属�?
	 * 
	 * @param p
	 * @return
	 */
	public static String getDisplayName(PropertyDescriptor p) {
		if (null != p && null != p.getReadMethod()) {
			if (p.getPropertyType() == boolean.class) {
				return p.getReadMethod().getName().substring(2);
			}
			return p.getReadMethod().getName().substring(3);
		}
		return "";
	}
	
	/**
	 * 获取千分�?
	 * 
	 * @param s
	 * @return	##,###.00
	 */
	public static String getThousands(String s) {
		try {
			return THOUSANDS_TAG.format(Double.valueOf(s));
		} catch (Exception e) {
			return "";
		}
	}
	
	public static void main(String[] args) {
		//System.out.println(StringUtil.getThousands("2500000.000"));
		System.out.println(StringUtil.randomString(3));
		System.out.println(StringUtil.toRandom(3));
	}
}
