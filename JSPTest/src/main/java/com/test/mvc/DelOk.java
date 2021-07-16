package com.test.mvc;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class DelOk extends HttpServlet {

	//할일
	//1. POST방식으로 불러서 한글깨지니까 인코딩
	//2. 데이터 가져오기
	//3. DB작업 -> insert
	//4. JSP 호출하기 + 결과 출력

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {



	//1. 인코딩
	//req.setCharacterEncoding("UTF-8");

	//2. 데이터 가져오기
	String seq = req.getParameter("seq");

	//3. DB
	Connection conn = null;
	PreparedStatement stat = null;
	int result = -1;

	try {

		String sql = "delete from tblAddress where seq = ?";

		conn = DBUtil.open();
		stat = conn.prepareStatement(sql);

		stat.setString(1, seq);

		//성공하면1, 실패 0
		result = stat.executeUpdate();


	} catch (Exception e) {
		e.printStackTrace();
	}


		//4. delok JSP 호출하기 + 결과 넘겨줌
		req.setAttribute("result", result);
		System.out.println("result : " + result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/delok.jsp");
		dispatcher.forward(req, resp);


	}


}
