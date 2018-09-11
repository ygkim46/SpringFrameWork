package com.web.biz.board;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.board.BoardDaoImpl;
import com.web.dto.board.BoardInfo;

@Service("boradService")
public class BoardServiceImpl {
	@Autowired
	private BoardDaoImpl boardDao;
	public ArrayList<BoardInfo> getBoardList() {
		// TODO Auto-generated method stub
		return boardDao.getBoardList();
	}

}
