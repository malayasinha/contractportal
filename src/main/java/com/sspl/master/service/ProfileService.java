package com.sspl.master.service;

import java.util.Map;

import com.sspl.entity.ProfileEntity;

public interface ProfileService {

	ProfileEntity getProfile(Integer profileId);
	Map<String, Object> viewProfile();

	Map<String, Object> modifyProfile(Map<String, Object> map);

	Map<String, Object> saveProfile(Map<String, Object> map);

	Map<String, Object> editProfile(Integer id);

}
