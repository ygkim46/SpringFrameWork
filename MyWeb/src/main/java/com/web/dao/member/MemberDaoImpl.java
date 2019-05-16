package com.web.dao.member;

import java.sql.SQLException;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.web.dto.member.MemberInfo;

@Repository("memberDao")
public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {
	
	@Override
	public MemberInfo getUserInfo(Map<String, Object> parameterMap) {
		return (MemberInfo)getSqlSession().selectOne("MemberInfo.getUserInfo", parameterMap);
	}

	@Override
	public void insertMemberInfo(Map<String, Object> parameterMap) throws SQLException {
		getSqlSession().insert("MemberInfo.insertMemberInfo", parameterMap);
	}

	public int searchMemberInfo(Map<String, Object> parameterMap) {
		return (Integer)getSqlSession().selectOne("MemberInfo.searchMemberInfo", parameterMap);
	}
	
}
