package com.situ.reiz.user.service.impl;

import java.util.Date;

import javax.annotation.PostConstruct;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.reiz.user.dao.UserDao;
import com.situ.reiz.user.domain.User;
import com.situ.reiz.user.service.UserService;
import com.situ.reiz.util.ConfigUtils;
import com.situ.reiz.util.MD5Utils;

@Service
public class UserServiceImpl implements UserService {
	private static final Log LOG = LogFactory.getLog(UserServiceImpl.class);
	@Autowired
	private UserDao userDao;

	@Override
	public Long saveUser(User user, Integer userKind) {
		// TODO Auto-generated method stub
		return null;
	}

	// @PostConstruct 当UserServiceImpl这个实例生成以后，会马上自动调用这个方法。
	@Override
	@PostConstruct
	public void initAdminData() {
		LOG.info("当UserServiceImpl这个实例生成以后，会马上自动调用这个方法。");
		String userCode = "admin";
		String userPass = "123456";
		// 判断当前数据库中是否有这个用户
		User user = userDao.findByCode(userCode);
		if (user == null) {
			user = new User();
			user.setUserName("管理员");
			user.setUserCode(userCode);
			user.setUserPass(MD5Utils.encode(userPass));
			user.setUserKind(User.USER_KIND_ADMIN);
			user.setIsLock(User.IS_LOCK_NO);
			user.setActiveFlag(1);
			user.setCreateBy(ConfigUtils.SYS);
			user.setCreateDate(new Date());
			this.userDao.save(user);
		}
	}

}
