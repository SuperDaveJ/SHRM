<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>HRIS Analyst</title>


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
          <td valign="top"><p class="main">HRIS Analyst</p>
            <p>The HRIS Analyst is responsible for the administration and coordination of human resources system projects and meeting all professional standards for human resources and systems development and implementation. This individual serves as a technical point-of-contact for assigned functional areas and assists subject matter experts with ensuring data integrity, testing of system changes, report writing and analyzing data flows for process improvement opportunities. The HRIS Analyst also supports HRIS upgrades, patches, testing and other technical projects as assigned.<br />
              <br />
              <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as an HRIS Analyst. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
     <%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 2 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
                  Associate&rsquo;s Degree with concentration in Management of Information Systems,<br />
  &nbsp;&nbsp;&nbsp; Computer Science, Business Management, HR or a related field<br />
  <span class="style1">o</span> 3 to 5 years of experience as a human resource analyst/administrator/technician; information<br />
  &nbsp;&nbsp;&nbsp; systems analyst/technician; internal auditors or other positions with appropriate experience <br />
  &nbsp;&nbsp;&nbsp; and/or education.<br />
  <span class="style1">o</span> Strong understanding of HR processes and data, including eligibility and enrollment rules, and benefit<br />
  &nbsp;&nbsp;&nbsp;            procedures in order to ensure correct implementation.<br />
  <span class="style1">o</span> Strong understanding of HRIS database design, structure, functions and processes, and <br />
  &nbsp;&nbsp;&nbsp; experience with databases tools.<br />
  <span class="style1">o</span> Excellent interpersonal, organizational and customer service skills. <br />
  <span class="style1">o</span> Knowledgeable in use of the Internet and appropriate computer applications<br />
  <br />
  <span class="sub">Preferred Experience</span> <br />
  <br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Bachelor&rsquo;s degree <br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and<br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> HRIS experience, especially with applicant tracking systems</td>
              </tr>
            </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience</span><br />
                  <br />
                  <span class="style1">o</span>
                  Associate&rsquo;s Degree with concentration in Management of Information Systems,<br />
  &nbsp;&nbsp;&nbsp; Computer Science, Business Management, HR or a related field<br />
  <span class="style1">o</span> 3 to 5 years of experience as a human resource analyst/administrator/technician; information<br />
  &nbsp;&nbsp;&nbsp; systems analyst/technician; internal auditors or other positions with appropriate experience <br />
  &nbsp;&nbsp;&nbsp; and/or education.<br />
  <span class="style1">o</span> Strong understanding of HR processes and data, including eligibility and enrollment rules, and benefit<br />
  &nbsp;&nbsp;&nbsp;            procedures in order to ensure correct implementation.<br />
  <span class="style1">o</span> Strong understanding of HRIS database design, structure, functions and processes, and <br />
  &nbsp;&nbsp;&nbsp; experience with databases tools.<br />
  <span class="style1">o</span> Excellent interpersonal, organizational and customer service skills. <br />
  <span class="style1">o</span> Knowledgeable in use of the Internet and appropriate computer applications<br />
  <br />
  <span class="sub">Preferred Experience</span> <br />
  <br />
  <span class="style1">o</span>
                  Bachelor&rsquo;s degree <br />
  <span class="style1">o</span> Effective verbal and written communication skills and ability to communicate internally and<br />
  &nbsp;&nbsp;&nbsp; externally at all levels<br />
  <span class="style1">o</span> HRIS experience, especially with applicant tracking systems</td>
              </tr>
            </table>
	<%End If%>
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Assist in the review, testing and implementation of HRIS system upgrades or patches. Collaborate with <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            functional and technical staff to coordinate application of upgrade or fix. Maintain HRIS system tables. <br />
  &nbsp;&nbsp;&nbsp;&nbsp; Document process and results.<br />
              &nbsp;&nbsp;&nbsp;&#9642; Provide support for HRIS including, but not limited to, researching and resolving HRIS problems, unexpected<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;results or process flaws; perform scheduled activities; recommend solutions or alternate methods to meet<br />
  &nbsp; &nbsp;&nbsp;&nbsp;requirements.<br />
              &nbsp;&nbsp;&nbsp;&#9642; Recommend process/customer service improvements, innovative solutions, and policy changes. Serve as a key<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;liaison with third parties and other stakeholders (e.g. payroll). <br />
              &nbsp;&nbsp;&nbsp;&#9642; Write, maintain and support a variety of reports or queries utilizing appropriate reporting tools. Assist in the<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;development of standard reports for ongoing customer needs. Help maintain data integrity in systems by <br />
  &nbsp;&nbsp;&nbsp;&nbsp; running queries and analyzing data.<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintain awareness of current trends in HRIS with a focus on product and service development, delivery and<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            support, and applying key technologies. Examine trends in information systems training, materials and<br />
  &nbsp; &nbsp;&nbsp;&nbsp;techniques. Through classes, reading, CBTs or other mechanisms, continuously increase both HR knowledge <br />
  &nbsp;&nbsp;&nbsp;&nbsp; and HRIS application/tools knowledge. Participate in user group meetings/conferences. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Solicit feedback and identify overall needs of HRIS end users. Prepare and distribute timely and appropriate <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            HRIS&nbsp;communications. Serve as lead resource for input and maintenance of the HRIS intranet site. Seek out <br />
  &nbsp;&nbsp;&nbsp;&nbsp; new&nbsp;opportunities to promote HRIS functionality via using the intranet. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Develop and conduct in-house HRIS training programs to end-users. Develop and maintain up-to-date end user<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            training manuals and materials. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Establish and maintain up-to-date HRIS functional departmental documentation, standard operating procedures,<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;as well a comprehensive HRIS reports library. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Act as a liaison between the HR group and IT group. Participate in the testing of new reports, processes, etc,. <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            and&nbsp;provide testing results to appropriate resources. Actively participate and make contributions in team <br />
  &nbsp;&nbsp;&nbsp;&nbsp; meetings and one-on-one meetings. </p>
            <p><span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span><br />
              <br />
              This role requires the HRIS Analyst to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to train HRIS users and assist with questions, etc<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manager of Compensation and Manager of Benefits to receive direction <br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the HRIS Analyst may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Working with other analysts to develop and maintain requirement management and change management &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;processes<br />
              &nbsp;&nbsp;&nbsp;&#9642; Maintaining awareness of current trends with a focus on innovative product and service development, delivery<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            and support <br />
              &nbsp;&nbsp;&nbsp;&#9642; Receiving little instruction on day-to-day work <br />
              &nbsp;&nbsp;&nbsp;&#9642; Acting as a liaison to all levels of users throughout the company<br />
            </p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of HRIS Analyst:<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Innovation<br />
              &nbsp;&nbsp;&nbsp;&#9642; Decision-making and Judgment <br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; HR Technology<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure<br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Information Seeking<br />
  <br />
              HR Technology:
  <br />
  <br />
              <br />
            If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largehris_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
