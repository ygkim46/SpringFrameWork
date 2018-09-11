package com.web.controller;

import java.io.*;
import java.net.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.biz.board.BoardServiceImpl;
import com.web.biz.member.MemberServiceImpl;
import com.web.dto.board.BoardInfo;
import com.web.dto.member.MemberInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private MemberServiceImpl memberService;

	@Autowired
	private BoardServiceImpl boradService;
	
	
	public MemberServiceImpl getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberServiceImpl memberService) {
		this.memberService = memberService;
	}

	public BoardServiceImpl getBoradService() {
		return boradService;
	}

	public void setBoradService(BoardServiceImpl boradService) {
		this.boradService = boradService;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws SQLException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "main";
	}
	
	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public void loginChk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> parameterMap = new HashMap<String, Object>();

		parameterMap.put("id", request.getParameter("id"));
		parameterMap.put("password", request.getParameter("password"));
		
		MemberInfo info = new MemberInfo();

		info = memberService.getUserInfo(parameterMap);
		JSONObject obj = new JSONObject();
		if(info != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", info.getId());
			session.setAttribute("name", info.getName());
			obj.put("isLogin", true);
		} else {
			obj.put("isLogin", false);
		}
		response.getWriter().write(obj.toJSONString());
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("id");
	}
	
	@RequestMapping(value = "/joinPrc", method = RequestMethod.POST)
	public void joinPrc(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("id", request.getParameter("id"));
		parameterMap.put("name", request.getParameter("name"));
		parameterMap.put("password", request.getParameter("password"));
		
		memberService.insertMemberInfo(parameterMap);
	}
	
	@RequestMapping(value = "/inptIdChkAjax", method = RequestMethod.GET)
	public void inptIdChkAjax(HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("id", request.getParameter("id"));
		
		JSONObject obj = new JSONObject();
		
		int cnt = memberService.searchMemberInfo(parameterMap);
		
		if(cnt > 0) {
			obj.put("result", false);
		} else {
			obj.put("result", true);
		}
		
		response.getWriter().write(obj.toJSONString());
	}
	
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public void getBoardList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		JSONObject obj = new JSONObject();
		
		ArrayList<BoardInfo> list = new ArrayList<BoardInfo>();

		list = boradService.getBoardList();
		
		response.getWriter().write(obj.toJSONString());
	}
	
}
