package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelper.UserQuery;

/**
 * Servlet implementation class C_UserLoginServlet
 */
@WebServlet("/C_UserLoginServlet")
public class C_UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String css = "<link rel='stylesheet' type='text/css'>";
		String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " + "Transitional//EN\">\n";
		boolean isValid = true;		

		if (request.getParameter("username").isEmpty() || request.getParameter("u_password").isEmpty()) 
		{
			out.println("<H3 style='color:red;'>*Username and Passowrd is required to login.*</H3>");
			isValid = false;
		}
		
		if (isValid) {
			String username = request.getParameter("username");
			String u_password = request.getParameter("u_password");								
			try {
				UserQuery login = new UserQuery();
				
				String url = "";
				boolean res = login.doLoginUser(username, u_password);
				
				if(!res) {
					url = "/LoginUser.jsp";				
				} else {
					request.setAttribute("loggedInUser", username);
					url = "/UserHome.jsp";
				}
							
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
	}

}
