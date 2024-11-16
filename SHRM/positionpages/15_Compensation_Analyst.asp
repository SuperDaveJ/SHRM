<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Compensation Analyst</title>


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
          <td valign="top"><p class="main">Compensation Analyst </p>
            <p>The Compensation Analyst is responsible for assisting and supporting the development, implementation and administration of compensation policies and procedures throughout the organization.  S/he will be required to undertake and interpret market-pricing analysis, develop salary recommendations, review and produce job descriptions. <br />
              <br />
              <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Compensation Analyst. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:</p>
<%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR Management, <br />
  &nbsp;&nbsp;&nbsp; Finance/Economics, Statistics or related field<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 3 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  At least 3 years of work experience in compensation <br />
  <span class="style1">o</span> Knowledge of compensation and benefit practices within the region<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> Excellent analytical skills and ability to maintain confidentiality <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span> HRIS experience and extensive experience with spreadsheets<br />
  <%IF rstSimple.Fields("UserCert_PHR").Value = "yes" OR rstSimple.Fields("UserCert_SPHR").Value = "yes" OR rstSimple.Fields("UserCert_CCP").Value = "yes" Then%>
  <span class="style1">&thorn;</span>
  <%Else%>
  <span class="style1">o</span>
  <% End If %>
                PHR/SPHR or CCP preferred</td>
              </tr>
            </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR Management, <br />
  &nbsp;&nbsp;&nbsp; Finance/Economics, Statistics or related field<br />
  <span class="style1">o</span>
                  At least 3 years of work experience in compensation <br />
  <span class="style1">o</span> Knowledge of compensation and benefit practices within the region<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> Excellent analytical skills and ability to maintain confidentiality <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span> HRIS experience and extensive experience with spreadsheets<br />
  <span class="style1">o</span> PHR/SPHR or CCP preferred</td>
              </tr>
            </table>
  <% End If %>
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Design, develop, implement and administer compensation program<br />
              &nbsp;&nbsp;&nbsp;&#9642; Consult with HR staff and line managers regarding compensation matters<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conduct ad-hoc pay analysis projects<br />
              &nbsp;&nbsp;&nbsp;&#9642; Job evaluation/market pricing and grade assignments<br />
              &nbsp;&nbsp;&nbsp;&#9642; Participate and evaluate the results of relevant salary surveys<br />
              &nbsp;&nbsp;&nbsp;&#9642; Research, collect and analyze internal and external data<br />
              &nbsp;&nbsp;&nbsp;&#9642; Monitor compliance in accordance with policies<br />
            &nbsp;&nbsp;&nbsp;&#9642; Review proposed salary adjustments</p>
            <p><span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Compensation Analyst to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to answer questions regarding compensation and benefits and conduct job analysis<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manager of Compensation and Benefits to receive direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to seek outside help with compensation <br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Compensation Analyst may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managing large quantities of data <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling needs from multiple hiring managers<br />
              &nbsp;&nbsp;&nbsp;&#9642; Interfacing with multiple vendors e.g. actuaries, financial advisors, etc<br />
            </p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Compensation Analyst<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Market-driven Connectivity<br />
              &nbsp;&nbsp;&nbsp;&#9642; Initiative<br />
              &nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communication<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
  &nbsp;&nbsp;&nbsp;&#9642; HR Measurement <br />
  &nbsp;&nbsp;&nbsp;&#9642; Performance Management
  <br />
  <br />
              <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largecompanalyst_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
              <br />
              <br />
            </p>
            <p>&nbsp;</p>          </td>
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
