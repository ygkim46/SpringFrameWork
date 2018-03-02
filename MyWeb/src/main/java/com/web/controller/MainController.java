package com.web.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.biz.member.MemberServiceImpl;
import com.web.dto.member.MemberInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberServiceImpl memberService;

	public MemberServiceImpl getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberServiceImpl memberService) {
		this.memberService = memberService;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws SQLException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		MemberInfo info = new MemberInfo();
		info = memberService.getUserInfo();
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("userInfo",info);
		return "main";
	}
	
}
