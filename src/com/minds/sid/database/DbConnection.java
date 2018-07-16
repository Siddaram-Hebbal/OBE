/**
 * This Class Provides Connection and Statement
 */
package com.minds.sid.database;

/**
 * @author lenovo
 *
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DbConnection 
{
	Statement stmt;
	private String databaseName;
	
	public Statement dbConnect()
	{
		databaseName = "riyaduniversity";
		 try
	 		{
	 			String url = "jdbc:mysql://localhost:3306/"+databaseName;
	 			System.out.println("Before Instantiation");
	 				Class.forName("com.mysql.jdbc.Driver").newInstance();
	 			System.out.println("After Instantiation");
	 				Connection con=DriverManager.getConnection(url,"root", "gravitant");	
	 				stmt = con.createStatement();
	 		}
		 catch (Exception e) {
			e.printStackTrace();
		}
		 return stmt;
	}

}

