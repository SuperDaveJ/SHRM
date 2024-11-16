<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Comp and Benefits Analyst</title>


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
          <td valign="top"><p class="main"><strong>Compensation and Benefits Analyst </strong></p>
            <p>The Compensation and Benefits Analyst is responsible  for assisting and supporting the development, implementation and administration  of compensation and benefits policies and procedures throughout the  organization.&nbsp; S/he will be required to  undertake and interpret market-pricing analysis, develop salary  recommendations, produce and review job descriptions.&nbsp; </p>
            <h2 class="sub">Preparation for the Role</h2>
            <p>The following experience and recommended qualifications  have been cited as useful for preparation as a Compensation and Benefits  Analyst. Those seeking this position should have proven experience and/or  qualifications in one or more of the following areas:            </p>
            <%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p>
				 <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
				Bachelor&rsquo;s Degree with concentration in Business  Management, HR Management, <br />
				  <%IF rstSimple.Fields("UserHRExperience").Value < 4 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
At least 4-5 years of work experience in a Compensation  and Benefits role <br />
<span class="style1">o</span> HRIS experience and extensive experience with  spreadsheets and other software applications<br />
<span class="style1">o</span> In-depth knowledge of compensation and benefit  practices within the region<br />
<span class="style1">o</span> Effective verbal and written communication  skills and ability to communicate internally and externally <br />
&nbsp;&nbsp;&nbsp;              at all levels<br />
<span class="style1">o</span> Excellent analytical skills and ability to  maintain confidentiality </td>
              </tr>
            </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p>
                  <span class="style1">o</span>
				Bachelor&rsquo;s Degree with concentration in Business  Management, HR Management, <br />
                  <span class="style1">o</span>
At least 4-5 years of work experience in a Compensation  and Benefits role <br />
<span class="style1">o</span> HRIS experience and extensive experience with  spreadsheets and other software applications<br />
<span class="style1">o</span> In-depth knowledge of compensation and benefit  practices within the region<br />
<span class="style1">o</span> Effective verbal and written communication  skills and ability to communicate internally and externally <br />
&nbsp;&nbsp;&nbsp;              at all levels<br />
<span class="style1">o</span> Excellent analytical skills and ability to  maintain confidentiality </td>
              </tr>
            </table>
 <% End If %>			
            <p><strong class="sub">Key Accountabilities</strong><strong></strong><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Design, development, and implementation and administration  of Compensation and Benefit programs</a><br />
              &nbsp;&nbsp;&nbsp;&#9642; Consultation with HR staff and line managers  regarding compensation and benefits matters<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conducting ad-hoc pay analysis projects<br />
              &nbsp;&nbsp;&nbsp;&#9642; Job evaluation/ market pricing and grade  assignments<br />
              &nbsp;&nbsp;&nbsp;&#9642; Participating and evaluating the results of  relevant salary and benefit surveys<br />
              &nbsp;&nbsp;&nbsp;&#9642; Researching, collecting and analyzing internal  and external data<br />
              &nbsp;&nbsp;&nbsp;&#9642; Monitoring compliance accordance with policies<br />
            &nbsp;&nbsp;&nbsp;&#9642; Benefit renewals, and reviewing proposed salary  adjustments</p>
            <h2 class="sub">Primary Interfaces</h2>
            <p>This role requires the Compensation and  Benefits Analyst to interact with a variety of people and departments, which  may include:<br />
              <br />
                <em>&nbsp;&nbsp;&nbsp;&#9642; Internal  Staff </em>to answer questions regarding compensation and benefits and conduct  job analysis<br />
                <em>&nbsp;&nbsp;&nbsp;&#9642; Manager of  Compensation and Benefits</em> to receive direction, coaching and feedback<br />
                <em>&nbsp;&nbsp;&nbsp;&#9642; Third  Party Vendors </em>to seek outside help with benefits</p>
            <h2 class="sub">Challenges  in the Role </h2>
            <p>Typical challenges associated with the  Compensation and Benefits Analyst may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managing large quantities of data <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling needs from multiple hiring managers<br />
              &nbsp;&nbsp;&nbsp;&#9642; Interfacing with multiple vendors e.g.  actuaries, financial advisors, etc<br />
              <br />
              <span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Employee Relations Specialist<br />
              <br />
              Strategic Contribution:<br />
&nbsp;&nbsp;&nbsp;&#9642; Market-driven Connectivity<br />
&nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
&nbsp;&nbsp;&nbsp;&#9642; Initiative<br />
&nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
              <br />
              Personal Credibility:<br />
&nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
&nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
&nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
&nbsp;&nbsp;&nbsp;&#9642; Listening and Responding<br />
  <br />
              HR Delivery:<br />
&nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
&nbsp;&nbsp;&nbsp;&#9642; HR Measurement<br />
&nbsp;&nbsp;&nbsp;&#9642; Performance Management            </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
                <%IF rstSimple.Fields("UserOrganizationSize").Value = 2 Then%>
  <a href="http://www.elearning.shrm.org/midcompbenanalyst_development.aspx" target="_blank">Developmental Opportunities</a>
  <%Else%>
  <a href="http://www.elearning.shrm.org/largecompben_development.aspx">Developmental Opportunities</a>
  <% End If %>
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
            </p>          </td>
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
