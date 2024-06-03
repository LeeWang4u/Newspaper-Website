//package com.ptit.Service.impl;
//
//import javax.mail.*;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//import java.io.UnsupportedEncodingException;
//import java.util.Date;
//import java.util.Properties;
//import javax.mail.internet.MimeMessage;
//
//import com.ptit.Service.MailerService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
//import org.springframework.mail.javamail.MimeMessageHelper;
//
//import org.springframework.stereotype.Service;
//
//@Service
//public class MailerServiceImpl implements MailerService {
//
//    @Autowired
//    JavaMailSender mailer;
//
//    @Override
//    public void send(String from,String to, String subject,String body)
//    {
//        try {
//            //Tao mail
//
//            MimeMessage mail = mailer.createMimeMessage();
//            //su dung lop tro giup
//            MimeMessageHelper helper
//                    = new MimeMessageHelper(mail,true,"utf-8");
//            helper.setFrom(from, from);
//            helper.setTo(to);
//            helper.setReplyTo(from, from);
//            helper.setSubject(subject);
//            helper.setText(body, true);
//
//            // gui mail
//            mailer.send(mail);
//        }
//        catch(Exception ex)
//        {
//            System.out.println(ex);
//            throw new RuntimeException(ex);
//        }
//
//    }
//
//}
//
//


package com.ptit.Service.impl;

import com.ptit.Service.MailerService;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailerServiceImpl implements MailerService {

    @Autowired
    private JavaMailSender mailer;

    @Override
    public String bodyReply(String hash){
        String body = "<body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #1b2838;\" leftmargin=\"0\">\r\n" +
                "    <!--100% body table-->\r\n" +
                "    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#1b2838\"\r\n" +
                "        style=\"font-family: Arial, sans-serif;\">\r\n" +
                "        <tr>\r\n" +
                "            <td>\r\n" +
                "                <table style=\"background-color: #2a475e; max-width:600px; margin:0 auto;\" width=\"100%\" border=\"0\"\r\n" +
                "                    align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n" +
                "                    <tr>\r\n" +
                "                        <td style=\"height:40px;\">&nbsp;</td>\r\n" +
                "                    </tr>\r\n" +
                "                    <tr>\r\n" +
                "                        <td style=\"text-align:center;\">\r\n" +
                "                            <h1 style=\"color:#66c0f4; font-size:24px;\">Chào bạn</h1>\r\n" +
                "                        </td>\r\n" +
                "                    </tr>\r\n" +
                "                    <tr>\r\n" +
                "                        <td style=\"height:20px;\">&nbsp;</td>\r\n" +
                "                    </tr>\r\n" +
                "                    <tr>\r\n" +
                "                        <td>\r\n" +
                "                            <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"\r\n" +
                "                                style=\"background:#171a21; border-radius:8px; text-align:center;\">\r\n" +
                "                                <tr>\r\n" +
                "                                    <td style=\"padding:20px;\">\r\n" +
                "                                        <p style=\"color:#c7d5e0; font-size:16px; line-height:24px; margin:0;\">\r\n" +
                "                                            Đây là mã xác nhận của bạn:\r\n" +
                "                                        </p>\r\n" +
                "                                    </td>\r\n" +
                "                                </tr>\r\n" +
                "                                <tr>\r\n" +
                "                                    <td style=\"background:#171a21; color:#66c0f4; text-align:center; padding:20px; border-radius:8px;\">\r\n" +
                "                                        <p style=\"font-size:14px; color:#c7d5e0; margin:0;\">Request made from</p>\r\n" +
                "                                        <p style=\"font-size:14px; color:#c7d5e0; margin:0;\">Viet Nam</p>\r\n" +
                "                                        <h2 style=\"color:#66c0f4; font-size:36px; margin:0;\">hash</h2>\r\n" +
                "                                    </td>\r\n" +
                "                                </tr>\r\n" +
                "                            </table>\r\n" +
                "                        </td>\r\n" +
                "                    </tr>\r\n" +
                "                    <tr>\r\n" +
                "                        <td style=\"height:40px;\">&nbsp;</td>\r\n" +
                "                    </tr>\r\n" +
                "                </table>\r\n" +
                "            </td>\r\n" +
                "        </tr>\r\n" +
                "    </table>\r\n" +
                "    <!--/100% body table-->\r\n" +
                "</body>";
        return body.replace("hash",hash);
    }

    @Override
    public void send(String from, String to, String subject, String body) {
        try {
            // Create mail
            MimeMessage mail = mailer.createMimeMessage();

            // Use helper class
            MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
            helper.setFrom(new InternetAddress(from, from));
            helper.setTo(to);
            helper.setReplyTo(new InternetAddress(from, from));
            helper.setSubject(subject);
            helper.setText(body, true);

            // Send mail
            mailer.send(mail);
        } catch (Exception ex) {
            System.out.println(ex);
            throw new RuntimeException(ex);
        }
    }
}
