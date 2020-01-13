package com.situ.reiz.user.service;

import java.util.List;

import com.situ.reiz.base.FieldParam;
import com.situ.reiz.user.domain.User;

public interface UserService {
	Long saveUser(User user, Integer userKind);

	void initAdminData();

	List<User> findAllUser();

	String checkUserCode(FieldParam fieldParam);

	Long addUser(User user);

	Integer doUserLock(Long rowId, Integer isLock);
}
