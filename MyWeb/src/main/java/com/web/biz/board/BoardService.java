package com.web.biz.board;

import java.util.ArrayList;

import com.web.dto.board.BoardInfo;

public interface BoardService {
	
	public ArrayList<BoardInfo> getBoardList() throws Exception;
}
