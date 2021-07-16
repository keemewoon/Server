package com.test.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.jsp.jdbc.DBUtil;

public class AddOk extends HttpServlet {

	//POST -> doPost()
	//GET -> doGET()

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//할일
		//1. POST방식으로 불러서 한글깨지니까 인코딩
		//2. 데이터 가져오기
		//3. DB작업 -> insert
		//4. JSP 호출하기 + 결과 출력

		//1. 인코딩
		req.setCharacterEncoding("UTF-8");

		//2.데이터가져오기
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");

		//3. DB작업 + insert
		Connection conn = null;
		PreparedStatement stat =  null;
		int result = -1; //result 변수가 절대로 가질 수 없는 값

		try {

			String sql = "insert into tblAddress (seq, name, age, gender, address) values(seqAddress.nextVal, ?, ?, ?, ?)";

			conn = DBUtil.open();
			stat = conn.prepareStatement(sql);

			stat.setString(1, name);
			stat.setString(2, age);
			stat.setString(3, gender);
			stat.setString(4, address);

			//성공하면 1, 실패하면 0 -> 이외의 경우의 수는 존재하지 않는다.
			result = stat.executeUpdate();



		} catch (Exception e) {
			e.printStackTrace();
		}


		//***출력할 내용이 거의 없는 경우엔
		// JSP와 짝을 맺지 않고, Servlet 혼자 일을 마무리 하는 경우도 종종 있다.

//		if(result == 1) {
//			resp.sendRedirect("/jsp/list.do");
//		} else {
//			//resp.sendRedirect("/jsp/add.do");
//			PrintWriter writer = resp.getWriter();
//			writer.print("<script>");
//			writer.print("histort.back();");
//			writer.print("</script>");
//			writer.close();
//		}
//

		//4. JSP 호출하기 + 결과 넘겨줌(성공했는지 실패했는지)
		req.setAttribute("result", result);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/address/addok.jsp");
		dispatcher.forward(req, resp);


	}


}
