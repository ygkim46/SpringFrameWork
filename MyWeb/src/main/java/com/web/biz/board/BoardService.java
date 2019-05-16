package com.web.biz.board;

import java.util.ArrayList;
import java.util.Map;

import com.web.dto.board.BoardInfo;

public interface BoardService {
	
	public ArrayList<BoardInfo> getBoardList(Map<String, Object> parameterMap) throws Exception;
	
	public long getBoardListCount() throws Exception;
}
