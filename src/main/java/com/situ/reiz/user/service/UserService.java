package com.situ.reiz.user.service;

import com.situ.reiz.user.domain.User;

public interface UserService {
	Long saveUser(User user, Integer userKind);
	
	void initAdminData();
}
