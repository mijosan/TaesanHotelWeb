package com.spring.TaesanHotelWeb.biz.service;

import com.spring.TaesanHotelWeb.biz.vo.LikeVO;

public interface LikeService {
	
	//���ƿ� üũ
	public int checkLike(LikeVO vo);
	
	//���ƿ� ����
	public void deleteLike(LikeVO vo);
	
	//���ƿ� �߰�
	public void addLike(LikeVO vo);
}
