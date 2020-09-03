import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;


@WebServlet("/admin_login")
public class admin_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public admin_login() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ausername = request.getParameter("uname");
		String password = request.getParameter("pwd");

		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			
			String sql= "select * from admin_login where username='"+ausername+"' and password='"+password+"'";
			ResultSet rs = st.executeQuery(sql);
			int flag=0;
			while(rs.next())
			{
				if(ausername.equals(rs.getString(1)) && password.equals(rs.getString(2)))
				{
					flag=1;
				}
			
			}
			if(flag==1)
			{
				HttpSession session= request.getSession();
				session.setAttribute("ausername", ausername);
				response.sendRedirect("crud.jsp");
			}
			else
			{
				response.sendRedirect("login.html");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
