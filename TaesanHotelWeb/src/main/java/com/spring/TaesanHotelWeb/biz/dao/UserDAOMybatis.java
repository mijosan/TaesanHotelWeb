package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.UserVO;

@Repository
public class UserDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	//�α���
	public UserVO loginCheck(UserVO vo) {
		System.out.println("===> Mybatis�� loginCheck() ��� ó��");
		return (UserVO)getSqlSession().selectOne("UserDAO.loginCheck", vo);
	}
	//�ߺ�üũ
	public int idCheck(String id) {
		System.out.println("===> Mybatis�� idCheck() ��� ó��");
		return (Integer)getSqlSession().selectOne("UserDAO.idCheck", id);
	}
	
	//ȸ������
	public void register(UserVO vo) {
		System.out.println("===> Mybatis�� register() ��� ó��");
		getSqlSession().insert("UserDAO.register", vo);
	}
	
	//ȸ������ ����
	public void updateMember(UserVO vo) {
		System.out.println("===> Mybatis�� updateMember() ��� ó��");
		getSqlSession().update("UserDAO.updateMember", vo);
	}
	
	//�̸���üũ
	public int emailCheck(String email) {
		System.out.println("===> Mybatis�� emailCheck() ��� ó��");
		return (Integer)getSqlSession().selectOne("UserDAO.emailCheck", email);
	}
	
	//�̸���üũ
	public List<String> idSearch(String email) {
		System.out.println("===> Mybatis�� emailCheck() ��� ó��");
		return getSqlSession().selectList("UserDAO.idSearch", email);
	}
}
