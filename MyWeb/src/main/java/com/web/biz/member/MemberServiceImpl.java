package com.web.biz.member;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.member.MemberDaoImpl;
import com.web.dto.member.MemberInfo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDaoImpl memberDao;

	@Override
	public MemberInfo getUserInfo() throws SQLException {
		return (MemberInfo) memberDao.getUserInfo();
	}

}
