package com.spring.TaesanHotelWeb.biz.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.TaesanHotelWeb.biz.service.LikeService;
import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

@Service("likeService")
public class LikeImpl implements LikeService{
	
	@Autowired
	private LikeDAOMybatis likeDAO;

	//���ƿ並 �������� �Ǵ�
	@Override
	public int checkLike(LikeVO vo) {
		return likeDAO.checkLike(vo);
	}
	
	//���ƿ� ����
	@Override
	public void deleteLike(LikeVO vo) {
		likeDAO.deleteLike(vo);
	}
	
	//���ƿ� �߰�
	@Override
	public void addLike(LikeVO vo) {
		likeDAO.addLike(vo);		
	}
	
	//���ƿ� ��������
	@Override
	public int getLike(int b_seq) {
		return likeDAO.getLike(b_seq);
	}
}
