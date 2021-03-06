package com.test.jsp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {

	public static Connection open() {

		Connection conn = null;

		String url = "jdbc:oracle:thin:@localhost:1522:xe";
		String id = "hr";
		String pw = "java1234";

		try {


			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);

			return conn;


		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}


	// 다른 계정이나 다른 컴퓨터로 접속하기 위해 오버로딩
	public static Connection open(String server, String id, String pw) {

		Connection conn = null;

		String url = "jdbc:oracle:thin:@" + server + ":1522:xe";

		try {


			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);

			return conn;


		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}

}
