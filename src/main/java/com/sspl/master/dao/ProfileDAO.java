package com.sspl.master.dao;

import java.util.Map;

import com.sspl.entity.ProfileEntity;

public interface ProfileDAO {

	Map<String, Object> viewProfile();

	Map<String, Object> modifyProfile(Map<String, Object> map);

	Map<String, Object> saveProfile(Map<String, Object> map);

	Map<String, Object> editProfile(Integer id);

	ProfileEntity getProfile(Integer id);
}
