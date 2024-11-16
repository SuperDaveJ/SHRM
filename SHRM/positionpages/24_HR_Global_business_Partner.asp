<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Recruiter</title>


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
        <td valign="top"><p class="main">Human Resources Global Business Partner </p>
          <p><span class="sub">Description of the Role</span> <br />
            <br />
            The HR Global Business Partner is responsible for providing human resources management expertise globally.  S/he will oversee expatriate programs.  In addition, s/he will collaborate with other HR leaders on rolling out policies and programs and act as liaison to other HR staff in other countries. <br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a HR Global Business Partner. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
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
Bachelors degree in Human Resources, International Business or related field <br />
<%IF rstSimple.Fields("UserHRExperience").Value < 10 Then%>
<span class="style1">o</span>
<%Else%>
<span class="style1">&thorn;</span>
<% End If %>
10-15 years of progressive experience in human resources <br />
<span class="style1">o</span> Minimum of 3 years at the senior management or executive level handling global issues <br />
<span class="style1">o</span> Must be a seasoned HR leader <br />
<%IF rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
<span class="style1">o</span>
<%Else%>
<span class="style1">&thorn;</span>
<% End If %>
SPHR certification<br />
<span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and externally <br />
&nbsp;&nbsp;&nbsp;            at all levels<br />
<span class="style1">o</span> Knowledge of various HR areas<br />
<span class="style1">o</span> Ability to read, analyze, and interpret professional journals, financial reports and legal documents <br />
<span class="style1">o</span> Expatriate experience <br />
<br />
<span class="sub">Preferred Experience</span><br />
<br />
<%IF rstSimple.Fields("UserMaxEducation").Value < 6 Then%>
<span class="style1">o</span>
<%Else%>
<span class="style1">&thorn;</span>
<% End If %>
Master&rsquo;s Degree in Human Resources or International Business or related field<br />
<span class="style1">o</span> Foreign language fluency</td>
            </tr>
          </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><p><span class="sub">Required Experience</span><br />
                <br />
                <span class="style1">o</span>
Bachelors degree in Human Resources, International Business or related field <br />
<span class="style1">o</span>
10-15 years of progressive experience in human resources <br />
<span class="style1">o</span> Minimum of 3 years at the senior management or executive level handling global issues <br />
<span class="style1">o</span> Must be a seasoned HR leader <br />
<span class="style1">o</span>
SPHR certification<br />
<span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and externally <br />
&nbsp;&nbsp;&nbsp;            at all levels<br />
<span class="style1">o</span> Knowledge of various HR areas<br />
<span class="style1">o</span> Ability to read, analyze, and interpret professional journals, financial reports and legal documents <br />
<span class="style1">o</span> Expatriate experience <br />
<br />
<span class="sub">Preferred Experience</span><br />
<br />
<span class="style1">o</span>
Master&rsquo;s Degree in Human Resources or International Business or related field<br />
<span class="style1">o</span> Foreign language fluency</td>
            </tr>
          </table>
<% End If %>		  		  
          <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
            <br />
  &nbsp;&nbsp;&nbsp;&#9642; Develop and manage global HR functions at all levels across the organization <br />
  &nbsp;&nbsp;&nbsp;&#9642; Act as liaison to HR staff in other countries ensuring consistency throughout the organization <br />
  &nbsp;&nbsp;&nbsp;&#9642; Manage expatriate programs and advise on within country hires <br />
  &nbsp;&nbsp;&nbsp;&#9642; Collaborate with other HR leaders on rolling out policies, and programs globally <br />
  &nbsp;&nbsp;&nbsp;&#9642; Serve as the SME for global human resource issues <br />
  &nbsp;&nbsp;&nbsp;&#9642; Evaluate and advise on the impact of the long range planning of new programs/strategies and regulatory action<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            as those items impact overseas employees <br />
            <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces<br />
              </span><br />
            This role requires the HR Global Business Partner to interact with a variety of people and departments, which may include:<br />
            <br />
  &nbsp;&nbsp;&nbsp;&#9642; VP of HR to get guidance in defining the human resources goals and objectives <br />
  &nbsp;&nbsp;&nbsp;&#9642; Human Resources Global Staff to provide consistency on HR programs and policies <br />
  &nbsp;&nbsp;&nbsp;&#9642; Expatriates to assist them through the hiring process <br />
  &nbsp;&nbsp;&nbsp;&#9642; Director of OD and Training to collaborate on global organizational development and change initiatives<br />
  &nbsp;&nbsp;&nbsp;&#9642; Director of Compensation and Benefits to discuss expatriate compensation packages <br />
            <br />
            <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
            <br />
            Typical challenges associated with the HR Global Business Partner may include:<br />
            <br />
  &nbsp;&nbsp;&nbsp;&#9642; Handling legal issues regarding expatriates <br />
  &nbsp;&nbsp;&nbsp;&#9642; Providing knowledgeable answers to global HR staff based on best practices <br />
  &nbsp;&nbsp;&nbsp;&#9642; Representing global perspectives when creating policies and programs with other HR leaders<br />
  &nbsp;&nbsp;&nbsp;&#9642; Keeping track of various needs across countries</p>
          <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
            <br />
            The following competencies are considered necessary for success in the role of the HR Global Business Partner <br />
            <br />
            Strategic Contribution:<br />
            &nbsp;&nbsp;&nbsp;&#9642; Culture Management<br />
            &nbsp;&nbsp;&nbsp;&#9642; Organizational Awareness<br />
&nbsp;&nbsp;&nbsp;&#9642; Team Leadership<br />
&nbsp;&nbsp;&nbsp;&#9642; Strategic Thinking<br />
&nbsp;&nbsp;&nbsp;&#9642; Political Savvy<br />
            <br />
Personal Credibility:<br />
&nbsp;&nbsp;&nbsp;&#9642; Achieving Results<br />
&nbsp;&nbsp;&nbsp;&#9642; Impact and Influence <br />
&nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
<br />
HR Delivery:<br />
&nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
&nbsp;&nbsp;&nbsp;&#9642; Teamwork and Collaboration          </p>
          <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
          <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
            Visit the
  
  <a href="http://www.elearning.shrm.org/largeglobal_development.aspx" target="_blank">Developmental Opportunities</a>
 
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
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more          </p>
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
