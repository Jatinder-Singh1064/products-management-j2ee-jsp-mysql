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
 * Servlet implementation class C_RegisterProductServlet
 */
@WebServlet("/C_RegisterProductServlet")
public class C_RegisterProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public C_RegisterProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("In C_RegisterProductServlet - Post...");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String css = "<link rel='stylesheet' type='text/css'>";
		String docType = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " + "Transitional//EN\">\n";
		boolean isValid = true;

		String username = request.getParameter("username");
		String productName = request.getParameter("productName");
		String productSerialNum = request.getParameter("productSerialNum");
		String purchaseDate = request.getParameter("purchaseDate");

		if (username.isEmpty() || productName.isEmpty() || productSerialNum.isEmpty() || purchaseDate.isEmpty()) {
			out.println(
					"<H3 style='color:red;'>*Please go back, and enter all the details to register a product.*</H3>");
			isValid = false;
		}

		if (isValid) {
			try {
				ProductQuery pQ = new ProductQuery();

				boolean isValidProd = pQ.doValidateProductDetailsBeforeRegister(productSerialNum, productName);

				if (isValidProd) {
					pQ.doRegisterProduct(username, productName, productSerialNum, purchaseDate);

					request.setAttribute("loggedInUser", username);
					String url = "/UserHome.jsp";

					RequestDispatcher dispatcher = request.getRequestDispatcher(url);
					dispatcher.forward(request, response);
				} else {
					out.println(
							"<H3 style='color:red;'>*Please go back, and validate the details to register a product.*</H3>");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
