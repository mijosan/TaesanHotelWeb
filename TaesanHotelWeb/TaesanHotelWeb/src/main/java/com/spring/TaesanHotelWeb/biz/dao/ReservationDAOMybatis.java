package com.spring.TaesanHotelWeb.biz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.ReservationVO;

@Repository
public class ReservationDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertReservation(ReservationVO vo) {
		System.out.println("===> Mybatis�� insertReservation() ��� ó��");
		getSqlSession().insert("ReservationDAO.insertReservation", vo);
	}
	
	public List<ReservationVO> getReservation(String id){
		System.out.println("===> Mybatis�� getReservation() ��� ó��");
		return getSqlSession().selectList("ReservationDAO.getReservation", id);
	}
	
	public void deleteReservation(int r_seq) {
		System.out.println("===> Mybatis�� deleteReservation() ��� ó��");
		getSqlSession().selectList("ReservationDAO.deleteReservation", r_seq);
	}
	
}
