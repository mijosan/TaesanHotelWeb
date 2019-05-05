package com.spring.TaesanHotelWeb.biz.dao;

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
	
	public UserVO loginCheck(UserVO vo) {
		System.out.println("===> Mybatis�� loginCheck() ��� ó��");
		return (UserVO)getSqlSession().selectOne("UserDAO.loginCheck", vo);
	}
}
