package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbHelper.ProductQuery;

/**
 * Servlet implementation class C_SubmitProductClaimServlet
 */
@WebServlet("/C_SubmitProductClaimServlet")
public class C_SubmitProductClaimServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_SubmitProductClaimServlet() {
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
		
		String username = request.getParameter("username");		
		String prodSerialNumber = request.getParameter("prodSerialNumber");
		String claimDate = request.getParameter("claimDate");
		String issueDescription = request.getParameter("issueDescription");				
		String status = "Pending";	

		if (username.isEmpty() || prodSerialNumber.isEmpty() || claimDate.isEmpty() || issueDescription.isEmpty()) 
		{
			out.println("<H3 style='color:red;'>*Please go back, and enter all the details to submit a claim.*</H3>");
			isValid = false;
		}
		
		if (isValid) {					
			try {
				ProductQuery prod = new ProductQuery();				
				int count = prod.doValidateClaimRequest(username, prodSerialNumber, claimDate);
				System.out.println(count);
				
				if(count >= 3)
				{
					System.out.println("Max claims already submitted under the protection plan.");
					out.println("<H3 style='color:red;'>*Maximum claims already submitted for this product under the protection plan.*</H3><br><br>");
					out.println("<H3 style='color:red;'>*Please go back, and verify the product claim.*</H3>");
				}
				else {
					System.out.println("Claim valid to submit");
					prod.doSubmitProductClaim(username, prodSerialNumber, claimDate, issueDescription, status);	
					
					request.setAttribute("loggedInUser", username);
					String url = "/UserHome.jsp";
					
					RequestDispatcher dispatcher = request.getRequestDispatcher(url);
					dispatcher.forward(request, response);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}

}
