package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller ������̼��� ��� Command��ü�� �������
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@RequestMapping(value="/login.do")
	public ModelAndView login(UserVO vo, ModelAndView mav, HttpSession session)throws SQLException {
		if(vo.getId()==null || vo.getId().equals("")) {
			throw new IllegalArgumentException("���̵�� �ݵ�� �Է��ؾ� �մϴ�.");
		}
		System.out.println("�α��� ó��");
		
		UserVO user;
		
		user = userService.loginCheck(vo);
		//3. ȭ�� �׺���̼�
			if(user !=null){
				mav.setViewName("index.jsp");
				//mav.addObject("user",user.getName()); �ٷ� getBoardList.jsp�� ���ٸ� �����ִµ� getBoardList.do���� ���Ӱ�  ModelAndView ��ü�� �����ؼ� ���⶧���� ������ MAV�� �ٸ���.
				session.setAttribute("user", user);
			}else{
				mav.setViewName("login.jsp");
			}
		return mav;

	}
	
	@RequestMapping(value="/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) throws Exception {
		System.out.println("�α׾ƿ� ó��");
		
		session.invalidate();
		mav.setViewName("redirect:login.jsp");
		return mav;
	}

}
