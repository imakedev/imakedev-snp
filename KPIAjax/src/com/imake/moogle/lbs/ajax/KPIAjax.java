package com.imake.moogle.lbs.ajax;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletContext;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.imake.moogle.lbs.backoffice.dto.KPIMaster;
import com.imake.moogle.lbs.backoffice.service.KPIService;



public class KPIAjax {
	private final KPIService kpiService;
	/*private final FinanceDashboardService financeDashboardService;
	private final OperationDashboardProcService operationDashboardProcService;*/
	public KPIAjax(){
		WebContext ctx = WebContextFactory.get(); 
		ServletContext servletContext = ctx.getServletContext();
    	WebApplicationContext wac = WebApplicationContextUtils.
    	getRequiredWebApplicationContext(servletContext);
    	kpiService = (KPIService)wac.getBean("kpiService");
    	/*financeDashboardService = (FinanceDashboardService)wac.getBean("financeDashboardService"); 
    	operationDashboardProcService= (OperationDashboardProcService)wac.getBean("operationDashboardProcService");*/
	}     
	public String say(){
		return "";
	}
	public List<Integer> listYears(String query){
		System.out.println("into listYear");
		return kpiService.listYear(query);
	}
	/*public List<Integer> listYears(String query){ 
		return kpiService.listYear(query);
	}*/
	public List<KPIMaster> listMaster(String query){
		return kpiService.listMaster(query);
	}
	public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(Integer year,Integer periodNo,String employeeCode){
		return kpiService.searchEmployeeResult(year, periodNo, employeeCode);
	}	 
	public int updateAdjustPercentage(BigDecimal[] adjustPercentage,BigDecimal[] finalPercentage,
			Integer[] year, Integer[] periodNo, String[] employeeCode,String[] reason){
		try{
		return kpiService.updateAdjustPercentage(adjustPercentage, finalPercentage, year, periodNo, employeeCode,reason );
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	
	public List<com.imake.moogle.lbs.backoffice.dto.KpiResult> searchKPI(
			Integer year,Integer periodNo,String employeeCode,String etl_flag,String approved_flag){
		return kpiService.searchKPI(year,  periodNo,employeeCode, etl_flag, approved_flag);
	} 
	public int approveKPIResult(Integer[] year, Integer[] periodNo, String[] employeeCode,String[] kpiCode,String approved_flag){
		try{
		return kpiService.approveKPIResult( year, periodNo, employeeCode,kpiCode ,approved_flag);
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	//Threshold
		public List<com.imake.moogle.lbs.backoffice.dto.Threshold> searchThreshold(
				String thresholdName){
			return kpiService.searchThreshold(thresholdName);
		}
		public int updateThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold){
			return kpiService.updateThreshold(threshold);
		}
		public int deleteThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold){
			return kpiService.deleteThreshold(threshold);
		}
		public com.imake.moogle.lbs.backoffice.dto.Threshold findThresholdById(com.imake.moogle.lbs.backoffice.dto.Threshold threshold){
			return kpiService.findThresholdById(threshold,threshold.getThresholdId());
		}
		public int saveThreshold(com.imake.moogle.lbs.backoffice.dto.Threshold threshold){
			return kpiService.saveThreshold(threshold);
		}
		
		public int updateObject(Object threshold){
			return kpiService.updateObject(threshold);
		}
		public int deleteObject(Object threshold){
			return kpiService.deleteObject(threshold);
		}
		public Object findById(Object threshold,Serializable id){
			return kpiService.findById(threshold,id);
		}
		public int saveObject(Object threshold){
			return kpiService.saveObject(threshold);
		}
}
