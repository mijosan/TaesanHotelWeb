package com.spring.TaesanHotelWeb.biz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;



@Repository
public class BoardDAOMybatis extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSsessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� insertBoard() ��� ó��");
		getSqlSession().insert("BoardDAO.insertBoard", vo);
	}
	
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� updateBoard() ��� ó��");
		getSqlSession().update("BoardDAO.updateBoard", vo);
	}
	
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� deleteBoard() ��� ó��");
		getSqlSession().delete("BoardDAO.deleteBoard", vo);
	}
	
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis�� getBoard() ��� ó��");
		return (BoardVO)getSqlSession().selectOne("BoardDAO.getBoard", vo);
	}
	
	public void updateCnt(BoardVO vo) {
		System.out.println("===> Mybatis�� updateCnt() ��� ó��");
		getSqlSession().update("BoardDAO.updateCnt", vo);
	}
	
	public List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo) {
		System.out.println("===> Mybatis�� getBoardList() ��� ó��");
		HashMap map = new HashMap<String, Object>();
		
		map.put("pagenum",pagenum);
		map.put("contentnum",contentnum);
		map.put("BoardVO",vo);
		return getSqlSession().selectList("BoardDAO.getBoardList", map);
	}
	
	public int getBoardListCnt() {
		return getSqlSession().selectOne("BoardDAO.getBoardListCnt");
	}
	
}