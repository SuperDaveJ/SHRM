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
        <td valign="top"><p class="main">Director of Human Resources </p>
          <p><span class="sub">Description of Role</span><br />
            <br />
            The Director of Human Resources is responsible for providing human resources expertise and consultation to both executives and employees.  S/he will oversee the development, implementation and oversight of HR policies, programs and services.  It is his/her responsibility to analyze wage and salary reports to determine competitive compensation plans and establish salary structure and pay policies.  In addition, the Director of HR will manage recruiting, benefits, employee relations and training.  S/he will recommend and coordinate use of external consultants, insurance brokers, carriers, and other outside sources. S/he will build alliances and relationships with the management team and help improve organizational performance.<br /> 
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Director of Human Resources. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
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
              Bachelors degree in Human Resources or related field <br />
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
              15+ years of progressive experience in human resources <br />
              <span class="style1">o</span> Minimum of 3 years at the senior management or executive level<br />
              <span class="style1">o</span> Must be a seasoned HR executive<br />
              <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and externally <br />
              &nbsp;&nbsp;&nbsp;            at all levels<br />
              <span class="style1">o</span> Knowledge of various HR areas<br />
              <span class="style1">o</span> Knowledge of all applicable federal and state employment laws <br />
              <span class="style1">o</span> Ability to read, analyze, and interpret professional journals, financial reports and legal documents <br />
              <br />
              <span class="sub">Preferred Experience</span> <br />
              <br />
              <%IF rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
              <span class="style1">o</span>
              <%Else%>
              <span class="style1">&thorn;</span>
              <% End If %>
              SPHR certification <br />
              <span class="style1">o</span> Finance or Accounting courses <br />
              <span class="style1">o</span> Operations position (managerial or director) experience <br />
              <span class="style1">o</span> Second language (Spanish preferred)</p></td>
          </tr>
        </table>
		<%Else%>		  
		  <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td><p><span class="sub">Required Experience</span> <br />
                      <br />
                      <span class="style1">o</span> Bachelors degree in Human Resources or related field <br />
                      <span class="style1">o</span> Master&rsquo;s Degree in Human Resources or related field<br />
                      <span class="style1">o</span> 15+ years of progressive experience in human resources <br />
                      <span class="style1">o</span> Minimum of 3 years at the senior management or executive level<br />
                      <span class="style1">o</span> Must be a seasoned HR executive<br />
                      <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and externally <br />
                &nbsp;&nbsp;&nbsp;            at all levels<br />
                <span class="style1">o</span> Knowledge of various HR areas<br />
                <span class="style1">o</span> Knowledge of all applicable federal and state employment laws <br />
                <span class="style1">o</span> Ability to read, analyze, and interpret professional journals, financial reports and legal documents <br />
                <br />
                <span class="sub">Preferred Experience</span> <br />
                <br />
                <span class="style1">o</span> SPHR certification <br />
                <span class="style1">o</span> Finance or Accounting courses <br />
                <span class="style1">o</span> Operations position (managerial or director) experience <br />
                <span class="style1">o</span> Second language (Spanish preferred)</p></td>
            </tr>
          </table>
		  <%End If%>
		  <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
            <br />
            &nbsp;&nbsp;&#9642; Develop and manage a world class HR function that provides business partnership at all levels of HR<br />
            &nbsp;&nbsp;&#9642; Consult with department leaders on the appropriate strategic and tactical actions regarding their HR needs<br />
            &nbsp;&nbsp;&#9642; Partner with team members to successfully communicate and execute HR programs and initiatives <br />
            &nbsp;&nbsp;&#9642; Identify opportunities to coach and develop managers and provide performance-related feedback<br />
            &nbsp;&nbsp;&#9642; Serve as the SME for staff human resource issues <br />
            &nbsp;&nbsp;&#9642; Develop and administer all HR functions with support from HR assistant <br />
            &nbsp;&nbsp;&#9642; Evaluate and advise on the impact of the long range planning of new programs/strategies and regulatory <br />
&nbsp;&nbsp;&nbsp;            action as those items impact employees <br />
            &nbsp;&nbsp;&#9642; Manage salary planning process, and analyze plans and maintain program competitiveness and <br />
&nbsp;&nbsp;&nbsp;            legal compliance<br />
            &nbsp;&nbsp;&#9642; Seek innovative benefits products to enhance organization&rsquo;s benefit package<br />
            &nbsp;&nbsp;&#9642; Make pay decisions, policy and guideline interpretation and job evaluations<br />
            &nbsp;&nbsp;&#9642; Manage recruiting program, interviewing and hiring and handle relationships with staffing agencies<br />
            &nbsp;&nbsp;&#9642; Create offer packages and handle new hire orientation<br />
            &nbsp;&nbsp;&#9642; Handle employee relations issues <br />
            &nbsp;&nbsp;&#9642; Manage training needs and facilitate needed training for employees<br />
            &nbsp;&nbsp;&#9642; Oversee internal consulting on needs assessment, work group performance improvement, change <br />
&nbsp;&nbsp;&nbsp;            management and other OD needs</p>
          <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
            <br />
            The following competencies are considered necessary for success in the role of the Director of Human Resources
            <br />
            <br />
Strategic Contribution:<br />
&nbsp;&nbsp;&nbsp;&#9642; Strategic Thinking<br />
&nbsp;&nbsp;&nbsp;&#9642; Fast Change<br />
              <br />
            Personal Credibility:<br />
&nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
&nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
&nbsp;&nbsp;&nbsp;&#9642; Interpersonal Understanding<br />
&nbsp;&nbsp;&nbsp;&#9642; Impact and Influence<br />
&nbsp;&nbsp;&nbsp;&#9642; Integrity<br />
  <br />
            HR Delivery:<br />
&nbsp;&nbsp;&nbsp;&#9642; Staffing<br />
&nbsp;&nbsp;&nbsp;&#9642; Developing Others <br />
&nbsp;&nbsp;&nbsp;&#9642; HR Measurement <br />
&nbsp;&nbsp;&nbsp;&#9642; Legal Compliance<br />
<br />
            <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
            <br />
            This role requires the Director of Human Resources to interact with a variety of people and departments, which may include:<br />
            <br />
&nbsp;&nbsp;&#9642; Human Resources Assistant  to provide guidance, feedback and receive support <br />
&nbsp;&nbsp;&#9642; Employees to communicate HR initiatives, administer training, etc<br />
&nbsp;&nbsp;&#9642; Department Heads to determine HR needs<br />
&nbsp;&nbsp;&#9642; Outside Vendors to determine which ones to select and to seek support with HR needs<br />
            <br />
            <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
            <br />
            Typical challenges associated with the Director of Human Resources may include:<br />
            <br />
&nbsp;&nbsp;&#9642; Anticipating and managing human resources needs in a complex and rapidly changing internal and <br />
&nbsp;&nbsp;&nbsp;            external environment <br />
&nbsp;&nbsp;&#9642; Providing knowledgeable, innovative best practice service to internal staff<br />
&nbsp;&nbsp;&#9642; Helping create innovative ways of making HR practices more efficient <br />
&nbsp;&nbsp;&#9642; Partnering with business units from a HR perspective by evaluating the organization and identifying <br />
&nbsp;&nbsp;&nbsp;            proper areas for HR initiatives<br />
            <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
          <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
            Visit the
  <a href="http://www.elearning.shrm.org/directorhr_development.aspx" target="_blank">Developmental Opportunities</a>
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
          <p></p>
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
