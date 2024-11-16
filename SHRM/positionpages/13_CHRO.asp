<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Chief Human Resources Officer</title>


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
          <td valign="top"><h1>Chief Human Resources Officer
            </h1>
            <h2>Description of the Role</h2>
            <p>The Chief Human Resources Officer is responsible for providing vision, strategy, and human resources expertise of workforce issues.  S/he will initiate, direct, manage and supervise all aspects of human resource issues, programs and policies.  In addition s/he will make recommendations to the CEO for improvement of the policies, procedures, and practices on various matters.  S/he will communicate changes in human resources to staff, and interface with all staff on related human resources issues.   It is also his/her responsibility to take initiatives to make the human resources department more strategic and align with the goals of the organization. 
            <h2><a name="prep" id="prep"></a>Preparation for the Role</h2>
            <p>The following experience and recommended qualifications have been cited as useful for preparation as a Chief Human Resources Officer. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
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
                    Bachelor&rsquo;s Degree in Business or HR<br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 5 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                    Master&rsquo;s Degree in Human Resources or related field<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 15 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                    15+ years of experience in human resources <br />
  <span class="style1">o</span> At least 5 years at the executive/strategic level <br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> Knowledge of various HR areas<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <%IF rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                    SPHR certification<br />
  <span class="style1">o</span> Finance or accounting courses<br />
  <span class="style1">o</span> Manager or Director level position in operations</td>
              </tr>
            </table>
<%Else%>	
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                    <br />
                    <span class="style1">o</span>
                    Bachelor&rsquo;s Degree in Business or HR<br />
  <span class="style1">o</span>
                    Master&rsquo;s Degree in Human Resources or related field<br />
  <span class="style1">o</span>
                    15+ years of experience in human resources <br />
  <span class="style1">o</span> At least 5 years at the executive/strategic level <br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and <br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> Knowledge of various HR areas<br />
  <br />
  <span class="sub">Preferred Experience</span><br />
  <br />
  <span class="style1">o</span>
                    SPHR certification<br />
  <span class="style1">o</span> Finance or accounting courses<br />
  <span class="style1">o</span> Manager or Director level position in operations</td>
              </tr>
            </table>
<% End If %>		
            <h2><a name="key" id="key"></a>Key Accountabilities</h2>
            <p>
              &nbsp;&nbsp;&nbsp;&#9642; Administration, coordination and evaluation of the human resources function for the organization<br />
              &nbsp;&nbsp;&nbsp;&#9642; Consult with internal and external legal counsel <br />
              &nbsp;&nbsp;&nbsp;&#9642; Assist in the annual review, preparation and administration of the wage and salary program <br />
              &nbsp;&nbsp;&nbsp;&#9642; Is a member of the executive team <br />
              &nbsp;&nbsp;&nbsp;&#9642; Overall responsibility for HR programs and services including compensation, benefits, training and <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            development, employee relations, workforce planning, policy compliance, recruiting, etc<br />
              &nbsp;&nbsp;&nbsp;&#9642; Lead HR in alignment with strategic priorities <br />
              &nbsp;&nbsp;&nbsp;&#9642; Promote a workplace culture that supports people doing their best work<br />
              &nbsp;&nbsp;&nbsp;&#9642; Facilitate organizational goal setting efforts <br />
              &nbsp;&nbsp;&nbsp;&#9642; Talent management particularly succession planning at the C-suite level<br />
              &nbsp;&nbsp;&nbsp;&#9642; Influence, persuade and inspire others to take action based on the vision and strategic objectives
              </h2>
            <h2><a name="primary" id="primary"></a>Primary Interfaces</h2>
              <p>This role requires the Chief Human Resources Officer to interact with a variety of people and departments, which may include:<br />
                <br />
                &nbsp;&nbsp;&nbsp;&#9642; Executive Team to collaborate with on strategic initiatives <br />
                &nbsp;&nbsp;&nbsp;&#9642; CEO to support his or her objectives<br />
                &nbsp;&nbsp;&nbsp;&#9642; General Counsel for advice on HR related issues<br />
                &nbsp;&nbsp;&nbsp;&#9642; Human Resources Staff  to provide big picture direction<br />
                &nbsp;&nbsp;&nbsp;&#9642; Staff to share communications and provide vision strategy and HR expertise 
              <h2><a name="challenges" id="challenges"></a>Challenges in the Role</h2>
            <p>
              Typical challenges associated with the Chief Human Resources Officer may include:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Ensuring that managers with delegated authorities have the tools to achieve results expected of them <br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining a strategic focus that aligns with the organizational goals<br />
              &nbsp;&nbsp;&nbsp;&#9642; Anticipating and managing human resources needs in a complex and rapidly changing internal and external<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;environment <br />
              &nbsp;&nbsp;&nbsp;&#9642; Providing knowledgeable, innovative best practice service to internal staff<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining a culture that supports people doing their best work and has continuous improvement <br />
              &nbsp;&nbsp;&nbsp;&#9642; Effectively translating the vision across multiple countries 
            <h2><a name="keycomp" id="keycomp"></a>Key Competencies</h2>
            <p>
              The following competencies are considered necessary for success in the role of Chief Human Resources Officer<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Culture Management<br />
              &nbsp;&nbsp;&nbsp;&#9642; Fast Change<br />
              &nbsp;&nbsp;&nbsp;&#9642; Strategic Decision Making<br />
              &nbsp;&nbsp;&nbsp;&#9642; Market Driven Connectivity <br />
              &nbsp;&nbsp;&nbsp;&#9642; Team Leadership<br />
  &nbsp;&nbsp;&nbsp;&#9642; Strategic Thinking<br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Achieving Results<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communication<br />
  &nbsp;&nbsp;&nbsp;&#9642; Impact and Influence <br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
  &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Collaboration
  <br />
            </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
                <br />
              Visit the
                
              <a href="http://www.elearning.shrm.org/largechro_development.aspx" target="_blank">Developmental Opportunities</a>
                
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
            <p>&nbsp;</p>
            <h1>&nbsp;</h1>          </td>
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
