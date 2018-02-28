package com.web.dao.member;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.web.dto.member.MemberInfo;

@Repository("memberDao")
public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {
	
	@Override
	public MemberInfo getUserInfo() {
		return (MemberInfo)getSqlSession().selectOne("com.web.dao.member.MemberDao.getUserInfo");
	}

}
