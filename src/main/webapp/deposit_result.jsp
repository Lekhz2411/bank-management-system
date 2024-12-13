<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Speedy Bank !!!</title>
        <link href="style.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div id="top_links">
        <div id="header">
        <img src="images/mylogo.png" style=width:200px;padding-left:120px;/>
            <a href="index.html">
                <h1>SPEEDY BANK<span class="style1"></span></h1>
            </a>
            <h2>ExtraOrdinary Service</h2>
        </div>
        <div id="navigation">
            <ul>
                <li><a href="create.html">NEW ACCOUNT</a></li>
                <li><a href="balance.jsp">BALANCE</a></li>
                <li><a href="deposit.jsp">DEPOSIT</a></li>
                <li><a href="withdraw.jsp">WITHDRAW</a></li>
                <li><a href="transfer.jsp">TRANSFER</a></li>
                <li><a href="closeac.jsp">CLOSE A/C</a></li>
                <li><a href="about.jsp">Contact Us</a></li>
            </ul>
        </div>
        <table style="width:897px; background:#FFFFFF; margin:0 auto;">
            <tr >
                <td width="300" valign="top" style="border-right:#666666 1px dotted;">
                    <div id="services">
                        <h1>Services</h1>
                        <br>
                        <ul>
                                <li><a href="https://en.wikipedia.org/wiki/Mobile_banking" target="_blank">Mobile Banking</a></li>
                                <li><a href="https://en.wikipedia.org/wiki/Online_banking" target="_blank">Online Banking</a></li>
                                <li><a href="https://www.fultonbank.com/Education-Center/Saving-and-Budgeting/Bank-account-questions" target="_blank">Clear your Doubts</a></li>
                                <li><a href="https://www.forbes.com/advisor/in/banking/how-to-open-a-bank-account/" target="_blank">How To open a bank account</a></li>
                                <li><a href="https://www.investopedia.com/articles/trading/06/daytradingretail.asp/" target="_blank">Trading for beginners</a></li>
                            </ul>
                    </div>
                </td>
                <td width="1200" valign="top">
                    <table><%
                    	PreparedStatement ps;
						ResultSet rs;
                        String num=request.getParameter("accountno");
                        int accountno=Integer.parseInt(num);
                        String username=request.getParameter("username");
                        String password=request.getParameter("password");
                        String amoun=request.getParameter("amount");
                        int accoun=Integer.parseInt(amoun);
                        boolean status=verifyLogin1.checkLogin(accountno,username,password);
                        try {
                        if(status==true){
                        
                        Connection con=GetCon.getCon();
                        ps=con.prepareStatement("Select * from NEWACCOUNT where accountno=?");
                        ps.setInt(1,accountno);
                        rs=ps.executeQuery();
                        int dataamount=0;
                        
                        if(rs.next()){
                        dataamount=accoun+rs.getInt(5); 
                        
                        }
                        
                        ps=con.prepareStatement("update NEWACCOUNT set amount=? where accountno='"+accountno+"'");
                        ps.setInt(1,dataamount);
                        ps.executeUpdate();
                        out.println("<center><img src='images/tick.png' alt='not found' style=width:200px;/></br></br>AMOUNT DEPOSITED SUCCESSFULLY</br>");
                        rs.next();
                        ps=con.prepareStatement("Select AMOUNT from NEWACCOUNT where accountno=?");
                        ps.setInt(1,accountno);
                        rs=ps.executeQuery();
                        rs.next();
                        int newbal = rs.getInt(1);
                        Random rand = new Random();
                        int transaction_id = 70000000 + rand.nextInt(29999999);
                        out.println("</br><b>NEW BALANCE IS <span style='color:#299617'>RS."+newbal+"</span></b></br></br></br></center>");
                        ps=con.prepareStatement("insert into TRANSACTIONS(TRANSACTION_ID, ACCOUNT_NO, TARGET_ACCOUNT_NO, AMOUNT, REMARKS, AVAILABLE_BALANCE) VALUES(?,?,?,?,?,?)");
                        ps.setInt(1,transaction_id);
                        ps.setInt(2,accountno);
                        ps.setInt(3,accountno);
                        ps.setInt(4,accoun);
                        ps.setString(5,"Self-Deposit");
                        ps.setInt(6,dataamount);
                        ps.executeUpdate();
                        }
                        else{
                        out.println("<center><img src='images/cross.png' alt='not found' style=width:250px;/></br></br>AUTHENTICATION FAILED</br></br>");
                        
                        }
                        }catch (SQLException e) {
                        e.printStackTrace();
                        }
                        
                        %></table>

        </table>
        <%@ page import="java.sql.*"%>
        <%@ page import="java.io.*" %>
        <%@ page import="java.util.Random" %>
        <%@ page import="javax.servlet.*"%>
        <%@ page import="servlets.*" %>