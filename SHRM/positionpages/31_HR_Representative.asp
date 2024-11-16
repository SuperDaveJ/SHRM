<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Human Resources Representative Assistant to VP</title>


<link href="css/shrm_style.css" rel="stylesheet" type="text/css" />


<link href="css/shrm_style.css" rel="stylesheet" type="text/css" />
</head>

<%
Set cnn = Server.CreateObject("ADODB.Connection")
cnn.open "PROVIDER=SQLOLEDB;DATA SOURCE=owbsr01;UID=root;PWD=shrm;DATABASE=SHRM_STATIC_INFO"
%> 
 
<%
' Declare our variables... always good practice!
Dim cnnSimple  ' ADO connection
Dim rstSimple  ' ADO recordset
Dim strQuery   ' ADO Query
Dim strUserID
Dim strUserName
Dim strActionPlan
Dim strDBPath  ' path to our Access database (*.mdb) file


' MapPath of virtual database file path to a physical path.
' If you want you could hard code a physical path here.
strDBPath = Server.MapPath("db_scratch.mdb")


' Create an ADO Connection to connect to the scratch database.
' We're using OLE DB but you could just as easily use ODBC or a DSN.
Set cnnSimple = Server.CreateObject("ADODB.Connection")

' This line is for the Access sample database:
'cnnSimple.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & strDBPath & ";"

' We're actually using SQL Server so we use this line instead:
cnnSimple.Open "Provider=SQLOLEDB;Data Source=owbsr01;" _
	& "Initial Catalog=SHRM_STATIC_INFO;User Id=root;Password=shrm;" _
	& "Connect Timeout=15;Network Library=dbmssocn;"


' Execute a query using the connection object.  It automatically
' creates and returns a recordset which we store in our variable.
strActionPlan = 0
strActionPlan = request.QueryString("actionplan")
strUserID = request.QueryString("code")
strUserName = request.QueryString("name")
if strUserID <>"" Then
	strQuery = "SELECT * FROM tblUserData WHERE UserID='" & strUserID & "' AND UserLastName = '" & strUserName & "'"
	Set rstSimple = cnnSimple.Execute(strQuery)
end if

' Display a table of the data in the recordset.  We loop through the
' recordset displaying the fields from the table and using MoveNext
' to increment to the next record.  We stop when we reach EOF.
%>

<body>
<table width="770" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="76" valign="top"><img src="images/banner.jpg" width="770" height="75" /></td>
  </tr>
  <tr>
    <td class="back" "valign="top" nowrap="nowrap" background="images/bkgrd_image.jpg"><br />
      <table width="86%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
       <%if strActionPlan <> 0 Then%> 
		<tr>
          <td valign="top" align="center"><p class="main2">Personalized Career Plan for <%= rstSimple.Fields("UserLastName").Value %> </p>
          <br /></td>
	    </tr>
	<%End If%>
        <tr>
          <td valign="top"><p class="main">Human Resources Representative/ Assistant to VP</p>
            <p><span class="sub">Description of the Role</span><br />
              <br />
            The HR Representative is responsible for administrative support for Vice-President of HR and generalized Human Resources administrative support. The major areas of support include, but are not limited to:&nbsp; confidential duties for the VP of HR, maintaining policies and procedures files, assisting in development of reports, presentations, and communications.</p>
            <a name="prep" id="prep"></a>
            <%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Preparation for the Role</span><br />
                  <br />
                  The following experience and recommended qualifications have been cited as useful for preparation as a HR Representative. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:<br />
  <br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 2 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Associates degree<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 3 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  3-5 years previous executive assistant experience or high-level administrative <br />
  &nbsp;&nbsp;&nbsp; experience <br />
  <span class="style1">o</span> Preferred experience in Human Resources <br />
  <span class="style1">o</span> Effective verbal and written communication skills <br />
  <span class="style1">o</span> Exceptional planning and organizational skills <br />
  <span class="style1">o</span> Knowledgeable in use of the Internet and common computer software<br />
  <span class="style1">o</span> Excellent interpersonal, organizational and customer service skills </td>
              </tr>
            </table>
	<%Else%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Preparation for the Role</span><br />
                  <br />
                  The following experience and recommended qualifications have been cited as useful for preparation as a HR Representative. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:<br />
  <br />
  <span class="style1">o</span>
                  Associates degree<br />
  <span class="style1">o</span>
 
                  3-5 years previous executive assistant experience or high-level administrative <br />
  &nbsp;&nbsp;&nbsp; experience <br />
  <span class="style1">o</span> Preferred experience in Human Resources <br />
  <span class="style1">o</span> Effective verbal and written communication skills <br />
  <span class="style1">o</span> Exceptional planning and organizational skills <br />
  <span class="style1">o</span> Knowledgeable in use of the Internet and common computer software<br />
  <span class="style1">o</span> Excellent interpersonal, organizational and customer service skills </td>
              </tr>
            </table>
<% End If %>			
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
  &nbsp;&nbsp;&nbsp;&#9642; Complete executive offer and decline letters as requested. <br />
  &nbsp;&nbsp;&nbsp;&#9642; Gather and compile statistical data for reports and create Excel spreadsheets and/or PowerPoint presentations<br />
  &nbsp;&nbsp;&nbsp;&#9642; Schedule meetings and make travel arrangements <br />
            </p>
            <p><span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the HR Representative to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Vice-President of Human Resources to provide support and receive direction <br />
              &nbsp;&nbsp;&nbsp;&#9642; Directors in HR  to provide support as needed<br />
              &nbsp;&nbsp;&nbsp;&#9642; CHRO as a conduit for information to the VP of HR<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the HR Representative may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling sudden lack of resources, scheduling difficulties, etc<br />
            &nbsp;&nbsp;&nbsp;&#9642; Managing multiple priorities</p>
            <p><span class="sub"><a name="key" id="key"></a>Key Behavioral Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Human Resources Representative<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
              &nbsp;&nbsp;&nbsp;&#9642; Initiative<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Cooperation<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organization and Efficiency Skills          </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largehrrep_development.aspx" target="_blank">Developmental Opportunities</a>
              
              page of  the SHRM HR Career Guide for a complete listing of opportunities and resources  to help you prepare for this position. <br />
              The Developmental Opportunities provide you with the  most pertinent information specific to this role.&nbsp; These opportunities include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Academy<br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM A-Z Index <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; HR Certification <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Conferences <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM e-Learning <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Foundation <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Seminar Series <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM&nbsp;Store<br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more<br />
            </p>
            <p class="main">&nbsp;</p>          </td>
        </tr>
        </table>
    <table width="78%" height="100%" border="1" align="center" cellpadding="4" cellspacing="0" bordercolor="#666666">
      <tr>
        <td valign="top"><p>The SHRM HR  Career Guide tool is intended to help SHRM members assess where they are in  their HR <br />
          career, where they should realistically expect to head next, and how  SHRM can help them get there.&nbsp; <br />
          No tool such as this can by itself  guarantee success for all users. But the SHRM HR Career Guide should <br />
          be a  helpful resource for SHRM members as they navigate their career paths.</p>
            <p>Copyright &copy; 2006, Society for Human Resource Management &bull; SHRM Privacy Statement</p></td>
      </tr>
    </table>    </td>
  </tr>
</table>

<div align="center"></div>
</body>
</html>
