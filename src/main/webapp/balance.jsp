<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <SCRIPT LANGUAGE="JavaScript">
            function dil(form)
            {
               for(var i=0; i<form.elements.length; i++)
               {
            		if(form.elements[i].value == "")
            		{
            		   alert("Fill out all Fields")
            		   document.F1.accountno.focus()
            		   return false
            		}
               }
            
               if(isNaN(document.F1.accountno.value))
               {
                   alert("Accountno must  be  number & can't be null")
            	   document.F1.accountno.value=""
            	   document.F1.accountno.focus()
            	   return false
               }
               if(!isNaN(document.F1.username.value))
               {
                   alert("User Name  must  be  char's & can't be null")
            	   document.F1.username.value=""
            	   document.F1.username.focus()
            	   return false
               }
            
               if(!isNaN(document.F1.password.value))
               {
                   alert("Password  must  be  char's & can't be null")
            	   document.F1.password.value=""
            	   document.F1.password.focus()
            	   return false
               }
               
               return true   
            }
        </SCRIPT>
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
            <table style="width:900px; background:#FFFFFF; margin:0 auto;">
                <tr >
                    <td width="100" valign="top" style="border-right:#666666 1px dotted;">
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
                    <td width="650" valign="top">
                        <div id="welcome">
                            <h1>BALANCE FORM</h1>
                            <br>
                            <table  align="center" bgcolor="white">
                                <tr>
                                </tr>
                                <tr>
                                    <td>
                                        <div><%if(request.getAttribute("balance")!=null)
                                            {
                                            out.print(request.getAttribute("balance"));
                                            }
                                            
                                             %></div>
                                        <form name=F1 onSubmit="return dil(this)" action="balance_result.jsp" method="post" >
                                            <table cellspacing="5" cellpadding="3" width="400">
                                                <tr>
                                                    <td>ACCOUNT NO:</td>
                                                    <td> <input type="text" name="accountno"/></td>
                                                </tr>
                                                <tr>
                                                    <td>USER NAME:</td>
                                                    <td> <input type="text" name="username"/></td>
                                                </tr>
                                                <tr>
                                                    <td>PASSWORD:</td>
                                                    <td> <input type="password" name="password"/></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                     <td>
                                                    </td>
                                                </tr>
                                                
                                            </table>
                                            <center><input type="submit" value="CHECK BAL"/>
                                                     <INPUT TYPE="reset" VALUE="CLEAR"/>
                                        	</center>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td width="150" valign="top">
                        <div id="welcome" style="border-left:#666666 1px dotted;">
                            <h1>Welcome</h1>
                            <br>
                            <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center>
                            <br>
                            <p>Speedy Bank's online portal streamlines banking processes, enabling users to effortlessly create an account, deposit and withdraw money with ease. The platform also facilitates swift and secure fund transfers to other accounts. Managing your finances becomes a breeze with the user-friendly interface, making it simple to navigate through various transactions. Whether you're depositing, withdrawing, transferring, or closing an account, Speedy Bank ensures a quick and convenient online banking experience.</p>
                        </div>
                    </td>
                </tr>
            </table>
            <div id="footer_top">
                <div id="footer_navigation">
                </div>
                <div id="footer_copyright" >
                    <br>
                    <p>Speedy Bank's online portal streamlines banking processes, enabling users to effortlessly create an account, deposit and withdraw money with ease. The platform also facilitates swift and secure fund transfers to other accounts. Managing your finances becomes a breeze with the user-friendly interface, making it simple to navigate through various transactions. Whether you're depositing, withdrawing, transferring, or closing an account, Speedy Bank ensures a quick and convenient online banking experience.</p>
                    <p>SPEEDY BANK. All Rights Reserved</p>
                        </div>
            </div>
            <script type="text/javascript">
                document.onload = ctck();
            </script>
        </div>
    </body>
</html>