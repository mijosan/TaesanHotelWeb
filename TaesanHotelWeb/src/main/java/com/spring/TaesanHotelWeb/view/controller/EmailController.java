package com.spring.TaesanHotelWeb.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Controller
public class EmailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserService userService;
	
	String emailDept;
	// mailForm
	 
	  // mailSending �ڵ�
	  @ResponseBody
	  @RequestMapping(value = "/mail.do")
	  public Map<Object, Object> mailSending(@RequestBody UserVO vo) {
		 
		Map<Object, Object> map = new HashMap<Object, Object>();
		int count = userService.emailCheck(vo.getEmail());
		
		if(count != 0) { //Email�� �����Ҷ�
	   
		    String setfrom = "erptaesanchoi@gmail.com";         
		    String tomail  = vo.getEmail();// �޴� ��� �̸���
		    emailDept = vo.getEmail(); //���̵� ã���������� ����
		    String title   = "[TsHotel] ȸ������ ���̵� ã�� ������ȣ �Դϴ�.";      // ����
		    String content;    // ����
		    
		    int number = (int)(Math.random()*100000)+1;
		    content = "������ȣ : "+number;
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // �����»�� �����ϰų� �ϸ� �����۵��� ����
		      messageHelper.setTo(tomail);     // �޴»�� �̸���
		      messageHelper.setSubject(title); // ���������� ������ �����ϴ�
		      messageHelper.setText(content);  // ���� ����
		     
		      mailSender.send(message);
		      
		      //������ȣ ����
		      map.put("number", number);
		      return map;
		    } catch(Exception e){
		      System.out.println(e);
		    }
	  }else { //email �� ���� ���� ������
		  map.put("result", "fail");
		  return map;
	  }
		 return null;
	  }	
	  
	  @ResponseBody
	  @RequestMapping(value = "/idSearch.do")
	  public Map<Object, Object> idSearch() {
		 List<String> list = userService.idSearch(emailDept);
		 HashMap<Object,Object> map = new HashMap<Object,Object>();
		 map.put("list", list);
		 
		 return map;	
	  }	 
}
