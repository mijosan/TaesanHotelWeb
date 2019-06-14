package com.spring.TaesanHotelWeb.view.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.TaesanHotelWeb.biz.service.LikeService;
import com.spring.TaesanHotelWeb.biz.vo.LikeVO;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;

		@ResponseBody
		@RequestMapping(value = "updateLike.do")
		public Map<Object, Object> updateLike(@RequestBody LikeVO vo, HttpSession session) {
		 
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		// 1. �α��� ���� Ȯ��
		// 2. �ش� ���̵� ���ƿ� �Ͽ����� ���� �Ǵ�
		// 3. ���ƿ並 �Ͽ����� ���ƿ� ������ ����
		// 4. ���ƿ並 ���� �ʾ����� ������ �߰�
		UserVO userVO = (UserVO)session.getAttribute("user");
		int checkLike = likeService.checkLike(vo);
		if(userVO == null) {
			map.put("result", "login");
		}else if(checkLike>=1) {
			likeService.deleteLike(vo);
			map.put("result", "down");
			map.put("likeCnt",getLike(vo.getB_seq())); //���ƿ� ������ map�� ��Ƽ� ������
		}else if(checkLike==0) {
			likeService.addLike(vo);
			map.put("result", "up");
			map.put("likeCnt",getLike(vo.getB_seq()));
		}
		return map;  
		}
		
		public int getLike(int b_seq) {
			return likeService.getLike(b_seq);
		}
		
}
