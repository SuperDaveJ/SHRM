<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>Trainer</title>


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
          <td valign="top"><p><span class="main">Trainer</span><br />
            <br />
            <span class="sub">Description of the Role</span><br />
            <br />
            The Trainer is responsible for identifying, designing and implementing training strategies, programs and interventions to meet the strategic goals and objectives of the organization.  S/he assesses requests for training and development opportunities, and conducts needs assessments for training programs.  It is also his/her responsibility to serve as an internal management and educational coach/consultant.  S/he will facilitate training and conduct measurement and evaluation of training programs.  S/he must be familiar with instructional technologies in order to implement online training courses. </p>
            <p><span class="sub"><a name="prep" id="prep"></a>Preparation for the Role</span><br />
              <br />
            The following experience and recommended qualifications have been cited as useful for preparation as a Trainer. Those seeking this position should have proven experience and/or qualifications in one or more of the following areas:          </p>
<%if strActionPlan <> 0 Then%>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience<br />
                  </span><br />
                  <%IF rstSimple.Fields("UserMaxEducation").Value < 3 Then%>
                  <span class="style1">o</span>
                  <%Else%>
                  <span class="style1">&thorn;</span>
                  <% End If %>
                  Bachelor&rsquo;s Degree<br />
  <%IF rstSimple.Fields("UserHRExperience").Value < 3 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  3-5 years of work experience<br />
  <span class="style1">o</span> Experience in training design or delivery <br />
  <span class="style1">o</span> Experience in defining customer needs and developing solutions <br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience working with all levels in an organization <br />
  <br />
  <span class="sub">Preferred Experience </span><br />
  <br />
  <%IF rstSimple.Fields("UserCert_PHR").Value <> "yes" AND rstSimple.Fields("UserCert_SPHR").Value <> "yes" Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  PHR/SPHR preferred<br />
  <%IF rstSimple.Fields("UserMaxEducation").Value < 5 Then%>
  <span class="style1">o</span>
  <%Else%>
  <span class="style1">&thorn;</span>
  <% End If %>
                  Master&rsquo;s Degree preferred in Adult Education, Organizational Development, Business,  <br />
  &nbsp;&nbsp;&nbsp; Instructional Systems, HR or other related degree </td>
              </tr>
            </table>
<%Else%>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td><p><span class="sub">Required Experience<br />
                  </span><br />
                  <span class="style1">o</span>
                  Bachelor&rsquo;s Degree<br />
  <span class="style1">o</span>
                  3-5 years of work experience<br />
  <span class="style1">o</span> Experience in training design or delivery <br />
  <span class="style1">o</span> Experience in defining customer needs and developing solutions <br />
  <span class="style1">o</span> Excellent presentation and facilitation skills <br />
  <span class="style1">o</span> Effective verbal and written communication skills<br />
  <span class="style1">o</span> Experience working with all levels in an organization <br />
  <br />
  <span class="sub">Preferred Experience </span><br />
  <br />
  <span class="style1">o</span>
                  PHR/SPHR preferred<br />
  <span class="style1">o</span>
                  Master&rsquo;s Degree preferred in Adult Education, Organizational Development, Business,  <br />
                  <span class="style1">o</span> Instructional Systems, HR or other related degree </td>
              </tr>
            </table>
  <% End If %>			
            <p><span class="sub"><a name="key" id="key"></a>Key Accountabilities</span><br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Help create presentations and training programs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Facilitate training courses <br />
              &nbsp;&nbsp;&nbsp;&#9642; Conduct needs analysis, and develop training programs based on needs of employees, department leaders and<br />
  &nbsp;            &nbsp;&nbsp;&nbsp;organization <br />
              &nbsp;&nbsp;&nbsp;&#9642; Review evaluations of training course objectives and accomplishments and track training progress <br />
              &nbsp;&nbsp;&nbsp;&#9642; Administer and interpret assessments used for performance improvement<br />
              &nbsp;&nbsp;&nbsp;&#9642; Provide assessment feedback<br />
              &nbsp;&nbsp;&nbsp;&#9642; Formulate teaching outline and determine instructional methods such as individual training, group instruction, &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lectures, demonstrations, conferences, meetings and workshops<br />
              &nbsp;&nbsp;&nbsp;&#9642; Understand and apply adult learning theory in order to deliver effective training and develop materials relevant <br />
  &nbsp;&nbsp;&nbsp;&nbsp;            to meet the needs of adult learners<br />
              &nbsp;&nbsp;&nbsp;&#9642; Select courses off the shelf <br />
              &nbsp;&nbsp;&nbsp;&#9642; Participate in selection of training vendors<br />
              &nbsp;&nbsp;&nbsp;&#9642; Use instructional design principles to design training courses<br /> 
              <br />
            <span class="sub"><a name="primary" id="primary"></a>Primary Interfaces</span></p>
            <p>This role requires the Trainer to interact with a variety of people and departments, which may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Internal Staff to administer training <br />
              &nbsp;&nbsp;&nbsp;&#9642; Managers for needs assessment and to gain support for training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Director of Training and Organizational Development  for direction, feedback and guidance <br />
              &nbsp;&nbsp;&nbsp;&#9642; Third Party Vendor to seek outside help with special training<br />
              <br />
              <span class="sub"><a name="challenges" id="challenges"></a>Challenges in the Role</span><br />
              <br />
              Typical challenges associated with the Trainer may include:<br />
              <br />
              &nbsp;&nbsp;&nbsp;&#9642; Dealing with and overcoming employee resistance to participating in training, particularly in mandated training<br />
              &nbsp;&nbsp;&nbsp;&#9642; Handling employees that are not accepting of change and new training programs <br />
              &nbsp;&nbsp;&nbsp;&#9642; Keeping abreast of changes in the organization, technology, and marketplace in order to keep training current <br />
            &nbsp;&nbsp;&nbsp;&#9642; Addressing the needs of individuals with disabilities and creating solutions to aid them in training</p>
            <p><span class="sub"><a name="keycomp" id="keycomp"></a>Key Competencies</span><br />
              <br />
              The following competencies are considered necessary for success in the role of Trainer<br />
              <br />
              Strategic Contribution:<br />
              &nbsp;&nbsp;&nbsp;&#9642; Culture Management <br />
              &nbsp;&nbsp;&nbsp;&#9642; Decision Making<br />
              &nbsp;&nbsp;&nbsp;&#9642; Conceptual Thinking<br />
  &nbsp;&nbsp;&nbsp;&#9642; Initiative <br />
              <br />
              Personal Credibility:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Personal Communications<br />
  &nbsp;&nbsp;&nbsp;&#9642; Effective Relationships<br />
  &nbsp;&nbsp;&nbsp;&#9642; Impact and Influence<br />
  <br />
              HR Delivery:<br />
  &nbsp;&nbsp;&nbsp;&#9642; Development<br />
  &nbsp;&nbsp;&nbsp;&#9642; Organizational Structure <br />
  &nbsp;&nbsp;&nbsp;&#9642; Teamwork and Collaboration          </p>
            <p>If you would like to find  out more about HR Competencies, visit the HR Competency Toolkit site at <a href="http://www.shrm.org/competencies">www.shrm.org/competencies</a>.</p>
            <p><span class="sub"><a name="devop" id="devop"></a>Developmental Opportunities</span><br />
              <br />
              Visit the
              
              <a href="http://www.elearning.shrm.org/HR_largetrainer_development.aspx " target="_blank">Developmental Opportunities</a>
              
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
