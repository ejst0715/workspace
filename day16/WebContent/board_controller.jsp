<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.board.*,java.util.*"%>
<jsp:useBean id="dao" class="model.board.BoardDAO" />
<jsp:useBean id="vo" class="model.board.BoardVO" />
<jsp:setProperty property="*" name="vo"/>
<%
	String action=request.getParameter("action");
	String cnt=request.getParameter("cnt");
	// url 파라미터에 현재 게시글을 몇개까지 열람할수있는지에 대한 정보를 저장해야함!!!
	
	int mcnt=2; // 최초에는 2개의 게시글을 볼수있음
	if(cnt!=null){
		mcnt=Integer.parseInt(cnt);
	}
	
	String url="board_controller.jsp?action=main";
	
	if(action.equals("main")){
		ArrayList<BoardSet> datas=dao.selectAll(mcnt);
		request.setAttribute("datas", datas);
		request.setAttribute("cnt", mcnt);
		pageContext.forward("main.jsp");
	}
	else if(action.equals("fav")){
		if(dao.update(vo)){
			pageContext.forward(url);
		}
		else{
			System.out.println("fav 액션에서 문제발생!");
		}
	}
/*	else if(action.equals("deleteB")){
		if(){
			
		}
		else{
			System.out.println("deleteB 액션에서 문제발생!");
		}
	}
	else if(action.equals("deleteR")){
		if(){
			
		}
		else{
			System.out.println("deleteR 액션에서 문제발생!");
		}*/
	
%>