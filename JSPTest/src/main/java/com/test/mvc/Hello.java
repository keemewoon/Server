package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Hello extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//PrintWriter
		// -> 클라이언트 코드 작성
		// -> writer.print("<html>">

		//자바 코드 작성 -> 전문
		// -> JDBC 작성

		//JSP 호출하기
		// 1. Servlet -> Servlet
		// 2. Servlet -> JSP  == Servlet -> Servlet
		// 3. JSP -> JSP == Servlet -> Servlet
		// 4. JSP -> Servlet == Servlet -> Servlet


		//Serlvet 업무의 산출물 -> JSP에게 전달
		String msg = "Hello JSP MVC"; //Orcle -> Select 결과
		req.setAttribute("msg", msg); //Jsp에 주려고 request 객체에 담는다.

		//Servlet -> JSP 호출하기
		//resp.sendRedirect("/jsp/mvc/hello.jsp");
		//pageContext.forward("/mvc/hello.jsp");

		// "/" -> wabapp
		//RequestDispatcher dispatcher = req.getRequestDispatcher("/mvc/hello.jsp");
		//dispatcher.forward(req, resp); //명령어 실행 순간 /mvc/hello.jsp로 이동

		//***JSP Model2에서는..
		// - Servlet을 통해서 호출되는 JSP 페이지는 반드시 WEB-INF 이하에 저장한다.
		// - 애초부터 Servlet을 통하지 않은 JSP 페이지를 직접 접근하는 행동을 미연에 방지하기 위해서!!
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/hello.jsp");
		dispatcher.forward(req, resp); //명령어 실행 순간 /WEB-INF/views/hello.jsp로 이동


		//결론
		//http://localhost:8090/jsp/hello.do
		//http://localhost:8090/jsp/WEB-INF/views/hello.jsp
		
	}


}
