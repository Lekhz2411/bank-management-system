package servlets;
import java.sql.Connection;
import java.util.Random;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class RegisterUser {
static int status=0;

public static int register(String username,String password,String mail,double amount,String adderess,double phone){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	int account_no = 0;
	try {
		ps = con.prepareStatement("Insert into NEWACCOUNT(username,password,email,amount,address,phone) values(?,?,?,?,?,?)");
		ps.setString(1,username);
		ps.setString(2,password);
		ps.setString(3,mail);
		ps.setDouble(4,amount);
		ps.setString(5,adderess);
		ps.setDouble(6,phone);

		status=ps.executeUpdate();
		
		ps=con.prepareStatement("Select max(accountno) from newaccount");
        
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
			account_no=rs.getInt(1);
        }
		Random rand = new Random();
		int transaction_id = 70000000 + rand.nextInt(29999999);
		ps = con.prepareStatement("Insert into TRANSACTIONS(TRANSACTION_ID, ACCOUNT_NO, TARGET_ACCOUNT_NO, AMOUNT, REMARKS, AVAILABLE_BALANCE) values(?,?,?,?,?,?)");
		ps.setInt(1, transaction_id);
		ps.setInt(2, account_no);
		ps.setInt(3, account_no);
		ps.setDouble(4, amount);
		ps.setString(5, "Initial Deposit");
		ps.setDouble(6, amount);
		ps.executeUpdate();

	} catch (SQLException e) {
		e.printStackTrace();
	}
	return status;

}


}
