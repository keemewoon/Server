package com.test.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth/logoutok.do")
public class LogoutOk extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//LogoutOk.java

		//할일
		//1. 인증 티켓을 제거( = 로그아웃)

		HttpSession session = req.getSession();

		//session.removeAttribute("id"); //인증 티켓 삭제 == 로그아웃
		//session.removeAttribute("name");
		//session.removeAttribute("lv");
		//session.removeAttribute("regdate");

		//현재 세션을 유효하지 않게 만든다. > 즉 폐기한다.
		// ** 없애면 안되는 세션 변수도 모두 사라지기 떄문에 항상 주의한다.
		session.invalidate();



		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/auth/logoutok.jsp");
		dispatcher.forward(req, resp);

	}

}