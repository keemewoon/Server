package com.test.card;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/card/list.do")
public class List extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//할일
		//1. DB > 위임 > select
		//2. 결과 반환 > 출력 > JSP 호출하기

		//1.
		CardDAO dao = new CardDAO();

		//Connection , resultset, 모두다 쓰면 안된다!! DAO에만 DB작업 관련 코드 넣기
		//ResultSet rs = dao.list();

		//ResultSet <-> ArrayLIst<CardDTO>
		//ResulstSet : 테이블
		//ArrayLIst<CardDTO>: 2차원 배열
		ArrayList<CardDTO> list = dao.list(dao);


		//2.
		req.setAttribute("list", list);




		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/card/list.jsp");
		dispatcher.forward(req, resp);

	}

}