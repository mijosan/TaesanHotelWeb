package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.UserService;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOMybatis userDAO;
	
	//�α���
	@Override
	public UserVO loginCheck(UserVO vo) {
		return userDAO.loginCheck(vo);
	}
	
	//���̵� �ߺ�üũ
	@Override
	public int idCheck(String id) {
		return userDAO.idCheck(id);
	}
	
	//ȸ������
	@Override
	public void register(UserVO vo) {
		userDAO.register(vo);
	}
	
	//ȸ������ ����
	@Override
	public void updateMember(UserVO vo) {
		userDAO.updateMember(vo);	
	}
	
	//�̸��� üũ
	@Override
	public int emailCheck(String email) {
		return userDAO.emailCheck(email);
	}
	
	//���̵� �˻�
	@Override
	public List<UserVO> idSearch(String email) {
		return userDAO.idSearch(email);
	}
}
