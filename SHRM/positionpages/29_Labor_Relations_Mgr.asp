<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Labor Relations Manager</title>


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
          <td valign="top"><p><span class="main">Labor Relations Manager</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Labor Relations Manager is responsible for company wide labor relations matters, including conducting human resource audits, administering and monitoring EEO and workplace diversity efforts, and counseling management on labor relation issues.   S/he also represents the organization when dealing with unions and DOL, etc. <br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Labor Relations Manager. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:</p>
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
                  Bachelor&rsquo;s Degree in Business Administration or Psychology <br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 10 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  8-10 years in labor relations <br />
  <span class="style1">o</span> Strong knowledge of labor laws, collective bargaining agreements and HR laws<br />
  <span class="style1">o</span> Strong communication skills (written and verbal) <br />
  <span class="style1">o</span> Excellent negotiation and presentation skills<br />
  <span class="style1">o</span> Experience with unions <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <%IF rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  SPHR certification<br />
  <span class="style1">o</span> Bi-lingual in Spanish</td>
              </tr>
            </table>
	<%Else%>
	<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree in Business Administration or Psychology <br />
  <span class="style1">o</span>
                  8-10 years in labor relations <br />
  <span class="style1">o</span> Strong knowledge of labor laws, collective bargaining agreements and HR laws<br />
  <span class="style1">o</span> Strong communication skills (written and verbal) <br />
  <span class="style1">o</span> Excellent negotiation and presentation skills<br />
  <span class="style1">o</span> Experience with unions <br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span>
                  SPHR certification<br />
  <span class="style1">o</span> Bi-lingual in Spanish</td>
              </tr>
            </table>
	<% End If %>		
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
  &nbsp;&nbsp;&nbsp;&#9642; Provide counsel to managers on a wide range of labor issues<br />
  &nbsp;&nbsp;&nbsp;&#9642; Act as the key liaison with union representatives in resolving union-related grievances to ensure contractual<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;compliance<br />
  &nbsp;&nbsp;&nbsp;&#9642; Handle day-to-day interpretation and administration of the collective bargaining agreement<br />
  &nbsp;&nbsp;&nbsp;&#9642; Participate in contract negotiations<br />
  &nbsp;&nbsp;&nbsp;&#9642; Assist with compliance activities, charges and lawsuits<br />
              <br />
              <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Labor Relations Manager to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to help them in avoiding breeches of labor agreements and help them respond to claims of<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;breeches of contracts<br />
  &nbsp;&nbsp;&nbsp;&#9642; VP of HR to receive direction, coaching and feedback <br />
  &nbsp;&nbsp;&nbsp;&#9642; Employees to assist in counseling them on labor issues <br />
  &nbsp;&nbsp;&nbsp;&#9642; Union Leadership and Stewards to discuss corporate policies and practices <br />
  &nbsp;&nbsp;&nbsp;&#9642; General Council and External Council for legal matters<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Labor Relations Manager may include:<br />
              <br />
  &nbsp;&nbsp;&nbsp;&#9642; Maintaining objectivity and legal compliance with dealing with labor relations issues<br />
  &nbsp;&nbsp;&nbsp;&#9642; Handling the sensitivity around union issues<br />
  &nbsp;&nbsp;&nbsp;&#9642; Having integrity and discretion with dealing with all issues<br />
  &nbsp;&nbsp;&nbsp;&#9642; Finding win/win solutions <br />
  &nbsp;&nbsp;&nbsp;&#9642; Maintaining positive relationships with unions</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Labor Relations Manager<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Decision-making<br />
              &nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Impact and Influence <br />
  &nbsp;&nbsp;&nbsp;&#9642; Listening and Responding<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Negotiation <br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
            </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largelabor_development.aspx" target="_blank">Developmental Opportunities</a>
              
              page of  the SHRM HR Career Guide for a complete listing of opportunities and resources  to help you prepare for this position. <br />
              The Developmental Opportunities provide you with the  most pertinent information specific to this role.&nbsp; These opportunities include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM Academy<br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM A-Z Index <br />
              &nbsp;&nbsp;&nbsp;&#9642; HR Certification <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM Conferences <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM e-Learning <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM Foundation <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM Seminar Series <br />
              &nbsp;&nbsp;&nbsp;&#9642; SHRM&nbsp;Store<br />
              &nbsp;&nbsp;&nbsp;&hellip;and more<br />
              <br />
            </p>
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
