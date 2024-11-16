<?php

	class db
	{
		var $classMethods = array("runGreen","runYellow","runRed","runAuth","runAddName","runAddAns","runURL","runGetans");

		function db()
		{
		$this->init();
		}

		function init(){
		} 
		
/*******************************************************************
*	FUNCTION: Green Check
*	Purpose: returns Highest Matches
********************************************************************/
		
		function runGreen($currentposition,$currentorgsize,$neworgsize,$functionalarea){
		$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);
  			$rs = $db->Execute("SELECT tblpositionmappings.NewPosition FROM tblposition INNER JOIN tblpositionmappings ON tblposition.ID = tblpositionmappings.NewPosition WHERE (((tblpositionmappings.CurrentPosition)=$currentposition) AND ((tblpositionmappings.DegreeMatch)=3) AND ((tblpositionmappings.CurrentOrgSize)=$currentorgsize) AND ((tblpositionmappings.NewOrgSize)=$neworgsize) AND ((tblpositionmappings.FunctionalArea)=$functionalarea))");
		
		$resultSet = array();
    		$rowcount = 0;
			while (!$rs->EOF) {
				$resultSet[$rowcount] = ($rs->Fields['NewPosition']->Value);
			    $rowcount++;            // increments rowcount
			    $rs->MoveNext();
			
			}
    	return $resultSet;
	} 
	

	
	/*******************************************************************
*	FUNCTION: Yellow Check
*	Purpose: returns Medium Matches
********************************************************************/
		
		function runYellow($currentposition,$currentorgsize,$neworgsize,$functionalarea){
		$db = new COM("ADODB.Connection");
  		$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  		$db->Open($dsn);
  		$rs = $db->Execute("SELECT tblpositionmappings.NewPosition FROM tblposition INNER JOIN tblpositionmappings ON tblposition.ID = tblpositionmappings.NewPosition WHERE (((tblpositionmappings.CurrentPosition)=$currentposition) AND ((tblpositionmappings.DegreeMatch)=2) AND ((tblpositionmappings.CurrentOrgSize)=$currentorgsize) AND ((tblpositionmappings.NewOrgSize)=$neworgsize) AND ((tblpositionmappings.FunctionalArea)=$functionalarea))");
		
		$resultSet = array();
    		$rowcount = 0;
			while (!$rs->EOF) {
				$resultSet[$rowcount] = ($rs->Fields['NewPosition']->Value);
			    $rowcount++;            // increments rowcount
			    $rs->MoveNext();
			
			}
			$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

    	return $resultSet;
	} 
	
	/*******************************************************************
*	FUNCTION: Red Check
*	Purpose: returns Lowest Matches
********************************************************************/
		
		function runRed($currentposition,$currentorgsize,$neworgsize,$functionalarea){
			$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);
  			$rs = $db->Execute("SELECT tblpositionmappings.NewPosition FROM tblposition INNER JOIN tblpositionmappings ON tblposition.ID = tblpositionmappings.NewPosition WHERE (((tblpositionmappings.CurrentPosition)=$currentposition) AND ((tblpositionmappings.DegreeMatch)=1) AND ((tblpositionmappings.CurrentOrgSize)=$currentorgsize) AND ((tblpositionmappings.NewOrgSize)=$neworgsize) AND ((tblpositionmappings.FunctionalArea)=$functionalarea))");
		
			$resultSet = array();
    		$rowcount = 0;
			while (!$rs->EOF) {
				$resultSet[$rowcount] = ($rs->Fields['NewPosition']->Value);
			    $rowcount++;            // increments rowcount
			    $rs->MoveNext();
			
			}
			$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

    	return $resultSet;
	} 

/*******************************************************************
*	FUNCTION: User Authorization
*	Purpose: returns whether or not user is member and results
********************************************************************/
		
		function runAuth($name,$id){
			$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);
  		
						
			$rs = $db->Execute("SELECT * FROM tbluserdata WHERE UserLastName='$name' AND UserID='$id'");


			$rowcount = 0;
			while (!$rs->EOF) {

			    $rowcount++;            // increments rowcount
			    $rs->MoveNext();
			
			}

			$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

			if ($rowcount == 0) {
				$result = false;
			} else {
				$result = true;
			}
				return $result;

	}
	
/*******************************************************************
*	FUNCTION: Add User
*	Purpose: adds user if current sent is not found
********************************************************************/
		
		function runAddName($name,$id){
		$db = new COM("ADODB.Connection");
  		$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  		$db->Open($dsn);
  		$rs = $db->Execute("INSERT INTO tbluserdata ( UserID , UserLastName , UserLastLogonDate , UserMaxEducation , UserCert_PHR , UserCert_SPHR , UserCert_GPHR , UserCert_CEBS , UserCert_CCD , UserCert_CBP , UserCert_CCP , UserCert_CPP , UserCert_CMS , UserCert_FPC , UserCert_GRP , UserCert_GBA , UserCert_RPA , UserCert_Other , UserHRExperience , UserDirectReports , UserIndirectReports , UserOrganizationSize , UserSupervisorTitle , UserCurrentJobFunction , UserChangeJobFunction , UserDesiredJobFunction , UserDesiredOrganizationSize ) VALUES ('$id', '$name', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
			
		$result = mssql_query($sql);
		$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

		return $result;
	}
	
		
/*******************************************************************
*	FUNCTION: Add User Answers
*	Purpose: adds user question answer
********************************************************************/
		
		function runAddAns($name,$id,$q1,$q2a,$q2b,$q2c,$q2d,$q2e,$q2f,$q2g,$q2h,$q2i,$q2j,$q2k,$q2l,$q2m,$q2n,$q3,$q4,$q5,$q6,$q7,$q8,$q9,$q10,$q11){
				$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);
  			$rs = $db->Execute("UPDATE tbluserdata SET UserLastLogonDate='$today',UserMaxEducation='$q1', UserCert_PHR='$q2a', UserCert_SPHR='$q2b' ,UserCert_GPHR='$q2c', UserCert_CEBS='$q2d', UserCert_CCD='$q2e', UserCert_CBP='$q2f', UserCert_CCP='$q2g', UserCert_CPP='$q2h', UserCert_CMS='$q2i', UserCert_FPC='$q2j', UserCert_GRP='$q2k', UserCert_GBA='$q2l', UserCert_RPA='$q2m', UserCert_Other='$q2n', UserHRExperience='$q3', UserDirectReports='$q4', UserIndirectReports='$q5', UserOrganizationSize='$q6',UserSupervisorTitle='$q7', UserCurrentJobFunction='$q8', UserChangeJobFunction='$q9', UserDesiredJobFunction='$q10', UserDesiredOrganizationSize='$q11' WHERE UserID='$id'");
			
		$result = mssql_query($sql);
		$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

		return $result;

	}
	
/*******************************************************************
*	FUNCTION: Get name and URL info for Wheel
*	Purpose: returns name and url info
********************************************************************/
		
		function runURL($currentposition){
		$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);
  			$rs = $db->Execute("SELECT * FROM tblPosition WHERE ID = '$currentposition'");
			
			$resultSet = array();
    		$resultSet[1] = ($rs->Fields['PositionTitle']->Value);
			$resultSet[2] = ($rs->Fields['PositionDescriptionFile']->Value);
			 
		$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

		return $resultSet;
	} 
	
	/*******************************************************************
*	FUNCTION: Return Previous Answers
*	Purpose: returns whether or not user is member and results
********************************************************************/
		
		function runGetans($name,$id){
			$db = new COM("ADODB.Connection");
  			$dsn = "Provider=SQLOLEDB.1;Persist Security Info=False;User ID=root;Initial Catalog=SHRM_STATIC_INFO;Data Source=opm01a;password=shrm";
  			$db->Open($dsn);			
			$rs = $db->Execute("SELECT * FROM tbluserdata WHERE UserLastName='$name' AND UserID='$id'");

			$resultSet = array();
			$resultSet[0] = ($rs->Fields['ID']->Value);
			$resultSet[1] = ($rs->Fields['UserID']->Value);
			$resultSet[2] = ($rs->Fields['UserLastName']->Value);
			$resultSet[3] = ($rs->Fields['UserLastLogonDate']->Value);
			$resultSet[4] = ($rs->Fields['UserMaxEducation']->Value);
			$resultSet[5] = ($rs->Fields['UserCert_PHR']->Value);
			$resultSet[6] = ($rs->Fields['UserCert_SPHR']->Value);
			$resultSet[7] = ($rs->Fields['UserCert_GPHR']->Value);
			$resultSet[8] = ($rs->Fields['UserCert_CEBS']->Value);
			$resultSet[9] = ($rs->Fields['UserCert_CCD']->Value);
			$resultSet[10] = ($rs->Fields['UserCert_CBP']->Value);
			$resultSet[11] = ($rs->Fields['UserCert_CCP']->Value);
			$resultSet[12] = ($rs->Fields['UserCert_CPP']->Value);
			$resultSet[13] = ($rs->Fields['UserCert_CMS']->Value);
			$resultSet[14] = ($rs->Fields['UserCert_FPC']->Value);
			$resultSet[15] = ($rs->Fields['UserCert_GRP']->Value);
			$resultSet[16] = ($rs->Fields['UserCert_GBA']->Value);
			$resultSet[17] = ($rs->Fields['UserCert_RPA']->Value);
			$resultSet[18] = ($rs->Fields['UserCert_Other']->Value);
			$resultSet[19] = ($rs->Fields['UserHRExperience']->Value);
			$resultSet[20] = ($rs->Fields['UserDirectReports']->Value);
			$resultSet[21] = ($rs->Fields['UserIndirectReports']->Value);
			$resultSet[22] = ($rs->Fields['UserOrganizationSize']->Value);
			$resultSet[23] = ($rs->Fields['UserSupervisorTitle']->Value);
			$resultSet[24] = ($rs->Fields['UserCurrentJobFunction']->Value);
			$resultSet[25] = ($rs->Fields['UserChangeJobFunction']->Value);
			$resultSet[26] = ($rs->Fields['UserDesiredJobFunction']->Value);
			$resultSet[27] = ($rs->Fields['UserDesiredOrganizationSize']->Value);
			
			$rs->Close();
			$db->Close();
	
			$rs = null;
			$db = null;

    	return $resultSet;
		}
		
	
	} 
		
		
?>