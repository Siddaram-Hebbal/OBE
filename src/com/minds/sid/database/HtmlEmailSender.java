package com.minds.sid.database;

import org.apache.commons.lang3.tuple.ImmutablePair;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class HtmlEmailSender {

    //public static final EmailHostConfig GMAIL_CONFIG = new EmailHostConfig("smtp.gmail.com", "587");
	public static final EmailHostConfig GMAIL_CONFIG = new EmailHostConfig("smtp.gmail.com", "587");

    private Properties properties;
    private Session session;
    private InternetAddress fromAddress;

    public HtmlEmailSender(EmailHostConfig emailHostConfig, ImmutablePair<String, String> userNamePassword) throws AddressException {
        createProperties(emailHostConfig);
        createSession(userNamePassword);
        createFromAddress(userNamePassword);
    }

    private void createFromAddress(ImmutablePair<String, String> userNamePassword) throws AddressException {
        fromAddress = new InternetAddress(userNamePassword.left);
    }

    private void createSession(final ImmutablePair<String, String> userNamePassword) {
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(userNamePassword.left, userNamePassword.right);
            }
        };
        System.out.println("auth ------ "+auth);
        session = Session.getInstance(properties, auth);
    }

    private void createProperties(EmailHostConfig emailHostConfig) {
        properties = new Properties();
        properties.put("mail.smtp.host", emailHostConfig.getHost());
        properties.put("mail.smtp.port", emailHostConfig.getPort());
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
    }

    public void sendHtmlEmail(String toAddress, String subject, String message) throws MessagingException {
        Message msg = new MimeMessage(session);
        msg.setFrom(fromAddress);
        InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
        msg.setSentDate(new Date());
        msg.setContent(message, "text/html");

        Transport.send(msg);
    }

    /*@Data*/
    public static class EmailHostConfig {

        private final String host;

        private final String port;
        
        public EmailHostConfig(String host, String port) {
            this.host = host;
            this.port = port;
        }

		public String getHost() {
			return host;
		}

		public String getPort() {
			return port;
		}
    }
}