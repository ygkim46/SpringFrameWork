package com.web.biz.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.board.BoardDaoImpl;
import com.web.dto.board.BoardInfo;

@Service("boradService")
public class BoardServiceImpl {
	@Autowired
	private BoardDaoImpl boardDao;
	public List<BoardInfo> getBoardList(Map<String, Object> parameterMap) {
		// TODO Auto-generated method stub
		return boardDao.getBoardList(parameterMap);
	}
	public long getBoardListCount() {
		// TODO Auto-generated method stub
		return boardDao.getBoardListCount();
	}

}
