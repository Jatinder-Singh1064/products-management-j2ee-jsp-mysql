package dbHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
/*
 * UserQuery class - To handle all User related functionalities with database.
 */
public class UserQuery {	
	Connection con = null;
	ResultSet resultset = null;

	public UserQuery() throws Exception {
		con = DBConnection.getConnection();
	}
	
	//Method to insert/register new user in database
	public void doAddUser(User user) {		
		String username = user.getUsername();
		String u_password = user.getPassword();
		String u_phone = user.getPhone();
		String u_email = user.getEmail();
		String u_address = user.getAddress();	

		try {
			String query = "INSERT INTO user(Username, Password, Phone, Email, Address) VALUES (?,?,?,?,?)";

			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setString(1, username);
			preparedStatement.setString(2, u_password);
			preparedStatement.setString(3, u_phone);			
			preparedStatement.setString(4, u_email);
			preparedStatement.setString(5, u_address);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//Method to validate and perform User Login
	public boolean doLoginUser(String username, String u_password) {
		boolean res = true;
		try {
			String query = "SELECT * FROM user WHERE Username = '" + username + "' AND Password = '" + u_password + "'";

			PreparedStatement preparedStatement = con.prepareStatement(query);			
			resultset = preparedStatement.executeQuery();
			
			if(resultset.next()) {			
				System.out.println("User record exists");								
			} else {
				res = false;
				System.out.println("No user record exists");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}

}
