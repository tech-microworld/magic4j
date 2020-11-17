package com.itgacl.magic4j.libcommon.component.mail.controller;

import com.itgacl.magic4j.libcommon.annotation.Validator;
import com.itgacl.magic4j.libcommon.bean.R;
import com.itgacl.magic4j.libcommon.component.mail.MailService;
import com.itgacl.magic4j.libcommon.controller.Magic4jBaseController;
import io.swagger.annotations.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;

@Api(tags = "邮件发送")
@RequestMapping("/api/email")
@RestController
public class MailController extends Magic4jBaseController {

    @Autowired
    private MailService mailService;

    @ApiOperation("发送文本邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendSimpleMail")
    public R<Void> sendSimpleMail(String to, String subject, String content){
        mailService.sendSimpleMail(to,subject,content);
        return R.ok();
    }

    @ApiOperation("发送文本邮件并抄送")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true),
            @ApiImplicitParam(name = "cc",value = "需要抄送的邮箱",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendAndCcSimpleMail")
    public R<Void> sendAndCcSimpleMail(String to, String subject, String content,String... cc){
        mailService.sendSimpleMail(to,subject,content,cc);
        return R.ok();
    }

    @ApiOperation("发送HTML邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendHtmlMail")
    public R<Void> sendHtmlMail(String to, String subject, String content) throws MessagingException {
        mailService.sendHtmlMail(to,subject,content);
        return R.ok();
    }

    @ApiOperation("发送HTML邮件并抄送")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true),
            @ApiImplicitParam(name = "cc",value = "需要抄送的邮箱",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendAndCcHtmlMail")
    public R<Void> sendAndCcHtmlMail(String to, String subject, String content,String... cc) throws MessagingException {
        mailService.sendHtmlMail(to,subject,content,cc);
        return R.ok();
    }

    @ApiOperation("发送带附件的邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendAttachmentsMail")
    public R<Void> sendAttachmentsMail(String to, String subject, String content, @ApiParam(value = "邮件附件", required = true) @RequestParam(value = "file") MultipartFile file) throws MessagingException {
        mailService.sendAttachmentsMail(to, subject, content, file);
        return R.ok();
    }

    @ApiOperation("发送带附件的邮件并抄送")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "to",value = "收件邮箱",required = true),
            @ApiImplicitParam(name = "subject",value = "邮件主题",required = true),
            @ApiImplicitParam(name = "content",value = "邮件内容",required = true),
            @ApiImplicitParam(name = "cc",value = "需要抄送的邮箱",required = true)
    })
    @Validator(value = {"to","subject","content"},message = {"请填写收件邮箱","请填写邮件主题","请填写邮件内容"})
    @PostMapping("/sendAndCcAttachmentsMail")
    public R<Void> sendAndCcAttachmentsMail(String to, String subject, String content, @ApiParam(value = "邮件附件", required = true) @RequestParam(value = "file") MultipartFile file,String... cc) throws MessagingException {
        mailService.sendAttachmentsMail(to,subject,content,file,cc);
        return R.ok();
    }
}
