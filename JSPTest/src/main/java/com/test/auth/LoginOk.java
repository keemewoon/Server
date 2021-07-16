package com.test.auth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth/loginok.do")
public class LoginOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//LoginOk.java

		//request.getParameter() -> 한글깨짐
		//1. GET 전송 -> UTF-8 전송 -> 한글 안깨짐
		//2. POST 전송 -> ISO 8859-1 전송 -> 한글깨짐
		//결론: POST로 넘길때만 인코딩 처리를 한다.

		//할일
		//0. 영어 숫자밖에 없어서 인코딩 처리 안해도 됨
		//1. 데이터 가져오기
		//2. DB작업 -> 회원 확인?
		//3. 결과
		//	3.1 일치 -> 인증 티켓 발급
		//	3.2 일치 -> 경고 !!

		//1.
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		//2. DB작업을 서블릿이 직접하지 않고 다른 클래스 (객체)에게 위임한다.(****************)
		AuthDAO dao = new AuthDAO();


		// *** 객체와 객체간의 호출시에는 (메소드부르는것) => 인자값이 1개면 그냥 전달,
		//												   인자값이 2개 이상이면 무조건 포장해서 넘긴다.

		// 우리 사이트의 회원인지 아닌지 판단해 주세요! -> authDAO가 DB에 쿼리를 날려서 판단할것임
		AuthDTO dto = new AuthDTO();
		dto.setId(id);
		dto.setPw(pw);

		/*
		 * int result = dao.login(dto); //1(로그인 성공), 0(로그인실패)
		 *
		 * // *********************중요한 작업 -> 인증 티켓 발급!!! if(result == 1) {
		 *
		 * //JSP의 session 객체와 같음 HttpSession session = req.getSession();
		 *
		 * // *** 이 값을 사이트 전체를 다 통틀어 반드시 이 곳 딱 1군데에서만 값을 할당할 수 있다. // 로그인
		 * session.setAttribute("id", id); //인증 티켓!!(primary키를 넣으면 활용도가 높다(기본식별자))
		 *
		 *
		 * }
		 */

		AuthDTO resultDTO = dao.login2(dto);

		if(resultDTO != null) {

			//로그인 성공 (AuthDAO > login2에서 객체를 돌려줌)
			//인증 티켓 발급

			HttpSession session = req.getSession();
			session.setAttribute("id", resultDTO.getId());

			//인증 티켓 발급과 동시에 이 사람의 부가 정보를 session에 담아둔다.
			session.setAttribute("name", resultDTO.getName());
			session.setAttribute("lv", resultDTO.getLv());
			session.setAttribute("regdate", resultDTO.getRegdate());

		}



		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/auth/loginok.jsp");
		dispatcher.forward(req, resp);

	}

}