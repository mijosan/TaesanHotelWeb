package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spring.TaesanHotelWeb.biz.common.PageMaker;
import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


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
		pagemaker.setPagenum(pagenum);//���� �������� ������ ��ü�� ����
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
		mav.addObject("boardList",boardService.getBoardList((pagemaker.getPagenum()-1)*10,pagemaker.getContentnum(), vo)); //0~10, 11~21
		mav.addObject("page", pagemaker);
		mav.setViewName("board");

		return mav;     
		
	}
	
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(String editor, BoardVO vo, HttpSession session) throws IllegalStateException, IOException {
        System.err.println("������ ���� : " + editor);
        	//���� ���ε� ó��
      		MultipartFile uploadFile = vo.getUploadFile();
      		if(!uploadFile.isEmpty()) {
      			String fileName = uploadFile.getOriginalFilename();
      			vo.setFileName(fileName);
      			uploadFile.transferTo(new File("C:/Spring/TaesanHotelWeb/TaesanHotelWeb/src/main/webapp/resources/files/" + fileName));
      		}
      		System.out.println(vo.getContent());
      		UserVO userVO = (UserVO)session.getAttribute("user");
      		vo.setWriter(userVO.getId());
      		vo.setRegDate(new Date());
      		boardService.insertBoard(vo);
        return "redirect:getBoardList.do";
    }
 
    // �������Ͼ��ε�
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // ��������
        StringBuffer sb = new StringBuffer();
        try {
            // ���ϸ��� �޴´� - �Ϲ� �������ϸ�
            String oldName = request.getHeader("file-name");
            // ���� �⺻��� _ �󼼰��
            String filePath = "C:/Spring/TaesanHotelWeb/TaesanHotelWeb/src/main/webapp/resources/editor/photoUpload/";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // ���� ���
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/TaesanHotelWeb/resources/editor/photoUpload/")
                                                  
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
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
	@RequestMapping(value="/writeCheck.do")
	public String writeCheck(HttpSession session) throws Exception{
		
		UserVO vo = (UserVO)session.getAttribute("user");
		if(vo != null) {
			return "write";
		}else {
			return "redirect:loginForm.jsp";
		}
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

	
}
