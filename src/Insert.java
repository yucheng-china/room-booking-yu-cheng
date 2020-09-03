import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;


@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Insert() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String room = request.getParameter("room_no");
		String category = request.getParameter("category");
		String capacity = request.getParameter("capacity");
		String booked="";
		String status="Available";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:EE417","ee_user","ee_pass");
			Statement st = con.createStatement();
			
			String sql = "insert into room (Room_No,Room_Category,Capacity,Booked_By,Status) values ('"+room+"','"+category+"','"+capacity+"','"+booked+"','"+status+"')";
			int i = st.executeUpdate(sql);
			if(i>0)
			{
				out.print("<script>alert('Room added Successfully')</script>");
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
