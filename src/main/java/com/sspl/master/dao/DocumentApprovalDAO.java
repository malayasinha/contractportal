package com.sspl.master.dao;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

public interface DocumentApprovalDAO {

	@Transactional
	Map<String, Object> followupDocumentList();
	
	@Transactional
	Map<String, Object> followupDocumentList(String username);

	@Transactional
	Map<String, Object> editFollowupDocumentList(Map<String, Object> mapData);

	@Transactional
	Map<String, Object> approveDocument(Map<String, Object> map);
	

}
