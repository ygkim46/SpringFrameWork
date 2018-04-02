package com.web.biz.member;

import java.util.Map;

import com.web.dto.member.MemberInfo;

public interface MemberService {

	public MemberInfo getUserInfo(Map<String, Object> parameterMap) throws Exception;
	
}
