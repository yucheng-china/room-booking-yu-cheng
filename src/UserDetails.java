import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.sql.*;

@WebServlet("/UserDetails")
public class UserDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UserDetails() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("sname");
		String email = request.getParameter("email");
		String ph = request.getParameter("ph_no");
		String cin = request.getParameter("cin");
		String cout = request.getParameter("cout");
		
		String status= "Booked";
		
		HttpSession session= request.getSession();
		String ID2 = (String)session.getAttribute("ID1");
		String room_no= (String)session.getAttribute("room_no");
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			
			String sql = "insert into customer (first_name,last_name,email,ph_no,room_no,id,check_in,check_out) values ('"+fname+"','"+lname+"','"+email+"','"+ph+"',"+room_no+",'"+ID2+"','"+cin+"','"+cout+"')";
			String sql2= "update room set Booked_By='"+fname+"',Status='"+status+"' where Room_no='"+room_no+"'";
			
			
			
			st.executeUpdate(sql2);
			int i = st.executeUpdate(sql);
			if(i>0)
			{
				out.print("<html><body>");
				out.print("<script type='text/javascript'>alert('Thank you for your booking')</script>");

				out.print("</body></html>");
				
				RequestDispatcher rd = request.getRequestDispatcher("ViewMyBooking.jsp");
				rd.include(request,response);
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
