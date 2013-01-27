package com.imake.moogle.lbs.ajax;

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
	public List<Integer> listYears(){
		System.out.println("into listYear");
		return kpiService.listYear();
	}
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
	
}
