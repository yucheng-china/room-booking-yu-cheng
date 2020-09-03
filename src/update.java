import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;

@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String category = request.getParameter("category");
		String capacity = request.getParameter("capacity");
		String booked = request.getParameter("booked_by");
		String status = request.getParameter("status");
		
		HttpSession session= request.getSession();
		String room_no= (String)session.getAttribute("admin_room_no");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			
			String sql= "update room set Room_Category='"+category+"',Capacity='"+capacity+"',Booked_By='"+booked+"',Status='"+status+"' where Room_no='"+room_no+"'";
			int i = st.executeUpdate(sql);
			if(i>0)
			{
				out.print("<script>alert('Details Submitted')</script>");
				response.sendRedirect("rooms.jsp");
			}
	}catch(Exception e)
		{
		e.printStackTrace();
	}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
