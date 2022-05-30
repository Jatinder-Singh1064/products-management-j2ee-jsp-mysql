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
import model.Product;

/**
 * Servlet implementation class C_UpdateProductServlet
 */
@WebServlet("/C_UpdateProductServlet")
public class C_UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public C_UpdateProductServlet() {
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

		String loggedInAdmin = request.getParameter("loggedInAdmin");
		String prodSerialNum = request.getParameter("prodSerialNum");
		String prodName = request.getParameter("prodName");
		String prodModel = request.getParameter("prodModel");
		String prodColor = request.getParameter("prodColor");
		String prodCompany = request.getParameter("prodCompany");
		
		if (prodSerialNum.isEmpty() || prodName.isEmpty() || prodModel.isEmpty() || prodColor.isEmpty()
				|| prodCompany.isEmpty()) 
		{
			out.println("<H3 style='color:red;'>*Please go back, and enter all the details to add a new product.*</H3>");
			isValid = false;
		}
		
		if (isValid) {	
			Product product = new Product();

			product.setProductSerialNumber(prodSerialNum);
			product.setProductName(prodName);
			product.setProductModel(prodModel);
			product.setProductColor(prodColor );
			product.setProductCompany(prodCompany);
						
			try {
				ProductQuery pQ = new ProductQuery();				
				pQ.doUpdateProduct(product);	
				
				request.setAttribute("loggedInAdmin", loggedInAdmin);
				String url = "/ViewAllProducts.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(url);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
	}

}
