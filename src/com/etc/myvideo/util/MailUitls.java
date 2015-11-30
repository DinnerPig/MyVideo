﻿package com.etc.myvideo.util;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class MailUitls {
     
    public static final String HOST = "smtp.163.com";//必须改变你的邮箱的什么了 （百度查）
    public static final String PROTOCOL = "smtp";   
    public static final int PORT = 25;
    public static final String FROM = " ";//你的邮箱账号
    public static final String PWD = "";
   //你的邮箱密码   
    /**
     * 鑾峰彇Session
     * @return
     */
    private static Session getSession() {
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST);
        props.put("mail.store.protocol" , PROTOCOL);
        props.put("mail.smtp.port", PORT);
        props.put("mail.smtp.auth" , true);
         
        Authenticator authenticator = new Authenticator() {
 
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PWD);
            }
             
        };
        Session session = Session.getDefaultInstance(props , authenticator);
         
        return session;
    }
     
    public static void sendMail(String toEmail ,String code) {
    	System.out.println(toEmail+"--------------------"+code);
        Session session = getSession();

        try {
           
            // Instantiate a message
            Message msg = new MimeMessage(session);
  
            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("影城注册");
            msg.setSentDate(new Date());
            msg.setContent("<h1>欢迎收看我的电影</h1><h3><a href='http://localhost:8080/MyVideo/user_active.action?code="+code+"'>http://localhost:8080/MyVideo/user_active.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
  
            //Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
    
    /**
     * 执行密码找回哦
     * @param toEmail
     * @param code
     */
    public static void sendMainForByPass(String toEmail ,String code) {
        Session session = getSession();

        try {
           
            // Instantiate a message
            Message msg = new MimeMessage(session);
  
            //Set message attributes
            msg.setFrom(new InternetAddress(FROM));
            InternetAddress[] address = {new InternetAddress(toEmail)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject("影城密码找回");
            msg.setSentDate(new Date());
            msg.setContent("<h1>请点击该链接继续找回你的密码</h1><h3><a href='http://localhost:8080/MyVideo/user_findpassactive.action?code="+code+"'>http://localhost:8080/MyVideo/user_findpassactive.action?code="+code+"</a></h3>", "text/html;charset=UTF-8");
  
            //Send the message
            Transport.send(msg);
        }
        catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
    public static void main(String[] args) {
    	MailUitls.sendMail("942158740@qq.com", "2434342543645");
		
	}
 
}
		