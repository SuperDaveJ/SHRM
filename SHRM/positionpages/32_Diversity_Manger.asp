<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Director of Human Resources</title>


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
	  <tr>
        <td valign="top"><p><span class="main">Diversity Program Manager</span><br />
          <br />
              <span class="sub">Description of the Role</span><br />
          <br />
          The Diversity Program Manager is organizing and implementing all diversity training programs within the organization.  S/he will assist management with not only understanding individual differences but also to work with and manage others in a manner that maximizes everyone&rsquo;s contribution to the organization.  In addition they will create an environment where not only are diverse people recruited into the organization but also both the company and the individual work together to develop a mutually beneficially relationship. </p>
          <p><span class="sub">Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Diversity Program Manager. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:</p>
         <%if strActionPlan <> 0 Then%>
		 <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><p><span class="sub">Required Experience</span> <br />
                <br />
<%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                    <span class="style1">o</span>
                    <%Else%>
                    <span class="style1">&thorn;</span>
                    <% End If %>
Bachelor&rsquo;s Degree in Business, HR or related field <br />
<%IF rstSimple.Fields("UserHRExperience").Value < 7 Then%>
              <span class="style1">o</span>
              <%Else%>
              <span class="style1">&thorn;</span>
              <% End If %>
7+ years of work experience in the area of diversity <br />
&nbsp;&nbsp;<span class="style1">o</span> Experience in training and facilitating skills on sensitive topics<br />
&nbsp;&nbsp;<span class="style1">o</span> Leadership experience<br />
&nbsp;&nbsp;<span class="style1">o</span> Excellent presentation and facilitation skills <br />
&nbsp;&nbsp;<span class="style1">o</span> Effective verbal and written communication skills<br />
&nbsp;&nbsp;<span class="style1">o</span> Experience working with all levels in an organization <br />
<br />
<span class="sub">Preferred Experience</span> <br />
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
PHR/SPHR <br />
&nbsp;&nbsp;<span class="style1">o</span> Second language </td>
            </tr>
          </table>
		 <%Else%>
          <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><p><span class="sub">Required Experience</span> <br />
                <br />
&nbsp;&nbsp;<span class="style1">o</span> Bachelor&rsquo;s Degree in Business, HR or related field <br />
&nbsp;&nbsp;<span class="style1">o</span> 7+ years of work experience in the area of diversity <br />
&nbsp;&nbsp;<span class="style1">o</span> Experience in training and facilitating skills on sensitive topics<br />
&nbsp;&nbsp;<span class="style1">o</span> Leadership experience<br />
&nbsp;&nbsp;<span class="style1">o</span> Excellent presentation and facilitation skills <br />
&nbsp;&nbsp;<span class="style1">o</span> Effective verbal and written communication skills<br />
&nbsp;&nbsp;<span class="style1">o</span> Experience working with all levels in an organization <br />
<br />
<span class="sub">Preferred Experience</span> <br />
<br />
&nbsp;&nbsp;<span class="style1">o</span> Master&rsquo;s Degree <br />
&nbsp;&nbsp;<span class="style1">o</span> PHR/SPHR <br />
&nbsp;&nbsp;<span class="style1">o</span> Second language </td>
            </tr>
          </table>
<%End If%>		  
          <p><span class="sub">Key Accountabilities</span><br />
            <br />
            &nbsp;&nbsp;&#9642; Assist with the development of policies and programs to attract, retain and promote a diverse workforce <br />
&nbsp;&nbsp;&nbsp;            for the organization<br />
            &nbsp;&nbsp;&#9642; Determine the appropriateness of introducing diversity initiatives and consider the unique needs of <br />
&nbsp;&nbsp;&nbsp;            the organization<br />
            &nbsp;&nbsp;&#9642; Train and educate employees and mangers on how to recognize, accommodate and appreciate<br />
&nbsp;&nbsp;&nbsp;            individual differences<br />
            &nbsp;&nbsp;&#9642; Develop, write, and coordinate diversity training manuals and materials <br />
            &nbsp;&nbsp;&#9642; Develop a means of measuring the effectiveness of the diversity initiative<br />
            &nbsp;&nbsp;&#9642; Keep current on diversity programs and development <br />
            &nbsp;&nbsp;&#9642; Provide coaching and diversity skills building to all levels of the organization<br />
            &nbsp;&nbsp;&#9642; Determine the appropriateness of introducing diversity initiatives and consider the unique needs of <br />
&nbsp;&nbsp;&nbsp;            the organization<br />
            &nbsp;&nbsp;&#9642; Acts as a liaison within the company to ensure coordination in the implementation of the diversity<br />
&nbsp;&nbsp;&nbsp;            strategy throughout the business <br />
            &nbsp;&nbsp;&#9642; Generates and analyzes diversity metrics <br />
            <br />
            <span class="sub">Primary Interfaces</span></p>
          <p>This role requires the Diversity Program Manager to interact with a variety of people and departments, which may include:<br />
            <br />
            &nbsp;&nbsp;&#9642; Internal Staff to determine diversity needs<br />
            &nbsp;&nbsp;&#9642; Diversity Affinity Groups (where applicable) to discuss the needs of diverse employee groups<br />
            &nbsp;&nbsp;&#9642; Organizational Development Consultant for direction, feedback and guidance <br />
            &nbsp;&nbsp;&#9642; Third Party Vendor to seek outside help with special diversity training</p>
          <p><span class="sub">Challenges in the Role</span><br />
            <br />
            Typical challenges associated with the Diversity Program Manager may include:<br />
            <br />
            &nbsp;&nbsp;&#9642; Dealing with and overcoming employee resistance to participating in diversity initiatives<br />
            &nbsp;&nbsp;&#9642; Continually identifying barriers to the success of diversity <br />
            &nbsp;&nbsp;&#9642; Gaining employee buy-in on diversity initiatives </p>
          <p><span class="sub">Key Competencies</span><br />
            <br />
            The following competencies are considered necessary for success in the role of Diversity Program Manager<br />
            <br />
            Strategic Contribution:<br />
&nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking<br />
&nbsp;&nbsp;&nbsp;&#9642; Team Leadership<br />
<br />
Personal Credibility:<br />
&nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
&nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
&nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
&nbsp;&nbsp;&nbsp;&#9642; Impact and Influence
<br />
<br />
HR Delivery:<br />
&nbsp;&nbsp;&nbsp;&#9642; Teamwork and Collaboration<br />
&nbsp;&nbsp;&nbsp;&#9642; Developing Others <br />
&nbsp;&nbsp;&nbsp;&#9642; HR Measurement <br />
&nbsp;&nbsp;&nbsp;&#9642; Legal Compliance&nbsp;<br />
<br />
&nbsp;Business Knowledge: <br />
&nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
          </p>
          <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
          <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
            Visit the <a href="http://www.elearning.shrm.org/largediversity_development.aspx" target="_blank">Developmental Opportunities</a> page of  the SHRM HR Career Guide for a complete listing of opportunities and resources  to help you prepare for this position. <br />
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
          <p class="main">&nbsp;</p>
          <p class="main">&nbsp;</p>
          </td>
      </tr>
	  <tr>
	    <td valign="top">&nbsp;</td>
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
    </table>
	<p>&nbsp;</p>    </td>
  </tr>
</table>

<div align="center"></div>
</body>
</html>
