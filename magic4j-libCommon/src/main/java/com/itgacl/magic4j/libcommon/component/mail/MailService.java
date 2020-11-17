package com.itgacl.magic4j.libcommon.component.mail;

import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;

public interface MailService {

    /**
     * 发送文本邮件
     * @param to
     * @param subject
     * @param content
     */
     void sendSimpleMail(String to, String subject, String content);

     void sendSimpleMail(String to, String subject, String content, String... cc);

    /**
     * 发送HTML邮件
     * @param to
     * @param subject
     * @param content
     */
    void sendHtmlMail(String to, String subject, String content) throws MessagingException;

    void sendHtmlMail(String to, String subject, String content, String... cc) throws MessagingException;

    /**
     * 发送带附件的邮件
     * @param to
     * @param subject
     * @param content
     * @param filePath
     * @throws MessagingException
     */
    void sendAttachmentsMail(String to, String subject, String content, String filePath) throws MessagingException;

    void sendAttachmentsMail(String to, String subject, String content, String filePath, String... cc) throws MessagingException;

    void sendAttachmentsMail(String to, String subject, String content, MultipartFile file) throws MessagingException;

    void sendAttachmentsMail(String to, String subject, String content, MultipartFile file, String... cc) throws MessagingException;

    /**
     * 发送正文中有静态资源的邮件
     * @param to
     * @param subject
     * @param content
     * @param rscPath
     * @param rscId
     * @throws MessagingException
     */
    void sendResourceMail(String to, String subject, String content, String rscPath, String rscId) throws MessagingException;

    void sendResourceMail(String to, String subject, String content, String rscPath, String rscId, String... cc) throws MessagingException;


}
