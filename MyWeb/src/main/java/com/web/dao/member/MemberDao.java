package com.web.dao.member;

import java.sql.SQLException;

import com.web.dto.member.MemberInfo;

public interface MemberDao {
	public MemberInfo getUserInfo() throws SQLException;
}
