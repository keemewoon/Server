package com.test.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.jsp.jdbc.DBUtil;

//MVC 디자인 패턴
//-> 데이터 처리를 담당하는 객체 -> DAO


//DAO, Data Access Object
// - 데이터를 처리하는 전용 객체(DB)


//*******철칙 !! : JDBC와 관련된 코드는 앞으로 DAO에서만 구현한다.(*********************)
public class AuthDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	//DB연결
	public AuthDAO() {

		try {

			conn = DBUtil.open();


		} catch (Exception e) {
			System.out.println("AuthDAO.AuthDAO()");
			e.printStackTrace();
		}

	}

	//LoginOK 서블릿이 id와 pw를 줄테니 DB에서 회원이 맞는지를 검사해 주세요..
	public int login(AuthDTO dto) {

		try {

			String sql = "select count(*) as cnt from tblaaa where = id=? nd pw =?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());

			//쿼리 실행
			rs = pstat.executeQuery();

			//행의 갯수 1 => while문 필요 없음
			if(rs.next()) {
				return rs.getInt("cnt"); //1 or 0
			}


		} catch (Exception e) {
			System.out.println("AuthDAO.login()");
			e.printStackTrace();
		}


		return 0;
	}

	public AuthDTO login2(AuthDTO dto) {

		try {


			//로그인 처리
			String sql = "select * from tblaaa where id=? and pw=?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());


			rs = pstat.executeQuery();

			if(rs.next()) {

				//로그인O
				AuthDTO resultDTO = new AuthDTO();

				resultDTO.setId(rs.getString("id"));
				resultDTO.setName(rs.getString("name"));
				resultDTO.setLv(rs.getString("lv"));
				resultDTO.setRegdate(rs.getString("regdate"));

				//성공하면 1또는0돌려주는 대신에 객체나 null을 돌려주기로 바꾼것.
				return resultDTO;

			}


		} catch (Exception e) {
			System.out.println("AuthDAO.login2()");
			e.printStackTrace();
		}

		return null;
	}



}


