package com.test.jsp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class Ex01 {

	public static void main(String[] args) {

		//자바(JDBC)를 사용해서 오라클에 접속하기
		//1. DB접속
		//	- Connection 클래스

		Connection conn = null; //java.sql


		//2. 연결 문자열 생성
		// - 접속에 필요한 정보로 구성된 문자열
		String url = "jdbc:oracle:thin:@localhost:1522:xe";
		String id = "hr";
		String pw = "java1234";

		try {

			//3. 설치한 JDBC 드라이버 로딩(ojdbc6.jar)
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//4. 접속
			// - Connection 객체 생성(new Connection()) + 오라클 접속
			// - 연결이 됨과 동시에 연결 정보를 가지고 있는 Connection 객체를 반환
			conn = DriverManager.getConnection(url, id, pw); //*** 자바와 오라클이 연결(접속 O)
			System.out.println(conn.isClosed());  //연결안됨: true, 연결됨: false


			//5. 질의(****)

			//6. 접속 종료
			conn.close();
			System.out.println(conn.isClosed()); //연결마침: true


		}catch (Exception e) {
			System.out.println("Ex01.main()");
			e.printStackTrace();
		}



	}


}
