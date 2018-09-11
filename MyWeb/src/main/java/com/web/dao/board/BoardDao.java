package com.web.dao.board;

import java.sql.SQLException;
import java.util.ArrayList;

import com.web.dto.board.BoardInfo;

public interface BoardDao {
	public ArrayList<BoardInfo> getBoardList() throws SQLException;
}
