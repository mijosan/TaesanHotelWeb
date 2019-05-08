package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.TaesanHotelWeb.biz.common.PageMaker;
import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;


@Controller // Controller ������̼��� ��� Command��ü�� �������
@SessionAttributes("board") // Model�� "board"��� �̸����� ����Ǵ� �����Ͱ� �ִٸ� �� �����͸� ���ǿ��� �ڵ����� �����϶�� �����̴�.
public class BoardController {
	@Autowired
	private BoardService boardService;


	//�˻� ���� ��� ����
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		
			Map<String, String> conditionMap = new HashMap<String, String>();
			conditionMap.put("����","CONTENT");
			conditionMap.put("����","TITLE");
			conditionMap.put("�ۼ���","WRITER");
			return conditionMap;
	}

	
	@RequestMapping(value="/getBoardList.do")
	public ModelAndView getBoardList(@RequestParam(value="pagenum", defaultValue="1") int pagenum, BoardVO vo, ModelAndView mav) throws Exception {
		PageMaker pagemaker = new PageMaker();
		
		pagemaker.setTotalcount(boardService.getBoardListCnt());//��ü �Խñ� ����
		pagemaker.setPagenum(pagenum-1);//���� �������� ������ ��ü�� ����
		pagemaker.setContentnum(10);//�� �������� ��� �Խñ��� �������� �����Ѵ�.
		pagemaker.setCurrentblock(pagenum);//���� ������ ����� ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
		pagemaker.setLastblock(pagemaker.getTotalcount());//������ ��� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.
		
		pagemaker.prevnext(pagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�
		pagemaker.setStartPage(pagemaker.getCurrentblock());//���� �������� ������ ��� ��ȣ�� ���Ѵ�.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());//������ �������� ������ ������ ��ϰ� ���� ������ ��� ��ȣ�� ���Ѵ�.
		//Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		//���� ����
		mav.addObject("boardList",boardService.getBoardList(pagemaker.getPagenum()*10,pagemaker.getContentnum(), vo));
		mav.addObject("page", pagemaker);
		mav.setViewName("board.jsp");
		return mav;     
		
	}
	
	@RequestMapping(value="/getBoard.do") 
	public ModelAndView getBoard(BoardVO vo, ModelAndView mav) throws Exception {
		System.out.println("�� �� ��ȸ ó��");
		
		mav.addObject("board", boardService.getBoard(vo)); //Model ���� ����
		mav.setViewName("getBoard");
		return mav;
	}
	
	@RequestMapping(value="/updateBoard.do")
	public ModelAndView updateBoard(@ModelAttribute("board") BoardVO vo, ModelAndView mav) throws Exception {//���ǿ� �ִ� BoardVO��ü�� ���� �Ҵ�ǰ� �׸��� ����ڰ� �Է��� �Ķ���Ͱ��� vo ��ü�� �Ҵ�
		System.out.println("�� ���� ó��");
		
		System.out.println("�ۼ��� �̸� : " + vo.getWriter());
		boardService.updateBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public ModelAndView deleteBoard(BoardVO vo, ModelAndView mav) throws Exception {
		System.out.println("�� ���� ó��");
		
		
		boardService.deleteBoard(vo);
		mav.setViewName("redirect:getBoardList.do");
		return mav;
	}
	
	

	

	@RequestMapping(value="/insertBoard.do") // HandlerMapping ��ü
	public String insertBoard(BoardVO vo) throws Exception{
		System.out.println("�� ��� ó��");
		//���� ���ε� ó��
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/Spring/" + fileName));
		}

		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
		
	}
	

	
	
	
}
