<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Manager of Training and Development</title>


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
          <td valign="top"><p><span class="main">Manager of  Training and Organizational Development</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Manager of Training and Organizational Development is responsible for improving the productivity of an organization&rsquo;s employees. In addition s/he is also responsible for the effective development, coordination and presentation of training and development programs for all employees. It is essential that the incumbent assess organization-wide developmental needs to drive training initiatives.  Typically the main responsibility for the Manager is to identify, arrange and develop suitable training solutions for employees. S/he must also actively search, creatively design and implement effective methods to educate and enhance/recognize performance.   Provides direction and supervision to training and development team.<br />
            <br />
            <span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
            <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Manager of Training and Organizational Development. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:
            </p>
         <%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience </span><br />
                  <br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
                  Bachelor&rsquo;s Degree in Business or HR field <br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 5 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Master&rsquo;s Degree in Training and Development or related field<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 5 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  5 years of work experience<br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience fostering organizational change<br />
  <span class="style1">o</span> Highly effective coaching skills for interactions and interventions with senior managers <br />
  &nbsp;&nbsp;&nbsp; and supervisors<br />
  <span class="style1">o</span> Experience with leading edge training tools and technologies in graphics, computer-based <br />
  &nbsp;&nbsp;&nbsp; trainings and production of presentation materials <br />
  <br />
  <span class="sub">Preferred Experience </span><br />
  <br />
  <span class="style1">o</span> Second language (Spanish-speaking preferred)<br />
  <span class="style1">o</span> Minimum of 3 years of supervisory experience<br />
  <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" Then%>
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
                <td><p><span class="sub">Required Experience </span><br />
                  <br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree in Business or HR field <br />
  <span class="style1">o</span>
                  Master&rsquo;s Degree in Training and Development or related field<br />
  <span class="style1">o</span>
                  5 years of work experience<br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience fostering organizational change<br />
  <span class="style1">o</span> Highly effective coaching skills for interactions and interventions with senior managers <br />
  &nbsp;&nbsp;&nbsp; and supervisors<br />
  <span class="style1">o</span> Experience with leading edge training tools and technologies in graphics, computer-based <br />
  &nbsp;&nbsp;&nbsp; trainings and production of presentation materials <br />
  <br />
  <span class="sub">Preferred Experience </span><br />
  <br />
  <span class="style1">o</span> Second language (Spanish-speaking preferred)<br />
  <span class="style1">o</span> Minimum of 3 years of supervisory experience<br />
  <span class="style1">o</span>
                SPHR </td>
              </tr>
            </table>			
<% End If %>	
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Develop training curriculum for internal and external clients<br />
              &nbsp;&nbsp;&nbsp;&#9642; Participate in talent management process<br />
              &nbsp;&nbsp;&nbsp;&#9642; Produce quality, thorough trainings with little turn-around time<br />
              &nbsp;&nbsp;&nbsp;&#9642; Research topics, create content for the training and provide trainers with content and speaking notes to help in<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            the delivery of training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Administer and interpret assessments used for performance improvement<br />
              &nbsp;&nbsp;&nbsp;&#9642; Act as internal consultant to assist staff at all levels with team building, resume writing, leadership <br />
  &nbsp;&nbsp;&nbsp;            development,&nbsp;facilitation, and holding effective meetings  (OD Role) <br />
              &nbsp;&nbsp;&nbsp;&#9642; Determine the appropriateness of introducing diversity initiatives and consider the unique needs of the<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            organization<br />
              &nbsp;&nbsp;&nbsp;&#9642; Facilitate programs aimed at enhancing diversity<br />
              &nbsp;&nbsp;&nbsp;&#9642; Oversee internal consulting on needs assessment, work group performance improvement and change<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            management. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Lead and manage training team and develop performance plans for staff<br />
              &nbsp;&nbsp;&nbsp;&#9642; Establish positive working relationships and collaborate with others to achieve corporate goals<br />
              &nbsp;&nbsp;&nbsp;&#9642; Develop and manage corporate reward and recognition program<br />
              &nbsp;&nbsp;&nbsp;&#9642; Select vendors and negotiate contracts <br />
              &nbsp;&nbsp;&nbsp;&#9642; Display strong project planning and facilitation skills to research, design and deliver programs. <br />
              &nbsp;&nbsp;&nbsp;&#9642; Analyze complex issues, probe for ideas and present solutions<br />
              &nbsp;&nbsp;&nbsp;&#9642; Develop training materials including workbooks, instructor guides, audio-visual training materials, computer<br />
  &nbsp;&nbsp;&nbsp;&nbsp;            based training materials and job aid<br />
              &nbsp;&nbsp;&nbsp;&#9642; Understand adult learning theory in order to deliver effective training and develop materials relevant to meet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;the&nbsp;needs of adult learners<br />
              &nbsp;&nbsp;&nbsp;&#9642; Identify gaps between ideal and actual performance conditions, and determine cause of discrepancies and<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;develop programs accordingly<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manage department budget and monitor training budgets for other departments<br />
              <br />
              <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces<br />
              </span><br />
              This role requires the Manager of Training and Organizational Development to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to administer training <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managers for needs assessment, to gain support for training, and for organizational development needs<br />
              &nbsp;&nbsp;&nbsp;&#9642; CHRO for direction and guidance and share information about training <br />
              &nbsp;&nbsp;&nbsp;&#9642; Training Department Staff and HR Department to provide direction, coaching and feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendor to seek outside help with special training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Manager of Compensation and Benefits for performance awards process<br />
            &nbsp;&nbsp;&nbsp;&#9642; Employee Relations Manager and Diversity Affinity Groups (where applicable) to discuss the needs of diverse employee groups</p>
            <p><span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Manager of Training and Organizational Development may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Finding adequate facilities to deliver training and handling sudden lack of resources<br />
              &nbsp;&nbsp;&nbsp;&#9642; Dealing with and overcoming employee resistance to participating in training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping abreast of changes in the organization, technology, and marketplace in order to keep training current <br />
              &nbsp;&nbsp;&nbsp;&#9642; Building and maintaining rapport with management through out the organization in order to get the support<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;needed to successfully administer training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Addressing the needs of individuals with disabilities and creating solutions to aid them in training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Ensuring employee participation in mandated training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling employees that are not accepting of change, new organizational changes and programs<br />
              &nbsp;&nbsp;&nbsp;&#9642; Providing long-lasting solutions<br />
              <br />
              <span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Manager of Training and Organizational Development<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Political Savvy<br />
              &nbsp;&nbsp;&nbsp;&#9642; Analytical Thinking <br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Impact and Influence<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Developing Others <br />
  <br />
              Business Knowledge:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Efficiency and Organizational Skills          </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/largeod_training_development.aspx" target="_blank">Developmental Opportunities</a>
              
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
              <br />
            </p>
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
