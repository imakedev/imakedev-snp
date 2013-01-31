package com.imake.moogle.lbs.backoffice.service.impl;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.imake.moogle.lbs.backoffice.dto.KPIMaster;
import com.imake.moogle.lbs.backoffice.dto.KpiResult;
import com.imake.moogle.lbs.backoffice.dto.Threshold;
import com.imake.moogle.lbs.backoffice.service.KPIService;

/**
 * @author Chatchai Pimtun
 */
@Repository
@Transactional
public class KPIServiceImpl implements KPIService {

	private SessionFactory sessionAnnotationFactory;
	private static String SCHEMA="FSD";
	private static final  ResourceBundle myResources =
		      ResourceBundle.getBundle("jdbc"); 
	static{
		SCHEMA=myResources.getString("SCHEMA");
	}
	/*
	 * @Autowired public BalanceScorecardServiceImpl(SessionFactory
	 * sessionAnnotationFactory) { this.sessionAnnotationFactory =
	 * sessionAnnotationFactory; }
	 */
	public SessionFactory getSessionAnnotationFactory() {
		return sessionAnnotationFactory;
	}

	public void setSessionAnnotationFactory(
			SessionFactory sessionAnnotationFactory) {
		this.sessionAnnotationFactory = sessionAnnotationFactory;
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	@Override
	public List<Integer> listYear(String query) {
		// TODO Auto-generated method stub
		
		List<Integer> list =null;
		try{
		
		 list = this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(
						query
						//"SELECT distinct result.year FROM "+SCHEMA+".employee_result result order by result.year desc "
						)
						
				.list();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		System.out.println("listYear ="+list);
		return list;
		
	}
	@Transactional(readOnly=true)
	@Override
	public List<KPIMaster> listMaster(String query) {
		// TODO Auto-generated method stub
		List<KPIMaster> master =null;
		/*List<KPIMaster>  xx=this.sessionAnnotationFactory
		.getCurrentSession().createQuery("select from KPIMaster").list();*/
		try{
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(query).list();
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	master=new ArrayList<KPIMaster>(size);
		    	String id="";
		    	for (int i = 0; i < size; i++) {
		    		KPIMaster kpiMaster =new KPIMaster();
		    		Object obj[] =(Object[])result.get(i);
		    		
		    		 if (obj[0] instanceof Integer) {
		    			 Integer idObj = (Integer) obj[0];
						id=idObj.intValue()+"";
					 }else
						id=(String)obj[0]; 
		    		kpiMaster.setId(id);
		    		kpiMaster.setName((String)obj[1]);
		    		master.add(kpiMaster);
				}
		    	 
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return master;
	}

	@Transactional(readOnly=true)
	@Override
	public List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> searchEmployeeResult(Integer year,Integer periodNo,String employeeCode) {
		// TODO Auto-generated method stub
		List<com.imake.moogle.lbs.backoffice.dto.EmployeeResult> employeeResult =null;
		try{
			String query =" select em_result.period_no,p.period_desc,em_result.employee_code," +
					" concat(em.employee_name,' ',em.employee_surname) as emp_name ,em_result.weight_percentage," +
					" em_result.adjust_percentage,em_result.adjustment_reason" +
					" ,em_result.final_percentage ,em_result.year  from "+SCHEMA+".employee_result  em_result left join " +
					" "+SCHEMA+".employee em on em_result.employee_code=em.employee_code left join "+SCHEMA+".period p  on" +
					" (em_result.period_no=p.period_no and em_result.year =p.year) where" +
					" em_result.year="+year.intValue()+" and em_result.employee_code='"+employeeCode+"' order by  em_result.period_no asc ";
				 
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(query).list();
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	employeeResult=new ArrayList<com.imake.moogle.lbs.backoffice.dto.EmployeeResult>(size);
		    	for (int i = 0; i < size; i++) {
		    		com.imake.moogle.lbs.backoffice.dto.EmployeeResult emp =new com.imake.moogle.lbs.backoffice.dto.EmployeeResult();
		    		Object obj[] =(Object[])result.get(i);
		    		emp.setPeriodNo(obj[0]!=null?(Integer)obj[0]:null);
		    		emp.setPeriodDesc(obj[1]!=null?(String)obj[1]:null);
		    		emp.setEmployeeCode(obj[2]!=null?(String)obj[2]:null);
		    		emp.setEmpName(obj[3]!=null?(String)obj[3]:null);
		    		emp.setWeightPercentage(obj[4]!=null?(BigDecimal)obj[4]:null);
		    		emp.setAdjustPercentage(obj[5]!=null?(BigDecimal)obj[5]:null);
		    		emp.setAdjustmentReason(obj[6]!=null?(String)obj[6]:null);
		    		emp.setFinalPercentage(obj[7]!=null?(BigDecimal)obj[7]:null);
		    		emp.setYear(obj[8]!=null?(Integer)obj[8]:null);
		    		
		    		employeeResult.add(emp);
				}
		    	 
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return employeeResult;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateAdjustPercentage(BigDecimal[] adjustPercentage,BigDecimal[] finalPercentage,
			Integer[] year, Integer[] periodNo, String[] employeeCode,String[] reason) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
	try{
		StringBuffer sb =new StringBuffer();
		if(adjustPercentage!=null && adjustPercentage.length>0){
			int size= adjustPercentage.length; 
			for (int i = 0; i < size; i++) {
				sb.setLength(0); 
				sb.append("update "+SCHEMA+".employee_result set adjust_percentage=:adjust_percentage , final_percentage=:final_percentage " +
						"	,adjustment_reason=:reason" +
						",updated_dt=now()" +
						" where year="+year[i]+" and period_no="+periodNo[i] +
						"	and employee_code='"+employeeCode[i]+"'" );
			Query	query= session.createSQLQuery(sb.toString());
				query.setParameter("reason", reason[i]);
				query.setParameter("adjust_percentage", adjustPercentage[i]);
				query.setParameter("final_percentage", finalPercentage[i]);
				returnId=query.executeUpdate();
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (session != null) {
			session = null;
		} 
	}
			return returnId;
			
   	 }

	@Transactional(readOnly=true)
	@Override
	public List<KpiResult> searchKPI(Integer year, Integer periodNo,
			String employeeCode, String etl_flag, String approved_flag) {

		// TODO Auto-generated method stub
		List<com.imake.moogle.lbs.backoffice.dto.KpiResult> kpiResult =null;
		try{
			String query ="select result.year,result.period_no,p.period_desc,result.employee_code" +
					"	,concat(em.employee_name,' ',em.employee_surname) as emp_name , result.kpi_code ,kpi.kpi_name " +
					"  ,result.target_score,result.actual_score from "+SCHEMA+".kpi_result result left join "+SCHEMA+".kpi kpi " +
					" on result.kpi_code=kpi.kpi_code left join	"+SCHEMA+".employee em on result.employee_code=em.employee_code  left join "+SCHEMA+".period p  on" +
					" (result.period_no=p.period_no and result.year =p.year) where kpi.etl_flag='"+etl_flag.trim()+"'" +
					" and result.approved_flag = '"+approved_flag.trim()+"' and result.year="+year.intValue()+" and result.period_no="+periodNo.intValue()+" and em.employee_code='"+employeeCode+"' " +
					"";
			
		    List result= this.sessionAnnotationFactory
				.getCurrentSession()
				.createSQLQuery(query).list();
		    if(result!=null && result.size()>0){
		    	int size=result.size();
		    	kpiResult=new ArrayList<com.imake.moogle.lbs.backoffice.dto.KpiResult>(size);
		    	for (int i = 0; i < size; i++) {
		    		com.imake.moogle.lbs.backoffice.dto.KpiResult kpi =new com.imake.moogle.lbs.backoffice.dto.KpiResult();
		    		Object obj[] =(Object[])result.get(i);
		    		kpi.setYear(obj[0]!=null?(Integer)obj[0]:null);
		    		kpi.setPeriodNo(obj[1]!=null?(Integer)obj[1]:null);
		    		kpi.setPeriodDesc(obj[2]!=null?(String)obj[2]:null);
		    		kpi.setEmployeeCode(obj[3]!=null?(String)obj[3]:null);
		    		kpi.setEmpName(obj[4]!=null?(String)obj[4]:null);
		    		kpi.setKpiCode(obj[5]!=null?(String)obj[5]:null);
		    		kpi.setKpiName(obj[6]!=null?(String)obj[6]:null);
		    		kpi.setTargetScore(obj[7]!=null?(BigDecimal)obj[7]:null);
		    		kpi.setActualScore(obj[8]!=null?(BigDecimal)obj[8]:null);
		    		
		    		kpiResult.add(kpi);
				}
		    	 
		    }
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	//	System.out.println("listYear ="+list);
		return kpiResult;
	
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int approveKPIResult(Integer[] year, Integer[] periodNo,
			String[] employeeCode, String[] kpiCode, String approved_flag) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
	try{
		StringBuffer sb =new StringBuffer();
		if(employeeCode!=null && employeeCode.length>0){
			int size= employeeCode.length; 
			for (int i = 0; i < size; i++) {
				sb.setLength(0); 
				sb.append("update "+SCHEMA+".kpi_result set approved_flag=:approved_flag  " + 
						",updated_dt=now()" +
						" where year="+year[i]+" and period_no="+periodNo[i] +
						"	and employee_code='"+employeeCode[i]+"'" +
						"	and kpi_code='"+kpiCode[i]+"'");
			Query	query= session.createSQLQuery(sb.toString());
				query.setParameter("approved_flag", approved_flag); 
				returnId=query.executeUpdate();
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if (session != null) {
			session = null;
		} 
	}
			return returnId;
	}

	@Override
	public List<Threshold> searchThreshold(String thresholdName) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateThreshold(Threshold threshold) {
		// TODO Auto-generated method stub
		Session session=sessionAnnotationFactory.getCurrentSession();
		int returnId=0;
		try{
			session.update(threshold);
			returnId=1;
		}catch (Exception e) {
			// TODO: handle exception 
			e.printStackTrace();
		}finally{
			if (session != null) {
				session = null;
			} 
		}
		return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int deleteThreshold(Threshold threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.delete(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int updateObject(Object threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.update(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
	@Override
	public int deleteObject(Object threshold) {
		// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.delete(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
	}

		@Override
		public com.imake.moogle.lbs.backoffice.dto.Threshold findThresholdById(Threshold threshold,Serializable id) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			com.imake.moogle.lbs.backoffice.dto.Threshold threshold_return=null;
			try{
				threshold_return=(com.imake.moogle.lbs.backoffice.dto.Threshold)session.get(threshold.getClass(),id); 
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			//System.out.println(threshold_return+"xxxxxxxxxxxxxxxxx");
			return threshold_return;
		}

		@Override
		public Object findById(Object obj,Serializable id) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			Object obj_return=null;
			try{
				obj_return=session.get(obj.getClass(), id); 
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return obj_return;
		}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int saveThreshold(Threshold threshold) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				Serializable id =session.save(threshold);
				System.err.println(id+"xxxxxxxxxxxxxxxxxxx");
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
		}
		@Transactional(propagation = Propagation.REQUIRES_NEW,rollbackFor={RuntimeException.class})
		@Override
		public int saveObject(Object threshold) {
			// TODO Auto-generated method stub
			Session session=sessionAnnotationFactory.getCurrentSession();
			int returnId=0;
			try{
				session.save(threshold);
				returnId=1;
			}catch (Exception e) {
				// TODO: handle exception 
				e.printStackTrace();
			}finally{
				if (session != null) {
					session = null;
				} 
			}
			return returnId;
		}
	 
	 
}
