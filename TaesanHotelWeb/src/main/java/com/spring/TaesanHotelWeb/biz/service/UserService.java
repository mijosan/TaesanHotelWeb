package com.spring.TaesanHotelWeb.biz.service;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;


public interface UserService {
	
		//�α��� üũ
		UserVO loginCheck(UserVO vo);

		//���̵� �ߺ�üũ
		int idCheck(String userid);
		
		//ȸ������
		void register(UserVO vo);

}
