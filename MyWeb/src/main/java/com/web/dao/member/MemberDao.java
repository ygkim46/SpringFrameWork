package com.web.dao.member;

import java.sql.SQLException;
import java.util.Map;

import com.web.dto.member.MemberInfo;

public interface MemberDao {
	public MemberInfo getUserInfo(Map<String, Object> parameterMap) throws SQLException;
}
