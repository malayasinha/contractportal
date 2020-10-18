package com.sspl.master.dao;

import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

public interface ProfileWorkflowDAO {
	@Transactional
	Map<String, Object> viewProfileWorkflow();
	@Transactional
	Map<String, Object> saveProfileWorkflow(Map<String, Object> map);
	@Transactional
	Map<String, Object> editProfileWorkflow(Integer id);
}
