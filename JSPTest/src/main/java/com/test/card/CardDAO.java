package com.test.card;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.jsp.jdbc.DBUtil;

public class CardDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public CardDAO() {

		try {

			conn = DBUtil.open();


		} catch (Exception e) {
			System.out.println("CardDAO.CardDAO()");
			e.printStackTrace();

		}

	}

	public int add(CardDTO dto) {

		//데이터베이스에 insert

		try {

			String sql = "insert into tblCard(seq, korname, engname, tel, email, company, position) values (seqCard.nextVal, ?, ?, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);

			//택배 상자에서 꺼낸다.
			pstat.setString(1, dto.getKorname());
			pstat.setString(2, dto.getEngname());
			pstat.setString(3, dto.getTel());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getCompany());
			pstat.setString(6, dto.getPosition());

			return pstat.executeUpdate(); //성공1 실패0



		} catch (Exception e) {
			System.out.println("CardDAO.add()");
			e.printStackTrace();
		}

		return 0;
	}

	public ArrayList<CardDTO> list(CardDAO dao) {

		try {

			String sql = "select * from tblCard order by korname asc";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			//ResultSet -> (변환) -> ArrayList<CardDTO>

			ArrayList<CardDTO> list = new ArrayList<CardDTO>();

			while(rs.next()) {

				//루프 1회 -> 레코드 1줄 -> CardDTO 1개
				CardDTO dto = new CardDTO();

				//rs.getXXX -> dto추가
				dto.setSeq(rs.getString("seq"));
				dto.setKorname(rs.getString("korname"));
				dto.setEngname(rs.getString("engname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setCompany(rs.getString("company"));
				dto.setPosition(rs.getString("position"));

				list.add(dto);


			}

			//ArrayList == ResultSet
			return list;


		} catch (Exception e) {
			System.out.println("CardDAO.list()");
			e.printStackTrace();
		}

		return null;
	}

}
