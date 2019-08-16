package com.spring.TaesanHotelWeb.view.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.TaesanHotelWeb.biz.common.PageMaker;
import com.spring.TaesanHotelWeb.biz.service.BoardService;
import com.spring.TaesanHotelWeb.biz.service.LikeService;
import com.spring.TaesanHotelWeb.biz.vo.BoardVO;
import com.spring.TaesanHotelWeb.biz.vo.CommentVO;
import com.spring.TaesanHotelWeb.biz.vo.UserVO;


@Controller // Controller ������̼��� ��� Command��ü�� �������
@SessionAttributes("board") // Model�� "board"��� �̸����� ����Ǵ� �����Ͱ� �ִٸ� �� �����͸� ���ǿ��� �ڵ����� �����϶�� �����̴�.
public class BoardController implements ApplicationContextAware {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private LikeService likeService;

	private WebApplicationContext context = null;
	
	String SAVE_PATH="C:/Spring/TaesanHotelWeb/TaesanHotelWeb/src/main/webapp/resources/files/";
	//���� ��������
	@ResponseBody
	@RequestMapping("getSession.do")
	public UserVO getSession(HttpSession session, HttpServletResponse response) throws JsonProcessingException, IOException {
		UserVO vo = (UserVO)session.getAttribute("user");

		if(vo != null) {
			return vo;
		}
		return null;
	}
	//��� ����
	@ResponseBody
	@RequestMapping(value = "/commentInsert.do", method = RequestMethod.POST)
	public void insertComment(@RequestBody CommentVO vo, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("user");
		vo.setC_writer(userVO.getId());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String c_regdate = sdf.format(date);
		vo.setC_regdate(c_regdate);
		if(vo.getCm().equals("cm1")) {//��� �϶�
			vo.setOriginNo(boardService.getC_seq());
			vo.setGroupOrd(0);
			vo.setGroupLayer(0);
		}else if(vo.getCm().equals("cm2")) { //���� �϶�
			boardService.commentUpdateOrd(vo);
			vo.setGroupOrd(vo.getGroupOrd()+1);
			vo.setGroupLayer(vo.getGroupLayer()+1);
		}
		
		boardService.insertComment(vo);
	}
	
	//��� ����Ʈ
	@ResponseBody
	@RequestMapping(value = "/commentList.do", method = RequestMethod.GET)
	public List<CommentVO> getComment(@RequestParam("b_seq")int b_seq){
		return boardService.getComment(b_seq,1,10);
	}
	//��� ����
	@ResponseBody
	@RequestMapping("deleteComment.do")
	public void deleteComment(@RequestBody Map<String, Object> json,HttpServletResponse response, HttpSession session) throws JsonProcessingException, IOException {
		ObjectMapper mapper = new ObjectMapper();//Jackson ���̺귯���� ObjectMapper�� ����Ͽ� ��ü�� Json ������ ���ڿ��� �����.
		
		UserVO vo = (UserVO)session.getAttribute("user");
		if(vo != null) {
			if(vo.getId().equals((String)json.get("c_writer"))) {
				boardService.deleteComment(Integer.valueOf((String) (json.get("c_seq"))));
				response.getWriter().print(mapper.writeValueAsString("success"));
			}else {
				response.getWriter().print(mapper.writeValueAsString("fail2"));
			}
		}else {
			response.getWriter().print(mapper.writeValueAsString("fail1"));
		}
	}
	//��� ����
	@ResponseBody
	@RequestMapping("updateComment.do")
	public void updateComment(@RequestBody CommentVO vo,HttpServletResponse response, HttpSession session) throws JsonProcessingException, IOException {
		ObjectMapper mapper = new ObjectMapper();//Jackson ���̺귯���� ObjectMapper�� ����Ͽ� ��ü�� Json ������ ���ڿ��� �����.
		
		UserVO userVO = (UserVO)session.getAttribute("user");
		if(userVO != null) {
			if(userVO.getId().equals(vo.getC_writer())) {
				boardService.updateComment(vo);
				response.getWriter().print(mapper.writeValueAsString("success"));
			}else {
				response.getWriter().print(mapper.writeValueAsString("fail2"));
			}
		}else {
			response.getWriter().print(mapper.writeValueAsString("fail1"));
		}
	}
	//��� �亯
	//��� ����¡
	
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
		pagemaker.setCurrentblock(pagenum);//���� ������ ������ ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
		pagemaker.setLastblock(pagemaker.getTotalcount());//������ ���� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.
		
		pagemaker.prevnext(pagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�
		pagemaker.setStartPage(pagemaker.getCurrentblock());//���� �������� ������ ���� ��ȣ�� ���Ѵ�.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());//������ �������� ������ ������ ���ϰ� ���� ������ ���� ��ȣ�� ���Ѵ�.
		//Null Check
		if(vo.getSearchCondition() == null) vo.setSearchCondition("TITLE");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		//���� ����
		List<BoardVO> list = boardService.getBoardList((pagemaker.getPagenum()-1)*10,pagemaker.getContentnum(), vo);
		mav.addObject("boardList",list); //0~10, 11~21
		mav.addObject("page", pagemaker);
		mav.setViewName("board");
		
		ObjectMapper mapper = new ObjectMapper();
			
		String json = "";
		try {
			json = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("list", json);
		return mav;     
		
	}
	//���� �� �� ��������
	@RequestMapping(value="getMyBoardList.do")
	public ModelAndView getMyBoard(@RequestParam(value="pagenum", defaultValue="1") int pagenum, BoardVO vo, ModelAndView mav, HttpSession session) throws Exception {
		UserVO userVO = (UserVO)session.getAttribute("user");
		PageMaker pagemaker = new PageMaker();

		pagemaker.setTotalcount(boardService.getMyBoardListCnt(userVO.getId()));//��ü �Խñ� ����
		pagemaker.setPagenum(pagenum);//���� �������� ������ ��ü�� ����
		pagemaker.setContentnum(10);//�� �������� ��� �Խñ��� �������� �����Ѵ�.
		pagemaker.setCurrentblock(pagenum);//���� ������ ������ ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
		pagemaker.setLastblock(pagemaker.getTotalcount());//������ ���� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.
		
		pagemaker.prevnext(pagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�
		pagemaker.setStartPage(pagemaker.getCurrentblock());//���� �������� ������ ���� ��ȣ�� ���Ѵ�.
		pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());//������ �������� ������ ������ ���ϰ� ���� ������ ���� ��ȣ�� ���Ѵ�.

		//���� ����
		vo.setWriter(userVO.getId());
		List<BoardVO> list = boardService.getMyBoardList((pagemaker.getPagenum()-1)*10,pagemaker.getContentnum(), vo);
		mav.addObject("boardList",list); //0~10, 11~21
		mav.addObject("page", pagemaker);
		mav.setViewName("myBoard");
		
		//ModelAndView ���� ���� List ��ü JQuery ���� �ޱ�
		ObjectMapper mapper = new ObjectMapper();
			
		String json = "";
		try {
			json = mapper.writeValueAsString(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.addObject("list", json);
		return mav;     
		
	}
	
	//���� �� ��� ��������
		@RequestMapping(value="getMyCommentList.do")
		public ModelAndView getMyCommentList(@RequestParam(value="pagenum", defaultValue="1") int pagenum, CommentVO vo, ModelAndView mav, HttpSession session) throws Exception {
			UserVO userVO = (UserVO)session.getAttribute("user");
			PageMaker pagemaker = new PageMaker();
			
			pagemaker.setTotalcount(boardService.getMyCommentListCnt(userVO.getId()));//��ü �Խñ� ����
			pagemaker.setPagenum(pagenum);//���� �������� ������ ��ü�� ����
			pagemaker.setContentnum(10);//�� �������� ��� �Խñ��� �������� �����Ѵ�.
			pagemaker.setCurrentblock(pagenum);//���� ������ ������ ������� ���� ������ ��ȣ�� ���ؼ� �����Ѵ�.
			pagemaker.setLastblock(pagemaker.getTotalcount());//������ ���� ��ȣ�� ��ü �Խñ� ���� ���ؼ� ���Ѵ�.
			
			pagemaker.prevnext(pagenum);//���� ������ ��ȣ�� ȭ��ǥ�� ��Ÿ���� ���Ѵ�
			pagemaker.setStartPage(pagemaker.getCurrentblock());//���� �������� ������ ���� ��ȣ�� ���Ѵ�.
			pagemaker.setEndPage(pagemaker.getLastblock(), pagemaker.getCurrentblock());//������ �������� ������ ������ ���ϰ� ���� ������ ���� ��ȣ�� ���Ѵ�.

			//���� ����
			vo.setC_writer(userVO.getId());
			List<CommentVO> list = boardService.getMyCommentList((pagemaker.getPagenum()-1)*10,pagemaker.getContentnum(), vo);
			mav.addObject("commentList",list); //0~10, 11~21
			mav.addObject("page", pagemaker);
			mav.setViewName("myComment");
			
			return mav;     
			
		}
	
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(@RequestParam(value="uploadFile", required = false) MultipartFile mf,String editor, BoardVO vo, HttpSession session,
    		@RequestParam(value="ck",required=false)String ck) throws IllegalStateException, IOException {


    		//���� ���ε� ó��
      		if(!mf.isEmpty()) {
      			String originalFileName = System.currentTimeMillis() + mf.getOriginalFilename();
      			DecimalFormat formatter = new DecimalFormat("###,###");
      			String fileSize = formatter.format(mf.getSize())+"byte";
      			String safeFile = SAVE_PATH + originalFileName; //���� ���ϸ��� ���ε��Ͽ��� �Ȱ�ħ
      			vo.setFileSize(fileSize);
      			vo.setOriginalFileName(originalFileName);
      			vo.setFileName(mf.getOriginalFilename());
      			mf.transferTo(new File(safeFile));
      		}
      		
      		//���� ��and���� �׷쿡�� ����ū �� + 1 �ؼ� ���߿� ���� ����� ���� ������ ������ > ���� �ڿ��ִ� groupOrd���� +1 ��������� 
      		
      		if(ck != null) { //����϶�
      			
      			boardService.updateOrd(vo);
      			String re = "";
      			for(int i=0;i<vo.getGroupLayer();i++) {
      				re = re + "��";
      			}
      			vo.setTitle(re+"����"+vo.getTitle());
      		}else { //�۾����϶�
      			vo.setOriginNo(boardService.getSeq()+1);
      			vo.setGroupOrd(0);
      			vo.setGroupLayer(0);
      		}
      		UserVO userVO = (UserVO)session.getAttribute("user");
      		vo.setWriter(userVO.getId());
      		vo.setRegDate(new Date());
      		boardService.insertBoard(vo);
        return "redirect:getBoardList.do";

    }
    
	@RequestMapping(value="/writeCheck.do")
	public ModelAndView writeCheck(@RequestParam(value="ck", required = false)String responseWrite, HttpSession session, BoardVO boardVO, ModelAndView mav) throws Exception{
	
		UserVO vo = (UserVO)session.getAttribute("user");
		if(vo != null) {
			mav.addObject("responseWrite",responseWrite);
			mav.addObject("board",boardVO);
			mav.setViewName("write");
			return mav;
		}else {
			mav.setViewName("redirect:loginForm.jsp");
			return mav;
		}
	}
	
    @RequestMapping("download.do")
    public ModelAndView download(HttpServletRequest request, ModelAndView mv){

	    	String fullPath = SAVE_PATH+request.getParameter("originalFileName");
	    	System.out.println(fullPath);
			File file = new File(fullPath);
	
			return new ModelAndView("download", "downloadFile", file);
    	}

    @Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException {
         
        this.context = (WebApplicationContext)arg0;
         
    }

    // �������Ͼ��ε� (����)
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
   
	
	@RequestMapping(value="/getBoard.do") 
	public ModelAndView getBoard(BoardVO vo, ModelAndView mav, @RequestParam(value="message",required=false) String message) throws Exception {
		System.out.println("�� �� ��ȸ ó��");
		
		
		//��ȸ�� ����
		boardService.updateCnt(vo);
		if(message !=null) {
			if(message.equals("fail2")) {
				mav.addObject("message","�α����� �ʿ��մϴ�.");
			}else if(message.equals("fail1")){
				mav.addObject("message","������ �����ϴ�.");
			}
		}
		mav.addObject("board", boardService.getBoard(vo)); //Model ���� ����
		mav.addObject("likeCnt",likeService.getLike(vo.getSeq()));
		mav.setViewName("getBoard");
		return mav;
	}
	
	@RequestMapping(value="/updateBoard.do")
	public ModelAndView updateBoard(@RequestParam(value="uploadFile", required = false) MultipartFile mf, BoardVO vo, ModelAndView mav, HttpSession session, HttpServletRequest request) throws Exception {//���ǿ� �ִ� BoardVO��ü�� ���� �Ҵ�ǰ� �׸��� ����ڰ� �Է��� �Ķ���Ͱ��� vo ��ü�� �Ҵ�
		System.out.println("�� ���� ó��");
		String upck = request.getParameter("upck")==null?"":request.getParameter("upck");
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			if(user.getId().equals(vo.getWriter())) { //�α��� id�� �۾� id�� ������ ����
				if(upck.equals("upck")) { // �����Ҷ�
					
					if(mf != null) {
		      			String originalFileName = System.currentTimeMillis() + mf.getOriginalFilename();
		      			String safeFile = SAVE_PATH + originalFileName; //���� ���ϸ��� ���ε��Ͽ��� �Ȱ�ħ
		      			DecimalFormat formatter = new DecimalFormat("###,###");
		      			String fileSize = formatter.format(mf.getSize())+"byte";
		      			vo.setFileSize(fileSize);
		      			vo.setOriginalFileName(originalFileName);
		      			vo.setFileName(mf.getOriginalFilename());
		      			
		      			mf.transferTo(new File(safeFile));
		      		}
	
					boardService.updateBoard(vo);
					mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq());
					return mav;
					
				}else { //ù ���������� ����
					BoardVO boardVO = boardService.getBoard(vo);
					mav.addObject("boardVO",boardVO);
					mav.setViewName("update");
					return mav;
				}
			}else { //���̵� Ʋ���� message���� ������ getBoard.do�� ���ư�
				mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail1");
				return mav;
			}
		}else { //�α����� �����ʾ�����
			mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail2");
			return mav;
		}
	
	}
	
	@RequestMapping(value="/deleteBoard.do")
	public ModelAndView deleteBoard(BoardVO vo, ModelAndView mav, HttpSession session ,HttpServletResponse response) throws Exception {
		System.out.println("�� ���� ó��");
		
		UserVO user = (UserVO)session.getAttribute("user");
		if(user != null) {
			if(user.getId().equals(vo.getWriter())) { //�α��� id�� �۾� id�� ������ ����
				boardService.deleteBoard(vo);
				mav.setViewName("redirect:getBoardList.do"); //������ ����Ʈ��
				return mav;
			}else { //���̵� Ʋ���� message���� ������ getBoard.do�� ���ư�
				mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail1");
				return mav;
			}
		}else { //�α����� �����ʾ�����
			mav.setViewName("redirect:getBoard.do?seq="+vo.getSeq()+"&message=fail2");
			return mav;
		}
	
	}
	
	//���� �� �� �����ϱ�
	@ResponseBody
	@RequestMapping(value="deleteMyBoard.do")
	public void deleteMyBoard(@RequestBody BoardVO vo, ModelAndView mav, HttpSession session) throws Exception {
		System.out.println("���� �� �� ���� ó��");
		boardService.deleteBoard(vo);
	}
	
	//���� �� ��� �����ϱ�
	@ResponseBody
	@RequestMapping(value="deleteMyComment.do")
	public void deleteMyComment(@RequestBody CommentVO vo, ModelAndView mav, HttpSession session) throws Exception {
		System.out.println("���� �� ��� ���� ó��");
		boardService.deleteComment(vo.getC_seq());
	}
	

	

	
}