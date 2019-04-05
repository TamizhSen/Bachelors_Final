create or replace package SQLATTACK_WEBPAGE is




procedure signUp;
procedure signupsuccess;
procedure indexpage;
procedure css;
procedure loginPage;
Procedure manager;
procedure customer(customer_name varchar2 default null);
procedure supplier;
procedure logistics;
procedure searchorder;
procedure insertporductpage;
end SQLATTACK_WEBPAGE;
/
create or replace package body SQLATTACK_WEBPAGE is

procedure signUp is
begin
htp.p('<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <style type="text/css">
    table{background-color: 6699CC}
  </style>
</head>
<body bgcolor="#E2E2E2">
      <h3 align="center"><h1 align="center"><font size="+3" color="#930093" face="Times New Roman,Times,serif"><b><i>ONLINE SHOPPING SYSTEM</i></b></font></h1>
      <form action="btspgsup.SQLATTACK_USERDETAILS.signUp" method="post">


           <table align="center">
                 <tr>
                     <th colspan="2">Signup Form</th>
                 </tr>
                 <tr>
                      <td>Username</td>
                      <td><input type="text" name="username" /></td>
                 </tr>
                 <tr>
                      <td>Password</td>
                      <td><input type="password" name="password1" /></td>
                 </tr>
                 <tr>
                      <td align="right">Role</td>
                      <td>
                           <select name="role1">
                                 <option value="">Select Role</option>
                                 <option value="customer">Customer</option>
                                 <option value="logistics">Logistics</option>
                                 <option value="supplier">Supplier</option>
                                 <option value="manager">Manager</option>
                           </select>
                      </td>
                 </tr>
                 <tr>
                      <td><input type="submit" value="Submit" /></td>
                       <td align="right"><input type="reset" value="Reset" /></td>
                 </tr>
           </table>
      </form>
</body>
</html>');
end signUp;

procedure signupsuccess is
begin
htp.p('<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#B0B0B0">
      <h3 align="center"><font color="999999">Online Shopping System</font></h3>
      <p align="center"><font color="red" size="6">Signup Successfully Complected</font></p>
      <p><a href="btspgsup.SQLATTACK_WEBPAGE.indexpage"><h3 align="center">Home Page</h3></a></p>
</body>
</html>');
end signupsuccess;
procedure indexpage is
begin
htp.p('<html>
<head>
<title>Home</title>
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>

<style type="text/css">
<!--
body {

	background-color: #E2E2E2;
}
-->
</style>');
css;
htp.p('</head>
<body bgcolor="#E2E2E2" onLoad="noBack();"
onpageshow="if (event.persisted) noBack();" onUnload="">

<center>
<span class="alert style2" ><h1 align="center"><font size="+3" color="#930093" face="Times New Roman,Times,serif"><b><i>ONLINE SHOPPING SYSTEM</i></b></font></h1>
</span>
<form action="btspgsup.SQLATTACK_USERDETAILS.VerifyUser" method="post">
<center><br><br><br><br><br><br>
<center><i><font size="5" color="#930093" face="Times New Roman,Times,serif"><b>SignIn</b></font></i></center>
<table cellspacing=0 cellpadding=0>
<tr align=left>
<td vAlign=top>
<div class="tab" >
<table class=tables cellspacing=0 cellpadding=10>
<tr>
<td class="ddpbar">Username:</td>
<td class="graybars">
<input type="text" name="username" class=textfield size="20"></td>
</tr>
<tr>
<td class="ddpbar">Password:</td>
<td class="graybg">
<input type="password" name="password1" class=textfield size="20"></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td align=right vAlign=bottom>
<input  type = submit name= click  value = login class=buttonm>
</td>
</tr>
</table>
 <a href="btspgsup.SQLATTACK_WEBPAGE.signUp"> <center><i><font size="5" color="#930093" face="Times New Roman,Times,serif"><b>SignUp</b></font></i></center></a>
</form>
</center>
</body>
</html>');
end indexpage;
procedure css
is
begin
htp.p('<style type="text/css">
   .graybars {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; BORDER-LEFT: #c2cbda 1px solid; COLOR: #000000; BORDER-BOTTOM: #c2cbda 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ecedf4
}
.textbox {
  BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; FONT-WEIGHT: normal; FONT-SIZE: 8pt; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif
}
.control {
  BORDER-RIGHT: 0px solid; BORDER-TOP: #000000 0px solid; MARGIN-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 8pt; BORDER-LEFT: 0px solid; COLOR: #032b9c; BORDER-BOTTOM: 0px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; HEIGHT: 16px; TEXT-ALIGN: left
}
.savepassword {
  BORDER-RIGHT: 0px solid; BORDER-TOP: #000000 0px solid; MARGIN-TOP: 0px; FONT-WEIGHT: bold; FONT-SIZE: 7pt; BORDER-LEFT: 0px solid; COLOR: #032b9c; BORDER-BOTTOM: 0px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; HEIGHT: 12px; TEXT-ALIGN: left
}
.Button {
  BORDER-RIGHT: #000000 1px ridge; BORDER-TOP: #000000 1px ridge; FONT-WEIGHT: bold; FONT-SIZE: 8pt; BORDER-LEFT: #000000 1px ridge; COLOR: #000000; BORDER-BOTTOM: #000000 1px ridge; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #9b9b9b; TEXT-DECORATION: none
}
.buttonm {
  BORDER-RIGHT: #eeeeee 1px solid; BORDER-TOP: #eeeeee 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 8pt; BORDER-LEFT: #7a7a7a 1px solid; CURSOR: hand; COLOR: #FFFFFF; BORDER-BOTTOM: #7a7a7a 1px solid; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR:#590059
}
.alert {
  FONT-WEIGHT: bold; font-style:italic; FONT-SIZE: 20pt; COLOR: #9900CC; FONT-FAMILY: Monotype Corsiva; TEXT-DECORATION: none
}
.star {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #cc0000; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
.ddpbar {
  FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: Tahoma; BACKGROUND-COLOR: #d5e1f4; TEXT-DECORATION: none
}
.copywrite {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #999999; FONT-FAMILY: Tahoma; TEXT-DECORATION: none
}
.graybg {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #eff0f7; TEXT-DECORATION: none
}
.textb {
  FONT-WEIGHT: bold; FONT-SIZE: 7.5pt; COLOR: #000000; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
.date {
  FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: #DEE7CA; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
.text {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #000000; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
A {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #174b85; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: underline
}
A:hover {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; COLOR: #ff0101; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; TEXT-DECORATION: none
}
SELECT {
  FONT-SIZE: 8pt; FONT-FAMILY: Tahoma, Arial, Helvetica, sans-serif
}
INPUT {
  FONT-SIZE: 8pt; FONT-FAMILY: Tahoma, Arial, Helvetica, sans-serif
}
.tables {
  BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; FONT-WEIGHT: normal; FONT-SIZE: 8pt; BORDER-LEFT: #000000 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif
}
DIV.tab {
  BORDER-RIGHT: #000000 1px solid; PADDING-RIGHT: 5px; BORDER-TOP: #ffffff 1px solid; PADDING-LEFT: 5px; PADDING-BOTTOM: 5px; BORDER-LEFT: #ffffff 1px solid; WIDTH: 100%; PADDING-TOP: 8px; BORDER-BOTTOM: #000000 1px solid; HEIGHT: 100%; BACKGROUND-COLOR: #590059
}
TABLE.tabInset {
  BORDER-RIGHT: #999999 1px solid; BORDER-TOP: black 1px solid; BORDER-LEFT: black 1px solid; BORDER-BOTTOM: #999999 1px solid; BACKGROUND-COLOR: #ffffff
}
.boxOff {
  BORDER-RIGHT: #999999 1px solid; BORDER-TOP: #999999 1px solid; FONT-WEIGHT: normal; FONT-SIZE: 8pt; MARGIN-BOTTOM: 5px; BORDER-LEFT: #999999 1px solid; BORDER-BOTTOM: #999999 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #cbcbcb
}
.boxOn {
  BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #6699cc 1px solid; FONT-WEIGHT: normal; FONT-SIZE: 8pt; MARGIN-BOTTOM: 5px; BORDER-LEFT: #6699cc 1px solid; COLOR: #ffffff; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #336699
}
.box {
  PADDING-RIGHT: 1px; PADDING-LEFT: 1px; FONT-WEIGHT: normal; FONT-SIZE: 8pt; PADDING-BOTTOM: 1px; WIDTH: 100%; CURSOR: hand; PADDING-TOP: 1px; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif
}
SPAN.tab {
  BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #ffffff 1px solid; PADDING-LEFT: 4px; FONT-SIZE: 8pt; BORDER-LEFT: #DEE7CA 1px solid; WIDTH: 73px; CURSOR: hand; FONT-FAMILY: Verdana; POSITION: relative;color: #DEE7CA
}
.on {
  FONT-WEIGHT: bold; FONT-SIZE: 8pt; PADDING-TOP: 2px; TOP: 1px; HEIGHT: 20px; BACKGROUND-COLOR: #407B61
}
.off {
  FONT-WEIGHT: bold; FONT-SIZE: 8pt; COLOR: #000000; PADDING-TOP: 1px; HEIGHT: 17px; BACKGROUND-COLOR: #c5c5d2
}
.csrbarTD {
  BORDER-RIGHT: #3f3f3f 1px solid; BORDER-TOP: #ffffff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 7.5pt; BORDER-LEFT: #ffffff 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #c5c5d2
}
.bluebars {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; BORDER-LEFT: #c2cbda 1px solid; COLOR: #000000; BORDER-BOTTOM: #c2cbda 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #e9e9ec
}
.csrbars {
  FONT-WEIGHT: normal; FONT-SIZE: 8pt; BORDER-LEFT: #cccccc 1px solid; COLOR: #000000; BORDER-BOTTOM: #cccccc 1px solid; FONT-FAMILY: Tahoma, Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #ffffff
}

.table_bluecell {background-color:#FFF4FF;  font-family:Verdana, Arial, Helvetica, sans-serif; color:#003000; font-size:11px; font-weight:normal;  border-right:1px solid #407B61; border-bottom:0px solid #777766;}

.textfield {border:1px solid #407B61; background-color:#fcfcf0; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; color:#000000; }

.table_whitecell {background-color:#fcfcf0; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000; font-size:10px; font-weight:normal;  border-right:0px solid #556F91; border-bottom:0px solid #556F91;}

.table_whitecell_2 {background-color:#fcfcf0; font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000; font-size:10px; font-weight:normal;  border-right:1px solid #556F91; border-bottom:0px solid #556F91;}

.button_class { border-width:1px;border-style:solid;background:#FFFFFF;font-family:Verdana, Arial, Helvetica, sans-serif; color:#000000; font-size:10px; font-weight:BOLD;}

.textarea {border:1px solid #333300; background-color:#ffffff; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px; color:#000000;}

.headingwhite {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px; color: #FFFFFF; text-decoration:none; font-weight: normal;}

.csrbarTD1 {
  BORDER-RIGHT: #3f3f3f 1px solid; BORDER-TOP: #ffffff 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 8pt; BORDER-LEFT: #ffffff 1px solid; COLOR: #000000; BORDER-BOTTOM: #000000 1px solid; FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif; BACKGROUND-COLOR: #c5c5d2
}

SPAN.tab1{
  BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #ffffff 1px solid; PADDING-LEFT: 4px; FONT-SIZE: 8pt; BORDER-LEFT: #ffffff 1px solid; FONT-WEIGHT: bold; WIDTH: 73px; PADDING-TOP: 2px; TOP: 1px; HEIGHT: 20px; BACKGROUND-COLOR: #b7b6d2; FONT-FAMILY: Verdana; POSITION: relative
}

div.scrollreport {  height: 240px;  width: 363px;  overflow: scroll;   border: 0px solid #666;  background-color: ;  padding: 0px;}
table.scrollreport {  height: 240px;  width: 363px;  overflow: scroll;   border: 0px solid #666;  background-color: ;  padding: 0px;}
div.scrollreport1 {  height: 252px;  width: 363px;  overflow:  scroll;  border: 0px solid #666;  background-color: ;  padding: 0px;}

div.scroll1 {  height: 263px;  overflow: scroll; border: 0px solid #666;  background-color: ;  padding: 0px;}
div.scrollRequest {  height: 200px;  overflow: auto; border: 0px solid #666;  background-color: ;  padding: 0px;}
div.scrollall {  height: 295px; width: 365px;  overflow: scroll;  border: 0px solid #666;  background-color: ;  padding: 0px;}

div.scrollallreport {  height: 330px; width: 365px;  overflow: scroll;  border: 0px solid #666;  background-color: ;  padding: 0px;}

div.scrollallreport1 {  height: 285px; width: 365px;  overflow: scroll;  border: 0px solid #666;  background-color: ;  padding: 0px;}

.buttonImg {
  width:85;
  height:23;');
  --background:url('images/button1.jpg');
  htp.p('background-repeat: no-repeat;
  FONT-WEIGHT: bold;
  COLOR: #EDF0B5;
  border : 0 px;
  FONT-FAMILY:Verdana, Arial, Helvetica, sans-serif;
  FONT-SIZE: 9pt;
  CURSOR: hand;
}
  </style>
');
end;
procedure loginPage is
begin
htp.p('<html>
<head>
<title>E - Logistics For Supply Chain Management</title>');
css;
htp.p('
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>

<SCRIPT LANGUAGE="javascript" >

function focus()
{
  document.form1.username.focus()

}
function checkuser()
{
if(document.form1.username.value.match("/^[0-9]+$/"))
{
alert("Enter number");
}
}
</SCRIPT>

</head>
<body bgcolor="#E2E2E2" onLoad="noBack();"
onpageshow="if (event.persisted) noBack();" onUnload="" onload="focus() ">

<center>  ');
htp.p('<font size="6" face="serif" color="9900FF"> SQL Manipulation');
htp.p('<form action="btspgsup.SQLATTACK_USERDETAILS.VerifyUser" method="post" name =form1>
<center><br><br><br><br><br><br><br><br>');
--<font style="color:#cc0000"><%=request.getAttribute("info")%></font>
htp.p('<table cellspacing=0 cellpadding=0>
<tr>
<td style="VERTICAL-ALIGN: bottom; HEIGHT: 25px" noWrap>
<span  class="tab on" style="WIDTH: 85px; TEXT-ALIGN: center" >Login</span></td>
</tr>
<tr align=left>
<td vAlign=top>
<div class="tab" >
<table class=tables cellspacing=0 cellpadding=10>
<tr>
<td class="ddpbar">Username:</td>
<td class="graybars"><input type="text" name="username"  class=textfield  onfocus = username onblur=checkuser()></td>
</tr>
<tr>
<td class="ddpbar">Password:</td>
<td class="graybg"><input type="password" name="password1" class=textfield></td>
</tr>
</table>
</div>
</td>
</tr>
<tr>
<td align=right vAlign=bottom>
<input  type = submit name= click value = login class=buttonm>
</td>
</tr>
</table>
<a href="btspgsup.SQLATTACK_WEBPAGE.signUp"> <center><i><font size="5" color="9900FF" face="Times New Roman,Times,serif"><b>SignUp</b></font></i></center></a>
</form>
</center>
</body>
</html>
');
/*exception when VALUE_ERROR then
htp.p('Enter user id as number');*/
end loginPage;

/*PROCEDURE initialisevar is
begin
  SQLATTACK_USERDETAILS.g_orderlist :=SQLATTACK_USERDETAILS.orderlist();
  SQLATTACK_USERDETAILS.g_cfplist:= SQLATTACK_USERDETAILS.cfplist();
  SQLATTACK_USERDETAILS.gv_order:=SQLATTACK_USERDETAILS.orderlist();
end initialisevar;*/
Procedure manager is
begin
htp.p('
<html>
<head>
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>
<title>E - Logistic For Supply Chain Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> ');
css;
htp.p('

<style type="text/css">
.btn {
        font-family:Times New Roman;
        background-color: #FFF4FF;
        border: 1px solid #590059;
        padding: 10px 10px 15px 20px;
        color: #9900FF;
        font-size: 25px;
                }
                </style>

</head>
<body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" onUnload="" bgcolor="#E2E2E2">
<p align="right">
 <a href="btspgsup.SQLATTACK_WEBPAGE.indexpage"><input type="button" class="btn" value="Logout" ></a></p>
 <p align="center">
<span class="alert style2">Welcome Manager</span></p>');
--sqlattack_webpage.searchorder;
htp.p('<table width="737" border="0" align="center">
 <form action="btspgsup.SQLATTACK_webpage.insertporductpage" method="post" name="form1">
        <tr class="table_bluecell">
         <td height="32" align="left" valign="middle" colspan="5"><p>
            <input  type="submit"  class="buttonm" value="Insert product Form"></td></form>
            </table>
      <table width="737" border="0" align="center">

    <form action="btspgsup.SQLATTACK_webpage.searchorder" method="post" name="form2">
        <tr class="table_bluecell">
         <td height="32" align="left" valign="middle" colspan="5"><p>
            <input  type="submit"  class="buttonm" value="Search Order status"></td></form>


  </table>');
htp.p('<p class="alert style2" align="center">Order List
</p>
<table width="738" height="52" border="0" align="center">
  <tr class="buttonm">
    <td width="83"><div align="center">Order Id </div></td>
    <td width="84"><div align="center">CustomerID</div></td>
    <td width="169"><div align="center">Product</div></td>
    <td width="169"><div align="center">Type</div></td>
    <td width="148"><div align="center">Product Name </div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="206"><div align="center">Destination</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
  SQLATTACK_USERDETAILS.getOrderDetails;
  for i in 1 .. SQLATTACK_USERDETAILS.G_ORDERLIST.count loop
  if SQLATTACK_USERDETAILS.g_orderlist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).order_id||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).CUSTOMER_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PRODUCT ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PROD_TYPE||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PNAME ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).QUNATITY||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).DESTINATION||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).STATUS ||'</td>
  </tr> ');
  end if;
  end loop;
htp.p('
</table>

<table width="738" height="52" border="0" align="center">
  <tr class="buttonm">
    <td width="83"><div align="center">Cfp Id </div></td>
    <td width="84"><div align="center">Order ID</div></td>
    <td width="169"><div align="center">Supplier ID</div></td>
    <td width="148"><div align="center">Product</div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
  SQLATTACK_USERDETAILS.getCfpDetails;
  for i in 1 .. SQLATTACK_USERDETAILS.g_cfplist.count loop
  if SQLATTACK_USERDETAILS.g_cfplist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).CFP_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).ORDER_ID    ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).SUPPLIER_ID  ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).PRODUCT     ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).QUANTITY     ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).STATUS      ||'</td>
  </tr> ');
  end if;
  end loop;
htp.p('
</table>
<p>;</p>
</body>
</html>
');
end manager;
procedure customer(customer_name varchar2 default null) is
begin
htp.p('
<html>
<head>
<title>E - Logistic For Supply Chain Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> ');

css;
htp.p('
<SCRIPT language="JavaScript" type="text/javascript">');

htp.p('function addType()
  {var formObject = document.form1
var indexList = formObject.product.selectedIndex
var a=1
');
            for i in (select distinct product_name,subtype1 from Product_master_tab
           ) loop
htp.p('
formObject.type1.value="default_value"
if((formObject.product.options[indexList].value)==("'||i.product_name||'"))
{ ');

htp.p('
  //formObject.type.options[0]=new Option("","Select Type")
  formObject.type1.options[a]=new Option("'||i.subtype1||'","'||i.subtype1||'")
  a=a+1');
htp.p('}
');

end loop;
htp.p('
formObject.type1.options[0].selected = true
  alert("Hi Every One");
}

function addProduct()
{
var formObject = document.form1
var indexList = formObject.product.selectedIndex
var indexList1 = formObject.type1.selectedIndex
var b=1
var number = /^[0-9]+$/;
');

  for i in (select distinct product_name,subtype1,prod_model from Product_master_tab
           ) loop

htp.p('
formObject.pname.value="default"
if((formObject.product.options[indexList].value)==("'||i.product_name||'") &
(formObject.type1.options[indexList1].value)==("'||i.subtype1||'"))
{ ');
htp.p('
  //formObject.pname.options[0]=new Option("","Select Type")
  formObject.pname.options[b]=new Option("'||i.prod_model||'","'||i.prod_model||'")
  b=b+1');
htp.p('}
');

end loop;
htp.p('formObject.pname.options[0].selected = true

}

function changeImage()
{
var formObject = document.form1
var indexList = formObject.pname.selectedIndex
document.images["theImage"].src = "images/"+formObject.pname.options[indexList].value + ".jpg"
}

function check(quantity,msg)
{
var formObject = document.form1
var indexList = formObject.product.selectedIndex
var indexList = formObject.type1.selectedIndex
var indexList = formObject.pname.selectedIndex
var numeric = /^[0-9]+$/
var valid

if((formObject.product.options[indexList].value)== ("Select Product"))
{
alert("Select The Product option")
valid = false
}

else if((formObject.type1.options[indexList].value) == ("Select Type"))
{
alert("Select The Type Field")
valid = false
}

else if((formObject.pname.options[indexList].value) == ("Select Product Name"))
{
alert("Select The Product Name Field")
valid = false
}

else if((formObject.quantity.value) == (""))
{
alert("Enter Quantity Field")
valid = false
}

else if((formObject.destination.value) == (""))
{
alert("Enter Destination Field")
valid = false
}

else if(formObject.quantity.value.match(numeric))
{
valid = true
return valid
}
else
{
alert(msg)
valid = false
}
return valid
}

</SCRIPT>
<style type="text/css">
<!--
.style2 {font-size: 20pt; font_weight:bold;}
-->
</style>
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>
<style type="text/css">
.btn {
        font-family:Times New Roman;
        background-color: #FFF4FF;
        border: 1px solid #590059;
        padding: 10px 10px 15px 20px;
        color: #9900FF;
        font-size: 25px;
                }
                </style>

</head>

<body onLoad="noBack();"
onpageshow="if (event.persisted) noBack();" onUnload="" bgcolor="#E2E2E2">
 ');
htp.p('<center><font size="6" face="serif" color="#930093"> Code Injection </center></br>');
htp.p('
<p align="center">
<span class="alert style2">Welcome Customer</span></p>
<p align="right">
 <a href="btspgsup.SQLATTACK_WEBPAGE.indexpage"><input type="button" class="btn" value="Logout" ></a></p>

  <table width="737" border="0" align="center">
      <form action="btspgsup.SQLATTACK_USERDETAILS.PlaceOrder" method="post" name="form1">
    <tr>
      <td colspan="4" class="buttonm">Customer Order Form </td>
    </tr>
    <tr class="table_bluecell">
      <td height="32" align="left" valign="middle"><p>
        <select name="product" class="textfield" onChange="addType()" >');
        htp.p('<option>Select Product</option>');
           for i in (select distinct Product_name from Product_master_tab) loop
            htp.p('<option value="'||i.product_name||'">'||i.product_name||'</option>
            ');
            end loop;
       htp.p(' </select>
      </p>      </td>
      <td>
      <select name="type1" class="textfield" onChange="addProduct()">
        <option>Select Type</option>
      </select></td>
      <td>;</td>
      <td>;</td>
    </tr>
    <tr class="table_bluecell">
      <td rowspan="2" align="left" valign="middle" align="center">
      <img name="theImage" src="blank.gif" width="100" height ="100" >
      </td>
      <td height="36">
      <select name="pname" class="textfield" onChange="changeImage()">
      <option>Select Product Name</option>
      </select></td>
      <td>Quantity</td>
      <td><input name="quantity" type="text" class="textfield" size="3" id ="quantity"></td>
      </tr>
      <tr class="table_bluecell">
      <td height="35">;</td>
      <td class="table_bluecell">Destination</td>
      <td>
      <input name="destination" type="text" class="textfield" size="20"></td>
      </tr>
       <INPUT TYPE="HIDDEN" NAME="customer_name" VALUE="'||customer_name||'"  >
      <tr class="table_bluecell">

      <td><input  type="submit"  onclick="return check(document.getElementById("quantity"),"Eneter Vaild Quantity");" class="buttonm" value="Submit"></form>
      <form method="post" action="btspgsup.SQLATTACK_webpage.LoginPage" name="form2">
     </td></form>
 </tr>
  </table>

<p class="alert style2" align="center">Previous Order List</p>
<table width="738" height="52" border="0" align="center">
  <tr class="buttonm">
    <td width="83"><div align="center">Order Id </div></td>
    <td width="84"><div align="center">CustomerID</div></td>
    <td width="169"><div align="center">Product</div></td>
    <td width="169"><div align="center">Type</div></td>
    <td width="148"><div align="center">Product Name </div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="206"><div align="center">Destination</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
  SQLATTACK_USERDETAILS.getOrderDetails(customer_name);
  for i in 1 .. SQLATTACK_USERDETAILS.G_ORDERLIST.count loop
  if SQLATTACK_USERDETAILS.g_orderlist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).order_id||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).CUSTOMER_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PRODUCT ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PROD_TYPE||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PNAME ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).QUNATITY||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).DESTINATION||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).STATUS ||'</td>
  </tr> ');
  end if;
  end loop;
htp.p('
</table>
</body>
</html>');
end customer;
procedure supplier is
begin
htp.p('
<html>
<head>
<title>E - Logistic For Supply Chain Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">');
css;
htp.p('
<style type="text/css">
<!--
.style1 {font-size: 12pt;  FONT-WEIGHT: bold;}
-->
</style>
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>
<style type="text/css">
.btn {
        font-family:Times New Roman;
        background-color: #FFF4FF;
        border: 1px solid #590059;
        padding: 10px 10px 15px 20px;
        color: #9900FF;
        font-size: 25px;
                }
                </style>


</head>

<body onLoad="noBack();"
onpageshow="if (event.persisted) noBack();" onUnload="" bgcolor="#E2E2E2">
');
SQLATTACK_USERDETAILS.getCfpDetails;
if (SQLATTACK_USERDETAILS.g_cfplist.count>0) then
htp.p('<p class="alert style1" >Welcome Supplier </p>
<p align="right">
<a href="btspgsup.SQLATTACK_WEBPAGE.indexpage"><input type="button" class="btn" value="Logout" ></a></p>
<p class="alert style1" align="center">Call For Proposals </p>
<table width="738" height="52" border="0" align="center">
  <tr class="buttonm">
    <td width="83"><div align="center">Cfp Id </div></td>
    <td width="84"><div align="center">Order ID</div></td>
    <td width="169"><div align="center">Supplier ID</div></td>
    <td width="148"><div align="center">Product</div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
/*  <%  for( int i=0;i< al.size();i++)
  {
  CfpAgent CB=(CfpAgent)al.get(i);

  %>
  <tr class="table_bluecell">
    <td><%=CB.getCfp_id()%></td>
    <td><%=CB.getOrder_id()%></td>
    <td><%=CB.getSupplier_id()%></td>
    <td><%=CB.getProduct()%></td>
    <td><%=CB.getQuantity()%></td>
    <td><% if((CB.getStatus()).equals("waiting")) { %><a href="SQLATTACK_USERDETAILS.AcceptOrder?index=<%=CB.getOrder_id()%>"><%=CB.getStatus()%></a><% } else { %><%=CB.getStatus()%><% } %></td>
  </tr>
<%}
}
%>*/

  for i in 1 .. SQLATTACK_USERDETAILS.g_cfplist.count loop
  if SQLATTACK_USERDETAILS.g_cfplist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).CFP_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).ORDER_ID    ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).SUPPLIER_ID  ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).PRODUCT     ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_cfplist(i).QUANTITY     ||'</td>
    <td>');
        if SQLATTACK_USERDETAILS.g_cfplist(i).STATUS = 'waiting'  then
   htp.p('<a href="btspgsup.SQLATTACK_USERDETAILS.AcceptOrder?inde='||SQLATTACK_USERDETAILS.g_cfplist(i).ORDER_ID ||'">'
   ||SQLATTACK_USERDETAILS.g_cfplist(i).STATUS
    ||'</a>');
    else

         htp.p(SQLATTACK_USERDETAILS.g_cfplist(i).STATUS||'</td>
  </tr> ');
end if;
end if;
end loop;
else
htp.p('U have no orders to accept');
end if;
IF SQLATTACK_USERDETAILS.gv_order.EXISTS(1) THEN
htp.p('</table>

 <p class="alert style1" align="center">Order Details

 <form name="form1" method="post" action="btspgsup.SQLATTACK_USERDETAILS.AcceptOrder">
 <input name="index1" type="hidden" value="'||SQLATTACK_USERDETAILS.gv_order(1).order_id||'">
 <table width="718" border="0" align="center">
   <tr>
     <td width="207" class="buttonm">Order ID </td>
     <td width="495" class="table_bluecell" >'||SQLATTACK_USERDETAILS.gv_order(1).order_id||'</td>
   </tr>
   <tr>
     <td class="buttonm">Customer ID</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).CUSTOMER_id||'</td>
   </tr>
   <tr>
     <td class="buttonm">Product</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PRODUCT||'</td>
   </tr>
   <tr>
     <td class="buttonm">Type</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PROD_TYPE||'</td>
   </tr>
   <tr>
     <td class="buttonm">Product Name</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PNAME||'</td>
   </tr>
   <tr>
     <td class="buttonm">Quantity</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).QUNATITY||'</td>
   </tr>
   <tr>
     <td class="buttonm">Destination</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).DESTINATION||'</td>
   </tr>
   <tr>
     <td class="buttonm">Status</td>
     <td class="table_bluecell">
       <select name="selec">
         <option selected>Accept</option>
         <option>Deny</option>
       </select>
       <input type="submit"  value="Submit">
     </td>
   </tr>
</table>
</form>

</body>
</html>');
END IF;
end supplier;
procedure logistics is
begin
htp.p('
<html>
<head>
<title>E - Logistic For Supply Chain Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">');
css;
htp.p('
<style type="text/css">
<!--
.style1 {font-size: 10pt}
-->
</style>
<SCRIPT type="text/javascript">
window.history.forward();
function noBack()
{
window.history.forward();
}
</SCRIPT>
<style type="text/css">
.btn {
        font-family:Times New Roman;
        background-color: #FFF4FF;
        border: 1px solid #590059;
        padding: 10px 10px 15px 20px;
        color: #9900FF;
        font-size: 25px;
                }
                </style>

</head>

<p class="alert style1">Welcome Logistic - Supplier</p>
<body onLoad="noBack();"
onpageshow="if (event.persisted) noBack();" onUnload="" bgcolor="#E2E2E2">');
  SQLATTACK_USERDETAILS.getOrderDetails;
  if SQLATTACK_USERDETAILS.G_ORDERLIST.count !=0 then
  htp.p('
<p class="alert style1">Order Details </p>
<p align="right">
<a href="btspgsup.SQLATTACK_WEBPAGE.indexpage"><input type="button" class="btn" value="Logout" ></a></p>
<table width="738" height="52" border="0">
<table width="738" height="52" border="0">
  <tr class="buttonm">
    <td width="83"><div align="center">Order Id </div></td>
    <td width="84"><div align="center">CustomerID</div></td>
    <td width="169"><div align="center">Product</div></td>
    <td width="169"><div align="center">Type</div></td>
    <td width="148"><div align="center">Product Name </div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="206"><div align="center">Destination</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
  for i in 1 .. SQLATTACK_USERDETAILS.G_ORDERLIST.count loop
  if SQLATTACK_USERDETAILS.g_orderlist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).order_id||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).CUSTOMER_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PRODUCT ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PROD_TYPE||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PNAME ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).QUNATITY||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).DESTINATION||'</td><td>');
      if SQLATTACK_USERDETAILS.g_orderlist(i).STATUS = 'Accept'  then
   htp.p('<a href="btspgsup.SQLATTACK_USERDETAILS.MoveOrder?inde='||SQLATTACK_USERDETAILS.g_orderlist(i).ORDER_ID ||'">'
   ||SQLATTACK_USERDETAILS.g_orderlist(i).STATUS
    ||'</a></td>');
    else

         htp.p(SQLATTACK_USERDETAILS.g_orderlist(i).STATUS||'</td>
  </tr> ');
end if;
  end if;
  end loop;

else
htp.p('<p class="alert">Sorry, You have no orders to move</p>
</table>');
end if;
IF SQLATTACK_USERDETAILS.gv_order.EXISTS(1) THEN
htp.p('hi');
 htp.p('<p class="alert style1">Order Details </p>
 <form name="form1" method="post" action="btspgsup.SQLATTACK_USERDETAILS.MoveOrder">
 <input name="index1" type="hidden" value="'||SQLATTACK_USERDETAILS.gv_order(1).order_id||'">
 <table width="718" border="0">
   <tr>
     <td class="buttonm">Customer ID</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).CUSTOMER_id||'</td>
   </tr>
   <tr>
     <td class="buttonm">Product</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PRODUCT||'</td>
   </tr>
   <tr>
     <td class="buttonm">Type</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PROD_TYPE||'</td>
   </tr>
   <tr>
     <td class="buttonm">Product Name</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).PNAME||'</td>
   </tr>
   <tr>
     <td class="buttonm">Quantity</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).QUNATITY||'</td>
   </tr>
   <tr>
     <td class="buttonm">Destination</td>
     <td class="table_bluecell">'||SQLATTACK_USERDETAILS.gv_order(1).DESTINATION||'</td>
   </tr>
   <tr>
   <tr>
     <td class="buttonm">Status</td>
     <td class="table_bluecell">
       <select name="selec">
         <option selected>Send</option>
         <option>Reject</option>
       </select>
       <input type="submit"  value="Submit">
     </td>
   </tr>
</table>

</form>
<%
    } %>

</body>
</html>');
end if;
end logistics;
procedure searchorder is
heading varchar2(300) :=null;
begin

htp.p('<html>
<head>');
css;
htp.p('

<SCRIPT language="JavaScript" type="text/javascript">');

htp.p('function changeHeading()
  {
alert(hi);
var formObject = document.form1
var indexList = formObject.search_field.selectedIndex
if((formObject.search_field.options[indexList].value)=="ORDER_ID")
{ ');
heading := 'Function Call Injection';
htp.p('}');
htp.p('if((formObject.search_field.options[indexList].value)=="CUSTOMER_ID")
{ ');
heading := 'Access Secured Information';
htp.p('}
');
htp.p('
formObject.search_field.options[0].selected = true
}
</script>');
htp.p('<style type="text/css">
<!--
.style2 {font-size: 20pt;
font weight:bold;}
-->
</style>
</head>
<body bgcolor="#E2E2E2">');
htp.p('<center><font size="6" face="serif" color="700000">'|| heading ||'</center></br>');
htp.p('
<span class="alert style2">Welcome Manager</span>

  <table width="737" border="0">
      <form action="btspgsup.SQLATTACK_USERDETAILS.SearchOrder" method="post" name="form1">
    <tr>
      <td colspan="4" class="buttonm">Search Order Form </td>
    </tr>
    <tr class="table_bluecell">
      <td height="32" align="left" valign="middle"><p>
        <select name="search_field" class="textfield"  onChange="changeHeading()">
            <option>Select Search Feild</option>
            <option value="ORDER_ID">Order Id</option>
            <option value="CUSTOMER_ID">Customer id</option>
            <option value="PRODUCT">Product</option>
            <option value="PROD_TYPE">Product type</option>
        </select>
      </p>      </td>
      <td>Enter Value</td>
      <td><input name="fieldvalue" type="text" class="textfield" size="20" id ="fieldvalue"></td>


      <td><input type="Submit"  onclick="return check(document.getElementById("quantity"),"Enter Vaild Quantity");" class="buttonm" value="Submit"></form>
      <form method="post" action="btspgsup.SQLATTACK_webpage.manager" name="form2">
      <input value ="Back" type="submit" class="buttonm" ></td></tr></form>
 </tr>
  </table>');

if SQLATTACK_USERDETAILS.G_ORDERLIST.count>0 then
htp.p('<p class="alert style2">Order</p>
<table width="738" height="52" border="0">
  <tr class="buttonm">
    <td width="83"><div align="center">Order Id </div></td>
    <td width="84"><div align="center">CustomerID</div></td>
    <td width="169"><div align="center">Product</div></td>
    <td width="169"><div align="center">Type</div></td>
    <td width="148"><div align="center">Product Name </div></td>
    <td width="73"><div align="center">Quantity</div></td>
    <td width="206"><div align="center">Destination</div></td>
    <td width="120"><div align="center">Status</div></td>
  </tr>');
 --SQLATTACK_USERDETAILS.getOrderDetails;
  for i in 1 .. SQLATTACK_USERDETAILS.G_ORDERLIST.count loop
  if SQLATTACK_USERDETAILS.g_orderlist.exists(i) then
    htp.p('<tr class="table_bluecell">
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).order_id||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).CUSTOMER_ID||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PRODUCT ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PROD_TYPE||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).PNAME ||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).QUNATITY||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).DESTINATION||'</td>
    <td>'||SQLATTACK_USERDETAILS.g_orderlist(i).STATUS ||'</td>
  </tr> ');
  end if;
  end loop;
  else
  htp.p('You have no orders');
  end if;
end searchorder;
procedure insertporductpage is
begin
htp.p('
<html>
<head>
<title>E - Logistic For Supply Chain Management</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"> ');

css;
htp.p('

</head>
<body bgcolor="#E2E2E2">
 ');
htp.p('<center><font size="6" face="serif" color="700000"> Code Injection </center></br>');
htp.p('<table width="737" border="0">
 <form action="btspgsup.SQLATTACK_USERDETAILS.insertproduct" method="post" name="form1">
        <tr>
      <td colspan="6" class="buttonm">Insert product Form </td>
    </tr>
 <tr class="table_bluecell">
 <td colspan="3" height="32" align="left" valign="middle"><p>
    Product Name
      <td height="32" align="left" valign="middle" colspan="3"><p>
        <input type="text" name="productname" class="textfield"  >
      </td>
       </tr>

      <tr class="table_bluecell">
      <td colspan="3" height="32" align="left" valign="middle"><p>
      Product Type
      <td height="32" align="left" valign="middle" colspan="3"><p>
      <input type="text" name="subtype1" class="textfield" >
        </td>
    </tr>

    <tr class="table_bluecell">
      <td height="32" align="left" valign="middle" colspan="3"><p>
      Product Model
      <td height="32" align="left" valign="middle" colspan="2"><p>
      <input name="prodmodel" type="text" class="textfield"  ></td>
            <td><input  type="submit"  class="buttonm" value="Submit"></form>
      <form method="post" action="btspgsup.SQLATTACK_webpage.manager" name="form2">
      <input type="submit"  class="buttonm" value="Back"></td></form>
      </tr>

      <td></td>
      <td></td>
      <td></td>

  </table>
  </body>
  </html>');

end insertporductpage;
end SQLATTACK_WEBPAGE;
/
