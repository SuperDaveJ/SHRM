<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Organizational Development Consultant</title>


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
          <td valign="top"><p><span class="main">Organizational Development Consultant</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Organizational Development Consultant is responsible for identifying and designing strategies, programs and interventions to meet the strategic goals and objectives of the organization.  S/he assesses requests for development opportunities, and facilitates corporate team building and corporate culture change strategies.  It is also his/her responsibility to serve as an internal management and educational coach/consultant.  He/she provides assessment and referral, coaching and feedback to employees and managers.</p>
            <p><span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as an Organizational Development Consultant. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
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
                  Bachelor&rsquo;s Degree in Business, HR or related field<br />
  <span class="style1">o</span> Master&rsquo;s Degree in Organizational Development, Organizational Effectiveness or I/O Psychology <br />
  <span class="style1">o</span> 5+ years of work experience in organizational development, leadership development and change <br />
  &nbsp;&nbsp;&nbsp; management <br />
  <span class="style1">o</span> Experience in defining customer needs and developing solutions <br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience working with all levels in an organization <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" AND rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  PHR/SPHR <br />
  <span class="style1">o</span> Ph.D. in Organizational Development or related field</td>
              </tr>
            </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree in Business, HR or related field<br />
  <span class="style1">o</span> Master&rsquo;s Degree in Organizational Development, Organizational Effectiveness or I/O Psychology <br />
  <span class="style1">o</span> 5+ years of work experience in organizational development, leadership development and change <br />
  &nbsp;&nbsp;&nbsp; management <br />
  <span class="style1">o</span> Experience in defining customer needs and developing solutions <br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience working with all levels in an organization <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span>
                  PHR/SPHR <br />
  <span class="style1">o</span> Ph.D. in Organizational Development or related field</td>
              </tr>
            </table>
 <% End If %>			
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Facilitate organizational development courses and new systems <br />
              &nbsp;&nbsp;&nbsp;&#9642; Provide internal management or developmental coaching <br />
              &nbsp;&nbsp;&nbsp;&#9642; Conduct needs analysis, and develop programs based on needs of business team and department leaders <br />
              &nbsp;&nbsp;&nbsp;&#9642; Lead and run diverse OD projects collaborating with internal clients in the areas of strategic planning, change<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;management, performance improvement, leadership development and team effectiveness <br />
              &nbsp;&nbsp;&nbsp;&#9642; Administer and interpret assessments used for performance improvement<br />
              &nbsp;&nbsp;&nbsp;&#9642; Provide assessment feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Act as internal consultant to assist staff at all levels with team building, resume writing, leadership <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            development, facilitation, and holding effective meetings <br />
              &nbsp;&nbsp;&nbsp;&#9642; Oversee internal consulting on needs assessment, work group performance improvement and change<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;management<br />
              &nbsp;&nbsp;&nbsp;&#9642; Analyze complex issues, probe for ideas and present solutions<br />
              &nbsp;&nbsp;&nbsp;&#9642; Administer or oversee employee surveys<br />
              &nbsp;&nbsp;&nbsp;&#9642; Participate in talent management initiatives  e.g. succession planning <br />
              <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span></p>
            <p>This role requires the Organizational Development Consultant to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managers for needs assessment and to gain support for projects<br />
              &nbsp;&nbsp;&nbsp;&#9642; Director of, Training and Organizational Development  for direction, feedback and guidance <br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendor to seek outside help with special consulting projects <br />
              &nbsp;&nbsp;&nbsp;&#9642; EAP for coordination of services or referral of employees<br />
              &nbsp;&nbsp;&nbsp;&#9642; Employee Relations Consultant to address systemic employee relations issues<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Organizational Development Consultant may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling employees that are not accepting of change and new organizational changes and programs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping abreast of changes in the organization and marketplace in order to keep training current <br />
              &nbsp;&nbsp;&nbsp;&#9642; Providing long-lasting solutions<br />
              <br />
              <span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Organizational Development Consultant <br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Culture Management <br />
              &nbsp;&nbsp;&nbsp;&#9642; Decision Making<br />
  &nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Initiative <br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  &nbsp;&nbsp;&nbsp;&#9642; Impact and Influence<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
  &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Collaboration<br />
  <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largeod_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more</p>
            <p><br />
              <br />
          </p></td>
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
