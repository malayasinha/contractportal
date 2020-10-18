package com.sspl.master.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.sspl.entity.ContractTypeEntity;
import com.sspl.entity.DocumentWorkflowEntity;
import com.sspl.entity.DocumentsEntity;
import com.sspl.entity.ProfileEntity;
import com.sspl.entity.ProfileSignatoriesEntity;
import com.sspl.entity.SignatoriesMappingEntiry;
import com.sspl.entity.UsersEntity;

@Repository
public class DocumentApprovalDAOImpl implements DocumentApprovalDAO {

	private Logger loggerInfo = Logger.getLogger("tatasky_info");
	private Logger loggerTech = Logger.getLogger("tatasky_tech");

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Map<String, Object> followupDocumentList() {

		loggerInfo.info("**[ followupDocumentList List ]**");
		Map<String, Object> mapData = new HashMap<String, Object>();
		List<ContractTypeEntity> contractTypeList = new ArrayList<ContractTypeEntity>();
		List<DocumentsEntity> documentList = new ArrayList<DocumentsEntity>();
		List<ProfileSignatoriesEntity> profileSignatoriesEntityList = new ArrayList<ProfileSignatoriesEntity>();

		contractTypeList = this.sessionFactory.getCurrentSession()
				.createQuery("from ContractTypeEntity where contractStatus='N'").list();
		documentList = this.sessionFactory.getCurrentSession().createQuery("from DocumentsEntity where status='1'")
				.list();
		profileSignatoriesEntityList = this.sessionFactory.getCurrentSession()
				.createQuery("from ProfileSignatoriesEntity where status='1'").list();

		mapData.put("contractTypeList", contractTypeList);
		mapData.put("documentList", documentList);
		mapData.put("profileSignatoriesEntityList", profileSignatoriesEntityList);
		return mapData;
	}
	@Override
	public Map<String, Object> followupDocumentList(String username) {

		loggerInfo.info("**[ followupDocumentList List ]**");
		Map<String, Object> mapData = new HashMap<String, Object>();
		List<ContractTypeEntity> contractTypeList = new ArrayList<ContractTypeEntity>();
		List<DocumentsEntity> documentList = new ArrayList<DocumentsEntity>();
		List<ProfileSignatoriesEntity> profileSignatoriesEntityList = new ArrayList<ProfileSignatoriesEntity>();
		System.out.println("username in dao:"+username);
		UsersEntity userEntity = (UsersEntity) this.sessionFactory.getCurrentSession()
				.createCriteria(UsersEntity.class).add(Restrictions.eq("username", username)).uniqueResult();
				//.createQuery("from UsersEntity as ue where ue.username="+username).getSingleResult();
		Integer empId = Integer.parseInt(userEntity.getEmployeeId());
		
		System.out.println(userEntity);
		
		contractTypeList = this.sessionFactory.getCurrentSession()
				.createQuery("from ContractTypeEntity where contractStatus='N'").list();
		System.out.println(contractTypeList.get(0).getProfileSignatoriesEntity());
		Iterator<ContractTypeEntity> itr = contractTypeList.iterator();
		while(itr.hasNext()) {
			ProfileSignatoriesEntity profileSignatory = itr.next().getProfileSignatoriesEntity();
			if(profileSignatory.getSignatoryEntity1()!= null) {
				if(empId == profileSignatory.getSignatoryEntity1().getEmployeeEntity().getId()) {
					continue;
				}
			}
			if(profileSignatory.getSignatoryEntity2()!= null) {
				if(empId == profileSignatory.getSignatoryEntity2().getEmployeeEntity().getId()) {
					continue;
				}
			}
			if(profileSignatory.getSignatoryEntity3()!= null) {
				if(empId == profileSignatory.getSignatoryEntity3().getEmployeeEntity().getId()) {
					continue;
				}
			}
			if(profileSignatory.getSignatoryEntity4()!= null) {
				if(empId == profileSignatory.getSignatoryEntity4().getEmployeeEntity().getId()) {
					continue;
				}
			}
			if(profileSignatory.getSignatoryEntity5()!= null) {
				if(empId == profileSignatory.getSignatoryEntity5().getEmployeeEntity().getId()) {
					continue;
				}
			}
			itr.remove();
		}
		
		
		documentList = this.sessionFactory.getCurrentSession().createQuery("from DocumentsEntity where status='1'")
				.list();
		profileSignatoriesEntityList = this.sessionFactory.getCurrentSession()
				.createQuery("from ProfileSignatoriesEntity where status='1'").list();

		mapData.put("contractTypeList", contractTypeList);
		mapData.put("documentList", documentList);
		mapData.put("profileSignatoriesEntityList", profileSignatoriesEntityList);
		return mapData;
	}
	@Override
	public Map<String, Object> editFollowupDocumentList(Map<String, Object> map) {
		Map<String, Object> mapData = new HashMap<String, Object>();
		Integer docId = 0;
		int employeeId = 0;
		mapData.put("documentId", docId);
		
		if (map.get("employeeId") != null) {
			employeeId = (Integer) map.get("employeeId");
		}
		
		if (map.get("documentId") != null) {
			docId = (Integer) map.get("documentId");
		}
		loggerInfo.info("**[ editFollowupDocumentList Edit ContractType  ]**");
		loggerTech.info("**[ editFollowupDocumentList Edit ContractType ContractTypeid [" + docId + "] employeeId ["
				+ employeeId + "]**");
		System.out.println("**[ editFollowupDocumentList Edit ContractType ContractTypeid [" + docId + "] employeeId ["
				+ employeeId + "]**");
		List<ContractTypeEntity> editContractTypeList = new ArrayList<ContractTypeEntity>();
		List<ContractTypeEntity> contractTypeList = new ArrayList<ContractTypeEntity>();
		List<DocumentsEntity> documentList = new ArrayList<DocumentsEntity>();
		List<ProfileSignatoriesEntity> profileSignatoriesEntityList = new ArrayList<ProfileSignatoriesEntity>();
		List<SignatoriesMappingEntiry> profileSignatoriesMappingList = new ArrayList<SignatoriesMappingEntiry>();

		profileSignatoriesMappingList = this.sessionFactory.getCurrentSession()
				.createQuery("from SignatoriesMappingEntiry as mse  where mse.employeeEntity.id=" + employeeId).list();
		editContractTypeList = this.sessionFactory.getCurrentSession()
				.createQuery("from ContractTypeEntity as ue where ue.id=" + docId).list();
		contractTypeList = this.sessionFactory.getCurrentSession()
				.createQuery("from ContractTypeEntity where contractStatus='N'").list();
		if(employeeId != 0) {
			Iterator<ContractTypeEntity> itr = contractTypeList.iterator();
			while(itr.hasNext()) {
				ProfileSignatoriesEntity profileSignatory = itr.next().getProfileSignatoriesEntity();
				if(profileSignatory.getSignatoryEntity1()!= null) {
					if(employeeId == profileSignatory.getSignatoryEntity1().getEmployeeEntity().getId()) {
						continue;
					}
				}
				if(profileSignatory.getSignatoryEntity2()!= null) {
					if(employeeId == profileSignatory.getSignatoryEntity2().getEmployeeEntity().getId()) {
						continue;
					}
				}
				if(profileSignatory.getSignatoryEntity3()!= null) {
					if(employeeId == profileSignatory.getSignatoryEntity3().getEmployeeEntity().getId()) {
						continue;
					}
				}
				if(profileSignatory.getSignatoryEntity4()!= null) {
					if(employeeId == profileSignatory.getSignatoryEntity4().getEmployeeEntity().getId()) {
						continue;
					}
				}
				if(profileSignatory.getSignatoryEntity5()!= null) {
					if(employeeId == profileSignatory.getSignatoryEntity5().getEmployeeEntity().getId()) {
						continue;
					}
				}
				itr.remove();
			}
		}
		documentList = this.sessionFactory.getCurrentSession().createQuery("from DocumentsEntity where status='1'")
				.list();
		profileSignatoriesEntityList = this.sessionFactory.getCurrentSession()
				.createQuery("from ProfileSignatoriesEntity where status='1'").list();
		System.out.println(profileSignatoriesEntityList);
		
		mapData.put("profileSignatoriesMappingList", profileSignatoriesMappingList);
		mapData.put("editContractTypeList", editContractTypeList);
		mapData.put("contractTypeList", contractTypeList);
		mapData.put("documentList", documentList);
		mapData.put("profileSignatoriesEntityList", profileSignatoriesEntityList);
		return mapData;
	}
	@Override
	public Map<String, Object> approveDocument(Map<String, Object> map) {
		loggerInfo.info("**[ approveDocument update ContractType  ]**");
		loggerTech.info("**[ approveDocument update ContractType ContractTypeid ]**");
		Map<String, Object> mapData = new HashMap<String, Object>();
		ContractTypeEntity contractTypeEntity = new ContractTypeEntity();
		contractTypeEntity = (ContractTypeEntity) map.get("contractTypeEntity");

		DocumentWorkflowEntity documentWorkflowEntity = new DocumentWorkflowEntity();
		documentWorkflowEntity = (DocumentWorkflowEntity) map.get("documentWorkflowEntity");

		Session session = null;
		Transaction tx = null;

		try {
			session = this.sessionFactory.openSession();
			tx = session.beginTransaction();
			if (contractTypeEntity != null && contractTypeEntity.getId() != null && contractTypeEntity.getId() > 0) {
				ContractTypeEntity editcontractTypeEntity = (ContractTypeEntity) session.load(ContractTypeEntity.class,
						contractTypeEntity.getId());
				if (null != editcontractTypeEntity) {

					editcontractTypeEntity.setEnabled(contractTypeEntity.getEnabled());
					editcontractTypeEntity.setContractStatus(contractTypeEntity.getContractStatus());

					editcontractTypeEntity.setLastChgBy(contractTypeEntity.getLastChgBy());
					editcontractTypeEntity.setLastChgDate(new Date());
					editcontractTypeEntity.setLastChgTime(contractTypeEntity.getLastChgTime());
					session.saveOrUpdate(editcontractTypeEntity);
					loggerTech.info("**[ approveDocument  Data found ]**");
				}
			} else {
				loggerTech.info("**[ approveDocument  No Data found ]**");
			}
			session.save(documentWorkflowEntity);
			System.out.println(
					"**[ approveDocument Edit ContractType ContractTypeid [" + contractTypeEntity.getId() + "] **");
			tx.commit();
		} catch (RuntimeException e) {
			try {
				loggerTech.info("**[ approveDocument  roll back transaction ]**");

				tx.rollback();
			} catch (RuntimeException rbe) {
				loggerTech.info("**[ approveDocument Couldn�t roll back transaction ]**");

			}
			throw e;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return mapData;
	}

}
