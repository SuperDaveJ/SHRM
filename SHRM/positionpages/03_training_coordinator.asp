<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Training Coordinator</title>


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
          <td valign="top"><span class="main">Training Coordinator</span>
            <p><span class="sub">Description of the Role<br />
              </span><br />
              The Training Coordinator is responsible for coordinating and providing administrative support for the delivery of training and development programs and services in addition to supporting the head of Training &amp; Organizational Development.  S/he coordinates vendors and contracts related to training.  S/he monitors the progress of training programs.  It is his/her responsibility to prepare facilitators and participants for training programs and provide pre-course requirements, follow-up, and evaluations.   S/he acts as the primary department contact and gathers information and makes recommendations on all training matters. <br />
              <span class="sub"><br />
              <a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Training Coordinator. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
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
                  Bachelor&rsquo;s Degree with concentration in Business Management, HR, or a related field<br />
  &nbsp;&nbsp;&nbsp;                (equivalent experience may be considered in lieu of degree)<br />
                  <%IF rstSimple.Fields("UserHRExperience").Value < 1 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
                  1-3 years prior experience in professional environment &ndash; preferably training or administrative<br />
                  <span class="style1">o</span> Ability to coordinate resources, prioritize and troubleshoot issues<br />
                  <span class="style1">o</span> Experience in a team environment<br />
                  <br />
                  <span class="sub">Preferred Experience<br />
                    </span><br />
                  <span class="style1">o</span> Customer Service experience
              </td></tr>
            </table>
  <%Else%>
  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td><p><span class="sub">Required Experience</span><br />
        <br />
        <span class="style1">o</span>
        Bachelor&rsquo;s Degree with concentration in Business Management, HR, or a related field<br />
  &nbsp;&nbsp;&nbsp;                (equivalent experience may be considered in lieu of degree)<br />
        <span class="style1">o</span>
        1-3 years prior experience in professional environment &ndash; preferably training or administrative<br />
        <span class="style1">o</span> Ability to coordinate resources, prioritize and troubleshoot issues<br />
        <span class="style1">o</span> Experience in a team environment<br />
        <br />
        <span class="sub">Preferred Experience<br />
          </span><br />
        <span class="style1">o</span> Customer Service experience
        </td></tr>
    </table>
  <%end if%>		  	  
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Handle training logistics such as location, room set up, audiovisual needs, etc.<br />
              &nbsp;&nbsp;&nbsp;&#9642; Prepare handouts and training materials<br />
              &nbsp;&nbsp;&nbsp;&#9642; Catalog training information<br />
              &nbsp;&nbsp;&nbsp;&#9642; Market training programs to staff <br />
              &nbsp;&nbsp;&nbsp;&#9642; Assist with tracking the training budget<br />
              &nbsp;&nbsp;&nbsp;&#9642; Track all staff training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Arrange for seminars or workshops <br />
              &nbsp;&nbsp;&nbsp;&#9642; Contract with outside groups to develop or provide training materials<br />
              &nbsp;&nbsp;&nbsp;&#9642; Build relationships with local institutions of higher education</p>
            <p><span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the Training Coordinator to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to aid in training and answer questions<br />
              &nbsp;&nbsp;&nbsp;&#9642; OD Specialist &amp; Trainer, Manager of Training &amp; Organizational Development  and HR Department to receive<br />
              &nbsp;&nbsp;&nbsp;&nbsp;            direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendors to seek outside help with training materials, etc.<br />
              <span class="sub"><br />
                <a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Training Coordinator may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Finding adequate facilities to deliver training and handling sudden lack of resources<br />
              &nbsp;&nbsp;&nbsp;&#9642; Ensuring employee participation in mandated training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Creating accommodations for a diverse workforce e.g. individuals with disabilities</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Training Coordinator:<br />
              &nbsp;<br />
              Personal Credibility: <br />
              &nbsp;&nbsp;&#9642; Personal Communications<br />
              <br />
              Strategic Contribution:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Decision-Making<br />
  &nbsp;&nbsp;&nbsp;&#9642; Initiative<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Customer Focus<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Efficiency and Organization&nbsp;<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Cooperation<br />
              <br />
              If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
                <br />
              Visit the
              <%IF rstSimple.Fields("UserOrganizationSize").Value = 2 Then%>
              <a href="http://www.elearning.shrm.org/midrecruiter_development.aspx" target="_blank">Developmental Opportunities</a>
              <%Else%>
              <a href="http://www.elearning.shrm.org/largesrrecruiter_development.aspx">Developmental Opportunities</a>
              <% End If %>
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
            &nbsp;&nbsp;&nbsp;&hellip;and more </p>
          <p>&nbsp;</p></td></tr>
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
