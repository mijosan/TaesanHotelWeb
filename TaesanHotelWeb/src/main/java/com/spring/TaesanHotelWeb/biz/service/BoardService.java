package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;

public interface BoardService {

	//�� ����
	void insertBoard(BoardVO vo);

	//�� ����
	void updateBoard(BoardVO vo);

	//�� ����
	void deleteBoard(BoardVO vo);

	//�� �� ��ȸ
	BoardVO getBoard(BoardVO vo);
	
	//��ȸ�� ����
	void updateCnt(BoardVO vo);

	//�� ��� ��ȸ
	List<BoardVO> getBoardList(int pagenum, int contentnum, BoardVO vo);
	
	//�� ��� ����
	int getBoardListCnt();
	
	
}