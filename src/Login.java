import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
//		PrintWriter out = response.getWriter();
		String username = request.getParameter("uname");
		String password = request.getParameter("pwd");
		String ID = request.getParameter("ID");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			
			String sql= "select * from Registration where username='"+username+"' and password='"+password+"' and ID='"+ID+"'";
			ResultSet rs = st.executeQuery(sql);
			int flag=0;
			while(rs.next())
			{
				if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)) && ID.equals(rs.getString(3)))
				{
					flag=1;
				}
			
			}
			if(flag==1)
			{
				HttpSession session= request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("ID", ID);
				response.sendRedirect("new_welcome.jsp");
			}
			else
			{
				response.sendRedirect("login.html");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
