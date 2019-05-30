package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;


public interface UserService {
	
		//�α��� üũ
		UserVO loginCheck(UserVO vo);

		//���̵� �ߺ�üũ
		int idCheck(String userid);
		
		//ȸ������
		void register(UserVO vo);
		
		//ȸ������ ����
		void updateMember(UserVO vo);
		
		//�̸��� üũ
		int emailCheck(String email);
		
		//ȸ������ �˻�
		List<UserVO> idSearch(String email);
}
