<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %> 
<%@ include file="/WEB-INF/jsp/includes.jsp" %>  
<html> 
<head>
<title>BackOffice</title>
<!--  <meta charset="UTF-8" />   --> 
 <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
   <script  src="<%=request.getContextPath() %>/resources/js/jquery-1.8.3.min.js" type="text/javascript"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smoothness/jquery-ui-1.9.2.custom.min.js"></script>
 <script type="text/javascript" src="<%=request.getContextPath() %>/resources/ckeditor/ckeditor.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="<%=request.getContextPath() %>/resources/css/smoothness/jquery-ui-1.9.2.custom.css" type="text/css"  rel="stylesheet" /> 
<link href="<%=request.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"  type="text/css"/>    
 
 <!-- 
	DWR
	-->
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/interface/KPIAjax.js"></script>
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/engine.js"></script> 
	<script type="text/javascript"
        	src="<%=request.getContextPath() %>/dwr/util.js"></script>
 <style type="text/css">
 /*  fieldset { width: 100%; }
  fieldset legend { width: 100%; }
  fieldset legend div { margin: 0.3em 0.5em; }
  fieldset .field { margin: 0.5em; padding: 0.5em; }
  fieldset .field label { margin-right: 0.4em; } */
</style>
<style>
.ui-widget { font-family: Trebuchet MS, Tahoma, Verdana,
 Arial, sans-serif; font-size: 12px; }
input[type=text] {
	height: 30px;
	line-height: 30px
}
textarea,fieldset ,select,a{font-size: 12px
}
table > tbody{font-size: 12px}
input {
font-size: 12px;
font-weight: normal;
line-height: normal;
}
 form {
margin: 0 0 0px;
}
 </style>
<style type="text/css">
/*.th_class{font-family: Tahoma;font-size: 13px;text-align: center;*/
.th_class{text-align: center;
}
a{cursor: pointer;}
 .ui-autocomplete-loading {
    background: white url('<%=request.getContextPath() %>/resources/css/smoothness/images/ui-anim_basic_16x16.gif') right center no-repeat;
  } 
   #city { width: 140px; }
</style>
<!-- <style type="text/css"> 
th{ font-family:Tahoma; font-size:12px; font-weight:bold;
 color: #fff;background:url(/MISSExamBackOffice/resources/images/tr_back-theme1.gif) repeat-x scroll 0 0 #80838A;padding: 5px 8px;border:1px solid #fff; 
} 
</style> -->  

</head> 
<body> 
 <!--  <div class="row-fluid"  style="position:fixed;"> 
     	<div class="span7"> -->
     	<div id="_content" style="margin-left:3px;padding-top: 3px;width: 1100px">
      		 <!-- <fieldset style="font-family: sans-serif;padding-top:0px;width: 1048px">  -->
      		 <table style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px;width: 1100px;"><tr><td>
	<!-- <form class="form-inline"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;padding-bottom:15px" action="" method="post" > --> 
   <div style="padding-left:20px;padding-top: 5px">
     Year:
    <span   id="yearSelection"> 
    </span>  
     <span style="padding-left:10px;">
    Period:
    </span>
    <span   id="periodSelection"> 
    </span>
     <span style="padding-left:10px;">
    Department:
    </span>
    <span   id="departmentSelection"> 
    </span>
   
     <span style="padding-left:10px;">
    Position:
    </span>
    <span   id="positionSelection"> 
    </span> 
  
   
   <!--  <span> <input id="city" /></span> -->
   
    </div>
    </td></tr>
    <tr><td> 
     <span style="padding-left:20px;">
    Employee:
    </span>
     <span>  
     <input type="hidden" id="employeeElement" />
     <input type="text" id="employeeSelection" />
     <a class="btn btn-primary" style="font-size:12px;margin-top: -10px" onclick="distplayApproveKPIResult()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span>  
   <!--  <span style="padding-left:20px;">
    	<a class="btn btn-primary" style="font-size:12px" onclick="distplayEmployee()"><i class="icon-search icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;font-size: 12px;">Search</span></a>
    </span -->
<!-- </form> -->
   </td>
	</tr>
  </table> 
  </div>
<div id="dialog-Message-alert" title="Message" style="display: none;background: ('images/ui-bg_highlight-soft_75_cccccc_1x100.png') repeat-x scroll 50% 50% rgb(204, 204, 204)">
	<span id="_message_show"></span>
</div>
<div id="dialog-Message" style="display: none;width: 1098px;padding-left: 4px;padding-top:1px">
<table style="border:1px solid #B3D2EE;background: #F9F9F9;width: 1098px"> 
	<tr>
		<td> 
		<div style="display: block;padding-left: 3px;width: 1088px" >
<!-- <form  class="well"  style="border:1px solid #B3D2EE;background: #F9F9F9;padding-top:20px;" action="" method="post" > -->
<div> 
	 <div style="padding: 10px; overflow: auto;height: 377px;overflow-x:hidden"  id="employee_section"> 
    </div>
  </div>
  <div align="center" id="approve_section"> 
      <a class="btn btn-primary" onclick="approve()"><i class="icon-ok icon-white"></i>&nbsp;<span style="color: white;font-weight: bold;">Approve</span></a>
    </div>
    </div>
  </td>
	</tr>
  </table>
 </div>  
 <!--  </form>
  </div>
  
</fieldset>
      	</div>
     	</div>
     </div>  -->
  <%@ include file="/WEB-INF/jsp/schema_test.jsp" %>  
     <script type="text/javascript">
//var _path="/KPIWebTest/";
//var SCHEMA_G='mcic_kpi_app';
//var SCHEMA_G='FSD2';
var _path='<%=request.getContextPath()%>'+'/'; 
var mail_toG;
var mail_subjectG;
var mail_messageG;
var mail_attachG;   
$(document).ready(function() {  
	/* $('#togle_emp').click(function() {
		 //$("#dialog-Message").slideDown("slow"); 
		     $('#dialog-Message').toggle('slow', function() { 
 
		  });  
		}); */
	listYear();
	listDepartment();
	$( "#employeeSelection" ).autocomplete({
		  source: function( request, response ) {
			  var position_value=$("#positionElement").val();
				var department_value=$("#departmentElement").val();
				var where_query="";
				var haveWhere=false;
				if(department_value!='all'){
					if(haveWhere)
						where_query=where_query+" and department_code ='"+department_value+"'";
					else
						where_query=where_query+" where department_code ='"+department_value+"'";
					haveWhere=true;
				}
				if(position_value!='all'){
					if(haveWhere)
						where_query=where_query+" and position_code ='"+position_value+"'";
					else
						where_query=where_query+" where position_code ='"+position_value+"'";
					haveWhere=true;
				}
			  var query="select * from (select distinct employee_code, concat(employee_name,' ',employee_surname) " +
				" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee  "+where_query+" order by emp_name "+
				") as xx where emp_name like '%"+request.term+"%'";
			  
				KPIAjax.listMaster(query,{
					callback:function(data){
						 
						if(data!=null && data.length>0){
							response( $.map( data, function( item ) {
					          return {
					        	  label: item.name,
					        	  value: item.id 
					          }
					        }));
						}else{
							var xx=[]; 
							response( $.map(xx));
						}
					}
			 });
		  
		  },
		  minLength: 2,
		  select: function( event, ui ) { 
			  this.value = ui.item.label;
			  $("#employeeElement").val(ui.item.value);
		      return false;
		  },
		  open: function() {
		    $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
		  },
		  close: function() {
		    $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
		  }
		}); 
}); 
function loadDynamicPage(pageId){  
	pageId=_path+"ending_periodic_data_entry/template/"+pageId+".jsp";  
			$.ajax({
				  type: "get",
				  url: pageId,
				  cache: false 
				}).done(function( data ) {
					if(data!=null){
						  appendContent(data);
					  }
				});
}
function togle_page(pageId,id_active){  
	$("ul[class=nav] > li").removeClass("active"); 
	    $("#"+id_active).addClass("active");
		loadDynamicPage(pageId);
}
function appendContentWithId(data,contentId){
	if(data.indexOf("j_username")!=-1 || data.indexOf("loginform")!=-1){ 
		  window.location.href="<c:url value='/logout'/>"; 
	  }else{ 
			  $("#"+contentId).html(data); 
	  }
	
}
function appendContent(data){ 
	appendContentWithId(data,"_content"); 
}
function parseDouble(value){
	  if(typeof value == "string") {
	    value = value.match(/^-?\d*/)[0];
	  }
	  
	  return !isNaN(parseFloat(value)) ? value * 1 : NaN;
	}
function listYear(){
	var query="SELECT distinct result.year FROM "+SCHEMA_G+".employee_result result order by result.year desc ";
	KPIAjax.listYears(query,{
		callback:function(data){
			//alert(data);
			   var str="<select id=\"yearElement\" style=\"width: 75px\" onchange=\"listDepartment()\">";
			  // str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i]+"\">"+data[i]+"</option>";
				}  
			}
			str=str+"</select>";
			$("#yearSelection").html(str); 
			listPeriod();
		}
    });
}
function listPeriod(){
	 var year=$("#yearElement").val();
	 var period_query="";
		if(year!='all'){
			period_query=" where year=" +year;
		}
		 
	var query="select period_no,period_desc  from "+SCHEMA_G+".period "+period_query;
	//" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data); 
			 var str="<select id=\"periodElement\">";
			    str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			} 
			str=str+"</select>";
			$("#periodSelection").html(str); 
		}
   });
}
function listDepartment(){
	//var year=$("#yearElement").val();
	//alert(year)
	var query="select distinct department_code, department_name  from "+SCHEMA_G+".employee" +
	" order by department_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			var str="<select id=\"departmentElement\" onchange=\"listPosition()\" >";
			 str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				} 
			}
			str=str+"</select>";
			$("#departmentSelection").html(str);
			listPosition(); 
		}
    });
}
function listPosition(){
	var department_value=$("#departmentElement").val();
	//alert(department_value)
	var department_code_query="";
	if(department_value!='all'){
		department_code_query=" where department_code ='"+department_value+"'";
	}
	 var query="select distinct position_code, position_name  from "+SCHEMA_G+".employee" +
	 		department_code_query+"   order by position_name";
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			//var str="<select id=\"positionElement\" onchange=\"listEmployee()\" >";
			var str="<select id=\"positionElement\"    onchange=\"clearEmployee()\">";
			str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				} 
			}
			str=str+"</select>";
			$("#positionSelection").html(str);
			clearEmployee(); 
		}
    });
}
function clearEmployee(){
	$("#employeeElement").val("");
	$("#employeeSelection").val("");
} 
function listEmployee(){
	var position_value=$("#positionElement").val();
	//alert(position_value) 
	var department_value=$("#departmentElement").val();
	//alert(department_value)
	var where_query="";
	var haveWhere=false;
	if(department_value!='all'){
		if(haveWhere)
			where_query=where_query+" and department_code ='"+department_value+"'";
		else
			where_query=where_query+" where department_code ='"+department_value+"'";
		haveWhere=true;
	}
	if(position_value!='all'){
		if(haveWhere)
			where_query=where_query+" and position_code ='"+position_value+"'";
		else
			where_query=where_query+" where position_code ='"+position_value+"'";
		haveWhere=true;
	}
	var query="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
	" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee  "+where_query+" order by emp_name";
	/* var query="select distinct employee_code, concat(employee_name,' ',employee_surname) " +
		" as emp_name ,department_code,position_code from "+SCHEMA_G+".employee where  department_code = '"+department_value+"'" +
		"  and   position_code = '"+position_value+"' order by emp_name"; */
	KPIAjax.listMaster(query,{
		callback:function(data){
			//alert(data);
			var str="<select id=\"employeeElement\" onchange=\"distplayApproveKPIResult()\">";
			str=str+"<option value=\"all\">All</option>";
			if(data!=null && data.length>0){ 
				for(var i=0;i<data.length;i++){
					str=str+"<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
				//str=str+"</select> &nbsp; &nbsp;<a class=\"btn\" onclick=\"searchKPIResult()\">Search</a>"; 
			}
			str=str+"</select>"; 
			$("#employeeSelection").html(str);
			//distplayApproveKPIResult();
		}
 });
}
function distplayApproveKPIResult(){
	 var year=jQuery.trim($("#yearElement").val());
	 var periodNo=jQuery.trim($("#periodElement").val());
	 var department_code=jQuery.trim($("#departmentElement").val());
	 var position_code=jQuery.trim($("#positionElement option:selected").text());
	 var employee_code=jQuery.trim($("#employeeElement").val());
	 var employee_name=jQuery.trim($("#employeeSelection").val()); 
	 
	 
	 var etl_flag='N';
	 var approved_flag='N';
	  
	 
	 var approveKPIWhere=""; 
	 var haveWhere=false;
	// alert(jQuery.trim(employee_name).length)
	  if(jQuery.trim(employee_name).length==0){
		 employee_code='';
	 }   
	if(year.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.year ="+year+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.year ="+year+"";
		haveWhere=true;
	}
	if(periodNo.length>0 && periodNo!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.period_no="+periodNo+"";
		else
			approveKPIWhere=approveKPIWhere+" where result.period_no="+periodNo+"";
		haveWhere=true;
	}
	if(department_code.length>0 && department_code!='all'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.department_code ='"+department_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.department_code = '"+department_code+"'";
		haveWhere=true;
	}
	if(position_code.length>0 && position_code!='All'){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.position_name ='"+position_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.position_name = '"+position_code+"'";
		haveWhere=true;
	}
	if(employee_code.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and em.employee_code='"+employee_code+"'";
		else
			approveKPIWhere=approveKPIWhere+" where em.employee_code ='"+employee_code+"'";
		haveWhere=true;
	}
	if(employee_name.length>0){
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		else
			approveKPIWhere=approveKPIWhere+" where  concat(em.employee_name,' ',em.employee_surname)='"+employee_name+"' ";
		haveWhere=true;
	}
	
	if(etl_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and kpi.etl_flag='"+etl_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where kpi.etl_flag='"+etl_flag+"'";
		haveWhere=true;
	} 
	
	if(approved_flag.length>0){		
		if(haveWhere)
			approveKPIWhere=approveKPIWhere+" and result.approved_flag ='"+approved_flag+"'";
		else
			approveKPIWhere=approveKPIWhere+" where result.approved_flag = '"+approved_flag+"'";
		haveWhere=true;
	}
	
	
	 
	// var position_code=$("#positionElement").val();
	var query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score from "+SCHEMA_G+".kpi_result result inner join "+SCHEMA_G+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code inner join	"+SCHEMA_G+".employee em on result.employee_code=em.employee_code  inner join "+SCHEMA_G+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year) "+approveKPIWhere;
					
	 
	/*  if(thresholdName.length>0)
		approveKPIWhere=" where threshold_name like '%"+thresholdName+"%'";
	var query="SELECT * FROM "+SCHEMA_G+".threshold "+thresholdNameWhere; */
	 
	//alert("a") 
	//KPIAjax.searchKPI(SCHEMA_G,year,  periodNo,employeeCode, etl_flag, approved_flag,{
	KPIAjax.searchObject(query,{
		callback:function(data){
			//alert(data);
			 
			if(data!=null && data.length>0){
			    var str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px\">"+
			    		"<thead>"+
			    		"<tr> "+ 
	            		"<th width=\"5%\"><div class=\"th_class\"></div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Employee Code</div></th>"+
	            		"<th width=\"25%\"><div class=\"th_class\">Employee Name</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">KPI Code</div></th>"+ 
	            		"<th width=\"30%\"><div class=\"th_class\">KPI Name</div></th>"+
	            		"<th width=\"10%\"><div class=\"th_class\">Target</div></th>  "+
	            		"<th width=\"10%\"><div class=\"th_class\">Actual</div></th>    "+
	          		"</tr>"+
	        	"</thead>"+
	        	"<tbody>";
	        	
				for(var i=0;i<data.length;i++){ 
					str=str+
					"<tr style=\"cursor: pointer;\">"+
	          		"<td style=\"text-align: left;\">"+
	          		"<input type=\"hidden\" name=\"year_input\" value=\""+data[i][0]+"\" />"+
	          		"<input type=\"hidden\" name=\"period_no_input\" value=\""+data[i][1]+"\" />"+
	          		"<input type=\"hidden\" name=\"employee_code_input\" value=\""+data[i][3]+"\" />"+
	          		"<input type=\"hidden\" name=\"kpi_code_input\" value=\""+data[i][5]+"\" />"+ 
	          		"<input type=\"checkbox\" name=\"kpi_result_id\" value=\""+data[i][0]+"_"+data[i][1]+"_"+data[i][3]+"_"+data[i][5]+"\" />"+
	          		"</td>"+
	            	"<td style=\"text-align: left;\">"+data[i][3]+"</td>"+
	            	"<td>"+data[i][4]+"</td> "+
	            	"<td style=\"text-align: left;\">"+data[i][5]+"</td>"+
	            	"<td>"+data[i][6]+"</td> "+
	            	"<td style=\"text-align: right;\">"+(data[i][7]!=null?data[i][7]:"")+"</td>  "+
	            	"<td style=\"text-align: right;\">"+(data[i][8]!=null?data[i][8]:"")+"</td>  "+
	          	"</tr>  ";
				}
				  
				var approve_str="<a class=\"btn btn-primary\" onclick=\"approve()\"><i class=\"icon-ok icon-white\"></i>&nbsp;<span style=\"color: white;font-weight: bold;\">Approve</span></a>";
			$("#approve_section").html(approve_str);  
			}else{ 
				str="<table class=\"table table-hover table-striped table-bordered table-condensed\" border=\"1\" style=\"font-size: 12px;width:1070px\">"+
	    		"<thead>"+
	    		"<tr> "+
      			"<th colspan=\"7\" width=\"100%\"><div class=\"th_class\">No Data</div></th>"+ 
      		"</tr>"+
    	"</thead>"+
    	"<tbody>";  
				
				$("#approve_section").html("");  
			}
			str=str+"</tbody> </table>";
			
			$("#employee_section").html(str);  
			$("#dialog-Message").slideDown("slow");
			 
		}
			
});		 
}
 
function approve (){
	/* 	var employee_code_input=document.getElementsByName("employee_code_input"); // period_no_input , year_input , adjustPercentage_input , weightPercentage_input
		var period_no_input=document.getElementsByName("period_no_input");
		var year_input=document.getElementsByName("year_input");
		var kpi_code_input=document.getElementsByName("kpi_code_input"); */ 
		var kpi_result_ids=document.getElementsByName("kpi_result_id");
		
		var valueArray=[];
		var value="";
		var yearArray=[];
		var period_noArray=[];
		var employee_codeArray=[];
		var kpi_codeArray=[];
		if(kpi_result_ids!=null && kpi_result_ids.length>0){  
			for(var i=0;i<kpi_result_ids.length;i++){
				if(kpi_result_ids[i].checked){
					value=kpi_result_ids[i].value; 
					//alert(value);
					valueArray= value.split("_");
					yearArray.push(parseInt(valueArray[0]));
					period_noArray.push(parseInt(valueArray[1]));
					employee_codeArray.push(valueArray[2]);
					kpi_codeArray.push(valueArray[3]);
				}
			}  
		}
		//alert(yearArray.length)
		//if(false)
		if(yearArray.length>0){ 
			KPIAjax.approveKPIResult(SCHEMA_G,yearArray
					,period_noArray,employee_codeArray,kpi_codeArray,"Y",{
				callback:function(data){
					//alert("return adjust="+data);
					if(data!=null && data!=0){
						$("#_message_show").html("Approve Success."); 
					}else{
						$("#_message_show").html("Approve not Success."); 
					}
					$( "#dialog-Message-alert" ).dialog({
						/* height: 140, */
						modal: true,
						buttons: {
							"Ok": function() { 
								$( this ).dialog( "close" );
								distplayApproveKPIResult();
							}
						} 
					}); 
				},
				 errorHandler:function(errorString, exception) { 
					 alert(errorString+","+exception)
				 }
		 });
		}  
	}  
function searchKPIResult(){
	/* $("#emp_code").val("53-145");
	$("#emp_name").val("วินัย ทองอยู่"); */
	$("#dialog-Message").slideDown("slow"); 
	distplayApproveKPIResult();
}
</script> 
</body>
</html>  