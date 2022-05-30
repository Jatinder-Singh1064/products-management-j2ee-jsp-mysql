package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelper.AdminQuery;

/**
 * Servlet implementation class C_AdminLoginServlet
 */
@WebServlet("/C_AdminLoginServlet")
public class C_AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_AdminLoginServlet() {
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

		if (request.getParameter("adminname").isEmpty() || request.getParameter("a_password").isEmpty()) 
		{
			out.println("<H3 style='color:red;'>* Admin credentials are required to login.*</H3>");
			isValid = false;
		}
		
		if (isValid) {
			String adminname = request.getParameter("adminname");
			String a_password = request.getParameter("a_password");		
						
			try {
				AdminQuery add = new AdminQuery();
				
				String url = "";
				boolean res = add.doLoginAdmin(adminname, a_password);
				
				if(!res) {
					url = "/LoginAdmin.jsp";				
				} else {
					request.setAttribute("loggedInAdmin", adminname);
					url = "/AdminHome.jsp";
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
