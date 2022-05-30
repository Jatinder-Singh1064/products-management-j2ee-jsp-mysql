package dbHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Product;
/*
 * ProductQuery class - To handle all Product related functionalities with database.
 */
public class ProductQuery {
	Connection con = null;
	ResultSet resultset = null;

	public ProductQuery() throws Exception {
		con = DBConnection.getConnection();
	}
	
	//Method to insert new product in database by Admin
	public void doAddProduct(Product prod) {		
		String prodSerialNum = prod.getProductSerialNumber();
		String prodName = prod.getProductName();
		String prodModel = prod.getProductModel();
		String prodColor = prod.getProductColor();
		String prodCompany = prod.getProductCompany();	

		try {
			String query = "INSERT INTO products(ProductName, ProductModel, ProductColor, ProductSerialNumber, ProductCompany) VALUES (?,?,?,?,?)";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, prodName);
			preparedStatement.setString(2, prodModel);
			preparedStatement.setString(3, prodColor);			
			preparedStatement.setString(4, prodSerialNum);
			preparedStatement.setString(5, prodCompany);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to register a product in database by User
	public void doRegisterProduct(String username, String prodName, String prodSerialNum, String purchaseDate) {
		try {
			String query = "INSERT INTO registeredproducts(LoginId, ProductName, ProductSerialNumber, PurchaseDate) VALUES (?,?,?,?)";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, prodName);
			preparedStatement.setString(3, prodSerialNum);
			preparedStatement.setString(4, purchaseDate);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to Validate User's Product Claim request
	public int doValidateClaimRequest(String username, String prodSerialNumber, String claimDate) {
		int count = 0;
		try {	
			String query = "SELECT COUNT(c.ClaimId) FROM claim c JOIN registeredproducts r"
					+ " ON c.SerialNumber = r.ProductSerialNumber AND c.Username = r.LoginId"
					+ " WHERE " + "c.Username = '" + username.trim()
					+ "' AND c.SerialNumber = '" + prodSerialNumber.trim() + "'"
					+ " AND c.DateOfClaim between r.PurchaseDate AND (SELECT(r.PurchaseDate + INTERVAL 5 YEAR))";	
			
			//CORRECT THE QUERY
			/*
			String query = "SELECT * FROM claim WHERE " + "Username = '" + username.trim()
					+ "' AND SerialNumber = '" + prodSerialNumber.trim() + "'"
					+ " AND DateOfClaim between (SELECT '" + claimDate + "' - INTERVAL 5 YEAR) AND (SELECT '" + claimDate + "' + INTERVAL 1 DAY)";			
			*/		
			
			System.out.println(query);
			
			PreparedStatement preparedStatement = con.prepareStatement(query);
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {
				 int val = resultset.getInt(1);
				 count = val;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(count);
		return count;
	}

	//Method to submit a product claim after validation by User
	public void doSubmitProductClaim(String username, String prodSerialNumber, String claimDate,
			String issueDescription, String status) {
		try {
			String query = "INSERT INTO claim(SerialNumber, Description, DateOfClaim, Status, Username) VALUES (?,?,?,?,?)";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, prodSerialNumber);
			preparedStatement.setString(2, issueDescription);
			preparedStatement.setString(3, claimDate);
			preparedStatement.setString(4, status);
			preparedStatement.setString(5, username);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to update a product in database by Admin
	public void doUpdateProduct(Product prod) {
		String prodSerialNum = prod.getProductSerialNumber();
		String prodName = prod.getProductName();
		String prodModel = prod.getProductModel();
		String prodColor = prod.getProductColor();
		String prodCompany = prod.getProductCompany();	
		
		try {
			String query = "UPDATE products "
					+ "SET ProductName = ?, "
					+ "ProductModel = ?, "
					+ "ProductColor = ?, "
					+ "ProductCompany = ? "
					+ "WHERE ProductSerialNumber = ?";					

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, prodName);
			preparedStatement.setString(2, prodModel);
			preparedStatement.setString(3, prodColor);			
			preparedStatement.setString(5, prodSerialNum);
			preparedStatement.setString(4, prodCompany);
			int rowAffected = preparedStatement.executeUpdate();
			
			System.out.println(String.format("Row updated in products table = %d", rowAffected));

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to validate a product before register it by User (check whether the product exists in master table)
	public boolean doValidateProductDetailsBeforeRegister(String productSerialNum, String productName) {
		boolean res = false;
		try {
			String query = "SELECT * FROM products WHERE ProductSerialNumber = '" + productSerialNum + "' AND ProductName = '" + productName + "'";

			PreparedStatement preparedStatement = con.prepareStatement(query);			
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {	
				res = true;
				System.out.println("Product record exists");								
			} else {			
				System.out.println("No product record exists");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
}
