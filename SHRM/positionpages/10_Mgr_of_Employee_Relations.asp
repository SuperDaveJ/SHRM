<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Manager of Employee Relations</title>


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
          <td valign="top"><p><span class="main">Manager, Employee Relations </span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Manager of Employee Relations is responsible for coordinating and directing the Employee Relations programs and functions. S/he has primary responsibility for managing labor and employee relations.  S/he manages employee relations activities according to established guidelines and sound administrative practices.  In addition s/he handles resolving labor relations issues and other issues regarding HR policies, conflict resolution, performance problems and terminations.  Other responsibilities may include guidance with layoffs, investigations regarding discrimination and harassment, creating training programs and reviewing background checks. <br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Manager of Employee Relations. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:
            </p>
             <%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p>
                  <span class="sub">Required Experience </span><br />
                  <br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                  <span class="style1">o</span>
                    <%Else%>
                    <span class="style1">&thorn;</span>
                    <% End If %>
                    Bachelor&rsquo;s Degree <br />
                    <span class="style1">o</span> 7-10 years of work experience in human resources management<br />
                    <span class="style1">o</span> At least 2-3 years of experience in employee/labor relations<br />
                    <span class="style1">o</span> Minimum of 3 years of supervisory experience<br />
                    <span class="style1">o</span> Experience in providing advice, feedback and directing clients toward resources to address <br />
&nbsp;&nbsp;&nbsp;                    and resolve          issues/problems in the workplace<br />
                    <span class="style1">o</span> Excellent verbal and written communication skills and interpersonal skills<br />
                    <span class="style1">o</span> Knowledge of employment laws and practices<br />
                    <span class="sub"><br />
                    Preferred Experience</span><br />
                    <br />
                    <%IF rstSimple.Fields("UserMaxEducation").Value < 5 Then%>
                    <span class="style1">o</span>
                    <%Else%>
                    <span class="style1">&thorn;</span>
                    <% End If %>
                    Master&rsquo;s Degree <br />
                    <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" AND rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
                    <span class="style1">o</span>
                    <%Else%>
                    <span class="style1">&thorn;</span>
                    <% End If %>
                    SPHR or PHR<br />
                    <span class="style1">o</span> Certificate in mediation</p>
                </td>
              </tr>
            </table>
			<%Else%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p>
                  <span class="sub">Required Experience </span>
                  <p><span class="style1">o</span>
                    Bachelor&rsquo;s Degree <br />
                    <span class="style1">o</span> 7-10 years of work experience in human resources management<br />
                    <span class="style1">o</span> At least 2-3 years of experience in employee/labor relations<br />
                    <span class="style1">o</span> Minimum of 3 years of supervisory experience<br />
                    <span class="style1">o</span> Experience in providing advice, feedback and directing clients toward resources to address <br />
  &nbsp;&nbsp;&nbsp;                    and resolve          issues/problems in the workplace<br />
                    <span class="style1">o</span> Excellent verbal and written communication skills and interpersonal skills<br />
                    <span class="style1">o</span> Knowledge of employment laws and practices<br />
                    <span class="sub"><br />
                    Preferred Experience</span><br />
                    <br />
                    <span class="style1">o</span>
                    Master&rsquo;s Degree <br />
                    <span class="style1">o</span>
                    SPHR or PHR<br />
                    <span class="style1">o</span> Certificate in mediation</p></td>
              </tr>
            </table>
			<%End If%>
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Investigates problems such as working conditions, disciplinary actions, and employee and applicant appeals and<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            grievances<br />
              &nbsp;&nbsp;&nbsp;&#9642; Formulates and recommends goals and objectives in all areas of employee relations<br />
              &nbsp;&nbsp;&nbsp;&#9642; Responds to questions regarding employment, work/life programs, professional conduct, corrective action, and<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            employee issue resolution, etc. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Assists and provide guidance with staff reductions, layoffs and new hires<br />
              &nbsp;&nbsp;&nbsp;&#9642; Counsels managers and employees on a broad range of issues with sensitivity and discretion <br />
              &nbsp;&nbsp;&nbsp;&#9642; Reviews background checks<br />
              &nbsp;&nbsp;&nbsp;&#9642; Evaluates company&rsquo;s policies and procedures related to employee relations<br />
              &nbsp;&nbsp;&nbsp;&#9642; Develops and maintains strong employee relations<br />
              &nbsp;&nbsp;&nbsp;&#9642; Participates in all required training sessions for compliance <br />
              &nbsp;&nbsp;&nbsp;&#9642; Identification of meet and confer issues <br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping union leadership informed where appropriate <br />
              &nbsp;&nbsp;&nbsp;&#9642; Chairing negotiations <br />
              <br />
              <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Manager of Employee Relations to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to help them in dealing with employee issues and deciding on action steps to resolve them<br />
              &nbsp;&nbsp;&nbsp;&#9642; Employee Relations Specialist to provide direction, coaching and feedback <br />
              &nbsp;&nbsp;&nbsp;&#9642; Employees to counsel them on employee issues<br />
              &nbsp;&nbsp;&nbsp;&#9642; Employee Assistance Program to administer and monitor the contract <br />
              &nbsp;&nbsp;&nbsp;&#9642; Union Presidents and Stewards to discuss issues<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Manger of Employee Relations may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling very emotional employees <br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining objectivity and legal compliance with dealing with employee issues<br />
              &nbsp;&nbsp;&nbsp;&#9642; Having integrity and discretion with dealing with all issues, particularly sensitive ones<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining positive relationships with unions<br /> 
              <br />
              <span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies<br />
              </span><br />
              The following competencies are considered necessary for success in the role of Manager of Employee Relations <br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Decision-making<br />
              &nbsp;&nbsp;&nbsp;&#9642; Initiative <br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Credibility<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking
  <br />
              <br />
              <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/mid_mgr_er_development.aspx">Developmental Opportunities</a>
              
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
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more <br />
              <br />
            </p>
          <p></p></td>
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
