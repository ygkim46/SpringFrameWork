package com.web.dao.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.web.dto.board.BoardInfo;

public interface BoardDao {
	public List<BoardInfo> getBoardList(Map<String, Object> parameterMap) throws SQLException;
	
	public long getBoardListCount() throws SQLException;
}
