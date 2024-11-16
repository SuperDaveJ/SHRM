<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Manager of Compensation and Benefits</title>


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
          <td valign="top"><p><span class="main">Manager, Compensation and Benefits</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Manager of Compensation and Benefits is responsible for proposing, developing, implementing and managing the company&rsquo;s compensation and benefits program.  S/he will serve as an advisor to management in personnel policy and program matters and make or recommend appropriate total reward decisions.   S/he will lead the salary planning processes, and advise managers and HR partners on the compensation and benefits strategy. <br />
            Surveys industry and/or community to determine company's competitive position in employee benefits. Develops, recommends, and installs approved, new, or modified plans and employee benefit policies, and supervises administration of existing plans.  Selects external actuaries and manages the relationship with them.  Develops cost control policies and procedures to assure maximum coverage at the least possible cost to company and employee.<br />
            Plans, develops and implements new and revised compensation programs, policies, procedures, in order to be responsive to the company's goals and competitive practices. Assures thorough audits, reports and personal contact that company compensation programs are consistently administered in compliance with company policies and government regulations.<br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Manager of Compensation and Benefits. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:
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
                  Bachelor&rsquo;s Degree with concentration in Human Resources, Finance or a related field<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 6 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  6-8 years HR experience in Benefits and Compensation<br />
  <span class="style1">o</span> Solid working knowledge of HR policies and practices<br />
  <span class="style1">o</span> Experience developing, implementing, and maintaining health, welfare, and 401K programs<br />
  <span class="style1">o</span> Supervisory experience<br />
  <%IF rstSimple.Fields("UserCert_CEBS").Value = "yes" OR rstSimple.Fields("UserCert_CBP").Value = "yes" OR rstSimple.Fields("UserCert_CCP").Value = "yes" Then%>
  <span class="style1">&thorn;</span>
  <%Else%>
  <span class="style1">o</span>
  <% End If %>
                  CEBS, CBP,  or CCP <br />
  <span class="style1">o</span> Strong understanding of ERISA, FMLA, HIPAA, and IRS regulations<br />
  <span class="style1">o</span> Expertise in variable pay design/administration and executive compensation<br />
  <span class="style1">o</span> Experience in base pay design/administration including job evaluation, benchmarking and <br />
  &nbsp;&nbsp;&nbsp; market pricing<br />
  <span class="style1">o</span> Mathematical aptitude and analytical skills<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" AND rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                SPHR/PHR certification</td>
              </tr>
            </table>
<%Else%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
  <br />
  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree with concentration in Human Resources, Finance or a related field<br />
  <span class="style1">o</span>
                  6-8 years HR experience in Benefits and Compensation<br />
  <span class="style1">o</span> Solid working knowledge of HR policies and practices<br />
  <span class="style1">o</span> Experience developing, implementing, and maintaining health, welfare, and 401K programs<br />
  <span class="style1">o</span> Supervisory experience<br />
  <span class="style1">&thorn;</span>
                  CEBS, CBP,  or CCP <br />
  <span class="style1">o</span> Strong understanding of ERISA, FMLA, HIPAA, and IRS regulations<br />
  <span class="style1">o</span> Expertise in variable pay design/administration and executive compensation<br />
  <span class="style1">o</span> Experience in base pay design/administration including job evaluation, benchmarking and <br />
  &nbsp;&nbsp;&nbsp; market pricing<br />
  <span class="style1">o</span> Mathematical aptitude and analytical skills<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span>
                SPHR/PHR certification</td>
              </tr>
            </table>
<% End If %>
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Lead salary planning processes<br />
              &nbsp;&nbsp;&nbsp;&#9642; Advise managers and HR partners on compensation strategy <br />
              &nbsp;&nbsp;&nbsp;&#9642; Monitor vendor performance and continually review financials <br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage compensation and benefits portion of HRIS system<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage plan design for the total rewards system, i.e. job evaluation, base salary and incentive programs<br />
              &nbsp;&nbsp;&nbsp;&#9642; Analyze plans and maintain program competitiveness and legal compliance<br />
              &nbsp;&nbsp;&nbsp;&#9642; Negotiate vendor contracts <br />
              &nbsp;&nbsp;&nbsp;&#9642; Seek innovative benefit products to enhance organization&rsquo;s benefit package<br />
              &nbsp;&nbsp;&nbsp;&#9642; Provide advice to staff on pay decisions, policy and guideline interpretation and job evaluations <br />
            &nbsp;&nbsp;&nbsp;&#9642; Expertise in analysis and &ldquo;number crunching&rdquo; to monitor compensation</p>
            <p class="sub"><a name="primary" id="primary"></a>Primary Interfaces</p>
            <p>This role requires the Manager of Compensation and Benefits to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to administer and answer questions regarding compensation and benefits <br />
              &nbsp;&nbsp;&nbsp;&#9642; CHRO for direction and guidance and share information about major benefits and compensation changes<br />
              &nbsp;&nbsp;&nbsp;&#9642; Compensation and Benefits Staff  and HR Department to provide direction, coaching and feedback, and gain <br />
  &nbsp;&nbsp;&nbsp;            input on current Comp &amp; Benefits program<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to negotiate programs i.e. insurance, etc<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Manager of Compensation and Benefits may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping up-to-date of market and adapt to competition <br />
              &nbsp;&nbsp;&nbsp;&#9642; Understanding financial impact of decisions and recommendations <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling unique compensation and benefit needs<br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping up-to-date of all regulations<br />
            &nbsp;&nbsp;&nbsp;&#9642; Maintaining legal compliance in all compensation and benefits </p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Manager Recruiting and Staffing<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Market-Driven Connectivity <br />
              &nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; HR Measurement<br />
  &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
  &nbsp;&nbsp;&nbsp;&#9642; Performance Management <br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Customer Focus<br />
            </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              <%IF rstSimple.Fields("UserOrganizationSize").Value = 2 Then%>
              <a href="http://www.elearning.shrm.org/Mid_comp_ben_development.aspx" target="_blank">Developmental Opportunities</a>
              <%Else%>
              <a href="http://www.elearning.shrm.org/largecompben_development.aspx" target="_blank">Developmental Opportunities</a>
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
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more <br />
              <br />
              <br />
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
