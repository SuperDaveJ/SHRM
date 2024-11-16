<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Human Resources Assistant</title>


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
	<%end if%>	
        <tr>
          <td valign="top"><p class="main">Human Resources Assistant </p>
            <p>The Human Resources Assistant is responsible for providing administrative support to the Compensation and Benefits department.  This may include employment, personnel records, compensation management, and benefits administration.  S/he relies primarily on instructions and pre-established guidelines to perform the functions of the job. There are a number of administrative tasks that are also required such as data entry, maintaining records and filing. <br />
              <br />
              <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Human Resources Assistant. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
<%if strActionPlan <> 0 Then%>     
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td><span class="sub">Required Experience</span><br />
		          <br /><p>
		            <%IF rstSimple.Fields("UserMaxEducation").Value < 2 Then%>
  <span class="style1 style2 style3">o</span>
  <%Else%>
  <span class="style1 style3">&thorn;</span>
  <% End If %>
		            Associates Degree <br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 2 Then%>
  <span class="style1 style2 style3">o</span>
  <%Else%>
  <span class="style1 style3">&thorn;</span>
  <% End If %>
		            2 years of administrative experience <br />
  <span class="style1 style2 style3">o</span> Strong written and verbal communication skills<br />
  <span class="style1 style2 style3">o</span> Strong attention to detail<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
  <span class="style1 style2 style3">o</span>
  <%Else%>
  <span class="style1 style3">&thorn;</span>
  <% End If %>
		            Bachelors degree<br />
  <span class="style1 style2 style3">o</span> Preferred experience with a database similar to an HRIS system<br />
  <span class="style1 style2 style3">o</span> Payroll experience </td>
              </tr>
	        </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
		      <tr>
		        <td><span class="sub">Required Experience</span><br />
		          <br /><p>
  <span class="style1 style2 style3">o</span>
		            Associates Degree <br />
  <span class="style1 style2 style3">o</span>
		            2 years of administrative experience <br />
  <span class="style1 style2 style3">o</span> Strong written and verbal communication skills<br />
  <span class="style1 style2 style3">o</span> Strong attention to detail<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1 style2 style3">o</span>
		            Bachelors degree<br />
  <span class="style1 style2 style3">o</span> Preferred experience with a database similar to an HRIS system<br />
  <span class="style1 style2 style3">o</span> Payroll experience </td>
              </tr>
	        </table>
<% End If %>	
	  
          <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities<br />
            <br />
            </span>In this position, the job  duties and responsibilities may include:<span class="sub"><br />
              </span><br />
            &nbsp;&nbsp;&nbsp;&#9642; Enters new hires into benefit enrollment plans<br />
            &nbsp;&nbsp;&nbsp;&#9642; Assists with annual open enrollment for medical benefits and quarterly for 401K <br />
            &nbsp;&nbsp;&nbsp;&#9642; Maintains employee status for disability and family leave<br />
            &nbsp;&nbsp;&nbsp;&#9642; Updates HR tracking systems <br />
            &nbsp;&nbsp;&nbsp;&#9642; Reconciles the benefits statements <br />
            &nbsp;&nbsp;&nbsp;&#9642; Conducts audits of various payroll, benefits, or other HR programs and recommends any corrective action<br />
            &nbsp;&nbsp;&nbsp;&#9642; Makes photocopies, faxes documents and performs other clerical functions<br />
            &nbsp;&nbsp;&nbsp;&#9642; Files papers and documents into appropriate employee files<br />
            &nbsp;&nbsp;&nbsp;&#9642; Provides confidential administrative support <br />
            <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
            <br />
            This role requires the Human Resources Assistant to interact with a variety of people and departments, which may include:<br />
            <br />
            &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to help answer questions<br />
            &nbsp;&nbsp;&nbsp;&#9642; Compensation and Benefits Department to receive direction, coaching and feedback and provide support</p>
            <p><span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated within the role of the Human Resources Assistant may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Remaining flexible when handling changing priorities <br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining confidentiality of employee information when dealing with sensitive matters<br />
            &nbsp;&nbsp;&nbsp;&#9642; Handling multi-tasking and remaining very detail oriented</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Human Resource Assistant:<br />
              <br />
              Personal Credibility: <br />
              &nbsp;&nbsp;&nbsp;&#9642; Achieving Results <br />
              &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
              &nbsp;&nbsp;&nbsp;&#9642; Flexibility 
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
              <br />
              HR Delivery:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Cooperation<br />
              &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance <br />
              <br />
              Business Knowledge:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Customer Focus<br />
              <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the 
              <%IF rstSimple.Fields("UserOrganizationSize").Value = 1 Then%>
              <a href="http://www.elearning.shrm.org/HRAssist_Small_Development.aspx" target="_blank">Developmental Opportunities</a>
			  <% End If %>
              <%IF rstSimple.Fields("UserOrganizationSize").Value = 2 Then%>
              <a href="http://www.elearning.shrm.org/midhrassist_development.aspx" target="_blank">Developmental Opportunities</a>
              <%Else%>
              <a href="http://www.elearning.shrm.org/largehrassist_development.aspx" target="_blank">Developmental Opportunities</a>
              <% End If %>
              page of  the SHRM HR Career Guide for a complete listing of opportunities and resources  to help you prepare for this position. <br />
              The Developmental Opportunities provide you with the  most pertinent information specific to this role.&nbsp; These opportunities include:<br /> 
  <br />
              
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Academy<br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM A-Z Index
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; HR Certification
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Conferences
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM e-Learning
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Foundation
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM Seminar Series
              <br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#9642; SHRM&nbsp;Store<br />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more
              
  <br />
            </p>
            </td>
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
