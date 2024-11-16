<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Senior Recruiter</title>


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
          <td valign="top"><p><span class="main">Senior Recruiter</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Senior Recruiter is responsible for staffing with quality hires, understanding the business needs and partnering with the department managers and HR to fully understand the staffing strategy for the business.  In addition s/he must have a basic understanding of the organizational structure as well as an extensive knowledge of personnel policy and procedures and federal and state laws regarding employment practices.  It is his/her primary responsibility to interview and assess qualified professionals with the goal of developing and maintain a diversified team of professionals. <br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Senior Recruiter. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:
            </p>
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
                  Bachelor&rsquo;s Degree in Human Resources or related field <br />
  <span class="style1">o</span> 5+  years of full cycle recruiting <br />
  <span class="style1">o</span> Knowledge of sourcing techniques <br />
  <span class="style1">o</span> Proven track record in staffing and recruiting with experience in managing outside resources such <br />
  &nbsp;&nbsp;&nbsp; as agencies          and headhunters<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at           all levels<br />
  <br />
  <span class="sub">Preferred Experience<br />
  </span><br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 6 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Masters Degree in Business, Communications or Psychology<br />
  <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" AND rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  PHR/SPHR <br />
  <span class="style1">o</span> Second language desirable (Spanish-speaking preferred)</td>
              </tr>
            </table>
		<%Else%>
		<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree in Human Resources or related field <br />
  <span class="style1">o</span> 5+  years of full cycle recruiting <br />
  <span class="style1">o</span> Knowledge of sourcing techniques <br />
  <span class="style1">o</span> Proven track record in staffing and recruiting with experience in managing outside resources such <br />
  &nbsp;&nbsp;&nbsp; as agencies          and headhunters<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at           all levels<br />
  <br />
  <span class="sub">Preferred Experience<br />
  </span><br />
  <span class="style1">o</span>
                  Masters Degree in Business, Communications or Psychology<br />
  <span class="style1">o</span>
                  PHR/SPHR <br />
  <span class="style1">o</span> Second language desirable (Spanish-speaking preferred)</td>
              </tr>
            </table>
	  <% End If %>		
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Generating and screening candidates through the utilization of creative sourcing techniques <br />
              &nbsp;&nbsp;&nbsp;&#9642; Conducting phone and personal interviews/assessments <br />
              &nbsp;&nbsp;&nbsp;&#9642; Developing and executing recruitment strategies <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managing recruiting duties with a staff of one recruiter and coordinator <br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining relationships with client groups and partner with them to fill staffing goals<br />
              &nbsp;&nbsp;&nbsp;&#9642; Sourcing candidates, establishing new sources, and a talent pool to draw from<br />
              &nbsp;&nbsp;&nbsp;&#9642; Driving recruitment process and ensuring decisions are made in a timely manner <br />
              &nbsp;&nbsp;&nbsp;&#9642; Completing pre-employment processes according to organizational guidelines<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conducting in-depth behavioral interviews to properly assess candidate skills set and competencies. <br />
              <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span></p>
            <p>This role requires the Senior Recruiter to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to determine staffing needs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Recruiting and Staffing Team and HR Department to provide direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Director of Recruitment and Staffing to receive direction, feedback and coaching<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to seek outside help with recruitment &ndash; i.e. colleges/universities and employment agencies<br />
              &nbsp;&nbsp;&nbsp;&#9642; Candidates to recruit and interview<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Senior Recruiter may include:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling sudden turnover and staffing needs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Remaining unbiased when interviewing <br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping up-to-date of market and adapting to resulting effects on recruiting<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining legal compliance in all recruiting and staffing methods<br />
              &nbsp;&nbsp;&nbsp;&#9642; Understanding financial impact of decisions and recommendations <br />
            &nbsp;&nbsp;&nbsp;&#9642; Handling the needs of a diverse workforce e.g. individuals with disabilities</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Senior Recruiter <br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Initiative<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships <br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Staffing<br />
  &nbsp;&nbsp;&nbsp;&#9642; HR Measurement<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Customer Focus          </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largesrrecruiter_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
