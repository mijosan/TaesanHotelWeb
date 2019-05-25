package com.spring.TaesanHotelWeb.biz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.CommentVO;

public interface BoardService {

	//�� ����
	void insertBoard(BoardVO vo);
	
	//��� ����
	void insertComment(CommentVO vo);
	
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
	
	//�� �ֻ��� ��ȣ ��ȸ
	int getSeq();
	
	//���� �������� ���� ���� ���� ���ϱ�
	int getOrd(BoardVO vo);
	
	//groupOrd + 1 ����
	void updateOrd(BoardVO vo);

	//////////////////////////////////////���//////////////////////////////////////////// 
	
	//��� ��������
	List<CommentVO> getComment(int b_seq, int start, int end);
	
	//��� ����
	void deleteComment(int c_seq);
	
	//��� ����
	void updateComment(CommentVO vo);
}