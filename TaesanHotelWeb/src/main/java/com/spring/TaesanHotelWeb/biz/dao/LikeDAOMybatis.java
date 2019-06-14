package com.spring.TaesanHotelWeb.biz.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

@Repository
public class LikeDAOMybatis extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public int checkLike(LikeVO vo){
		System.out.println("===> Mybatis�� checkLike() ��� ó��");
		return getSqlSession().selectOne("LikeDAO.checkLike", vo);
	}
	
	public void deleteLike(LikeVO vo){
		System.out.println("===> Mybatis�� deleteLike() ��� ó��");
		getSqlSession().delete("LikeDAO.deleteLike", vo);
	}
	
	public void addLike(LikeVO vo){
		System.out.println("===> Mybatis�� addLike() ��� ó��");
		getSqlSession().insert("LikeDAO.addLike", vo);
	}
}
