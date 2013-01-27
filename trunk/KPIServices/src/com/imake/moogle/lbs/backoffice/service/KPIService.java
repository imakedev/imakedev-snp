package com.imake.moogle.lbs.backoffice.service;

import java.math.BigDecimal;
import java.util.List;

import com.imake.moogle.lbs.backoffice.dto.KPIMaster;

public interface KPIService {
	public List<Integer> listYear();
	public List<KPIMaster> listMaster(String query); 
	public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(Integer year,Integer periodNo,String employeeCode);	 
	public int updateAdjustPercentage(BigDecimal[] adjustPercentage,BigDecimal[] finalPercentage,
			Integer[] year, Integer[] periodNo, String[] employeeCode,String[] reason);
}
