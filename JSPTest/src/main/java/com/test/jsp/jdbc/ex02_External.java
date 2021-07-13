package com.test.jsp.jdbc;

import java.sql.Connection;

public class ex02_External {

	public static void main(String[] args) {


		Connection conn = null;



		try {

			conn = DBUtil.open();

			System.out.println(conn.isClosed());


			conn.close();

			System.out.println(conn.isClosed());


		} catch (Exception e) {
			System.out.println("Ex02_External.main()");
			e.printStackTrace();
		}



	}

}
