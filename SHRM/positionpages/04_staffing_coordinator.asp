<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Staffing Coordinator</title>


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
          <td valign="top"><p class="main">Staffing Coordinator</p>
            <p><span class="sub">Description of the Role</span><br />
              <br />
              The Staffing Coordinator is responsible for administrative support for the recruiting team. The major areas of support include, but are not limited to:&nbsp; coordinate candidate interviews including timely notification to candidates, managers and recruiters and assist recruiting team in candidate interviews. <br />
              <br />
              <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Recruiter. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
       <%if strActionPlan <> 0 Then%> 
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 2 Then%>
                  'Tests for Associate as Minimum<span class="style1 style2 style3">o</span>
  <%Else%>
  <span class="style1 style3">&thorn;</span>
  <% End If %>
                  Associate&rsquo;s Degree <br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 1 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  1-2 years of work experience in a generalist or recruiting role <br />
  <span class="style1 style2 style3">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all            levels<br />
  <span class="style1 style2 style3">o</span> Knowledgeable in computer applications. <br />
  <span class="style1 style2 style3">o</span> Excellent interpersonal, organizational and customer service skills. <br />
  <br />
  <span class="sub">Preferred Experience<br />
  </span><br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
  <span class="style1 style2 style3">o</span>
  <%Else%>
  <span class="style1 style3">&thorn;</span>
  <% End If %>
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR or a related field<br />
  <span class="style1 style2 style3">o</span> HRIS experience, especially with applicant tracking systems.</td>
              </tr>
            </table>
		<%end if%>	
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
  &nbsp;&nbsp;&nbsp;&#9642; Complete offer and decline letters as requested. <br />
  &nbsp;&nbsp;&nbsp;&#9642; Gather and compile statistical data for reports and create Excel spreadsheets and/or PowerPoint presentations<br />
  &nbsp;&nbsp;&nbsp;&#9642; Process new hire paperwork including applications, background investigations and HRIS changes. <br />
  &nbsp;&nbsp;&nbsp;&#9642; Schedule meetings and make travel arrangements for candidates and recruiters <br />
  &nbsp;&nbsp;&nbsp;&#9642; Post job descriptions and retrieve resumes from Internet sites<br />
  &nbsp;&nbsp;&nbsp;&#9642; Assist in the coordination of career fairs.  Coordination may involve scheduling rooms, completing mailings,<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            working with outside vendors and ad agencies, and notifying participants <br />
  &nbsp;&nbsp;&nbsp;&#9642; Assist with special staffing projects as requested</p>
            <p><span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Staffing Coordinator to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to ask about staffing needs<br />
              &nbsp;&nbsp;&nbsp;&#9642; Recruiter to receive direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to coordinate outside help with staffing<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Staffing Coordinator may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling sudden lack of resources, scheduling difficulties<br />
              &nbsp;&nbsp;&nbsp;&#9642; Creating accommodations for a diverse workforce i.e. individuals with disabilities<br />
              &nbsp;&nbsp;&nbsp;&#9642; Meeting recruiting deadlines and needs of department managers<br />
            &nbsp;&nbsp;&nbsp;&#9642; Coordination of forms, keeping track of records, and other administrative processes around recruiting</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies<br />
              </span><br />
              The following competencies are considered necessary for success in the role of Staffing Coordinator<br />
              <br />
              Personal Credibility:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships <br />
              &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
              <br />
              HR Delivery:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Staffing<br />
              &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
              &nbsp;&nbsp;&nbsp;&#9642; HR Measurement <br />
              &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance <br />
              <br />
              Business Knowledge: 
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
              <br />
              Strategic Contribution: <br />
            &nbsp;&nbsp;&nbsp;&#9642; Organizational Awareness</p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              <%IF rstSimple.Fields("UserOrganizationSize").Value = 2 Then%>
              <a href="http://www.elearning.shrm.org/midstaffing_development.aspx" target="_blank">Developmental Opportunities</a>
              <%Else%>
              <a href="http://www.elearning.shrm.org/largestaffing_development.aspx" target="_blank">Developmental Opportunities</a>
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&hellip;and more </p>
            <p>&nbsp;</p>
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
