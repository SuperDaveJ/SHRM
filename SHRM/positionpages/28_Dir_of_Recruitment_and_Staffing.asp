<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Director of Recruiting and Staffing</title>


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
          <td valign="top"><p><span class="main">Director of Recruiting and Staffing<br />
            </span><br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Director of Recruiting and Staffing is responsible for the day-to-day management of the company&rsquo;s corporate recruiting programs, policies and procedures.  They manage full life cycle recruiting for executive, middle management, professional, non-exempt corporate and market area positions.  It is his/her responsibility to implement and develop recruiting strategies related to the hiring process.  They provide guidance and advice to client groups on workforce planning initiatives and consistently identify talented qualified candidates during the hiring process from inception to completion.  They build successful relationships with client groups and partner with them to achieve these and other staffing goals and objectives. <br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Director of Recruiting and Staffing. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:</p>
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
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR, Organizational <br />
  &nbsp;&nbsp;&nbsp; Development or a related field<br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 5 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Master degree in Business, HR or OD<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 10 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  10-12  years of work experience in a generalist of staffing role in increasingly <br />
  &nbsp;&nbsp;&nbsp; responsible positions in areas of recruitment and selection<br />
  <span class="style1">o</span> Supervisory experience <br />
  <span class="style1">o</span> Experience in full lifecycle recruiting &ndash; for a wide variety of positions from administrative to <br />
  &nbsp;&nbsp;&nbsp; vice-president<br />
  <span class="style1">o</span> Proven track record in staffing and recruiting with experience in managing outside resources such<br /> 
  &nbsp;&nbsp;&nbsp; as agencies and headhunters<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span> HRIS experience<br />
  <span class="style1">o</span> Second language desirable (Spanish-speaking preferred)<br />
  <%IF rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                SPHR </td>
              </tr>
            </table>
	<%Else%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
  <br />
  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR, Organizational <br />
  &nbsp;&nbsp;&nbsp; Development or a related field<br />
  <span class="style1">o</span>
                  Master degree in Business, HR or OD<br />
  <span class="style1">o</span>
                  10-12  years of work experience in a generalist of staffing role in increasingly <br />
  &nbsp;&nbsp;&nbsp; responsible positions in areas of recruitment and selection<br />
  <span class="style1">o</span> Supervisory experience <br />
  <span class="style1">o</span> Experience in full lifecycle recruiting &ndash; for a wide variety of positions from administrative to <br />
  &nbsp;&nbsp;&nbsp; vice-president<br />
  <span class="style1">o</span> Proven track record in staffing and recruiting with experience in managing outside resources such<br /> 
  &nbsp;&nbsp;&nbsp; as agencies and headhunters<br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span> HRIS experience<br />
  <span class="style1">o</span> Second language desirable (Spanish-speaking preferred)<br />
  <span class="style1">o</span>
                SPHR </td>
              </tr>
            </table>
	  <% End If %>		
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Day to day management of recruiting programs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage full life cycle recruiting for all levels <br />
              &nbsp;&nbsp;&nbsp;&#9642; Design, execute and maintain corporate recruiting programs e.g. branding and employee referral programs<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage online recruiting resources, diversity initiatives, career fairs, college recruiting and recruiting policies &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;and procedures<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintain relationships with client groups and partner with them to fill staffing goals<br />
              &nbsp;&nbsp;&nbsp;&#9642; Develop proactive recruitment strategies and tactics that are consistent with broader organizational objectives <br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage recruiting staff and ensure revenue and headcount goals are met<br />
              &nbsp;&nbsp;&nbsp;&#9642; Source candidates, establish new sources, and a talent pool to draw from<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conduct some interviews (behavioral interviews)<br />
              &nbsp;&nbsp;&nbsp;&#9642; Partner with Recruiters to create offers based on current labor market <br />
              &nbsp;&nbsp;&nbsp;&#9642; Monitor industry and regional compensation trends<br />
              &nbsp;&nbsp;&nbsp;&#9642; Create executive offer packages <br />
              &nbsp;&nbsp;&nbsp;&#9642; Recruit at the executive level <br />
              &nbsp;&nbsp;&nbsp;&#9642; Select and monitor contracts with staffing and advertising agencies <br />
              &nbsp;&nbsp;&nbsp;&#9642; Contribute to talent management processes <br />
              <br />
              <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Director of Recruiting and Staffing to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to determine staffing needs <br />
              &nbsp;&nbsp;&nbsp;&#9642; VP of HR for direction and guidance and share information about recruitment efforts and staffing needs and<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            impact<br />
              &nbsp;&nbsp;&nbsp;&#9642; Recruiting and Staffing Team  and HR Department to provide direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to seek outside help with recruitment &ndash; i.e. colleges/universities and employment agencies<br />
              &nbsp;&nbsp;&nbsp;&#9642; Executive Candidates to recruit and interview<br />
              &nbsp;&nbsp;&nbsp;&#9642; HR Committee of the Board to respond to staffing questions<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Director of Recruiting and Staffing may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling sudden turnover and staffing needs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining legal compliance in all recruiting and staffing methods<br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping up-to-date of market and adapting to resulting effects on recruiting <br />
              &nbsp;&nbsp;&nbsp;&#9642; Understanding financial impact of decisions and recommendations <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling the needs of a diverse workforce e.g. individuals with disabilities<br />
              <br />
              <span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Director Recruiting and Staffing<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Organizational Awareness<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Staffing<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
  &nbsp;&nbsp;&nbsp;&#9642; HR Measurement<br />
  &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance <br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking          </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/HR_largerecruit_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
              <span class="sub"><br />
            </span></p>
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
