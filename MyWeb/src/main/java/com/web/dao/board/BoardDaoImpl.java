package com.web.dao.board;

import java.util.ArrayList;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.web.dto.board.BoardInfo;

@Repository("boardDao")
public class BoardDaoImpl extends SqlSessionDaoSupport implements BoardDao {

	public ArrayList<BoardInfo> getBoardList() {
		// TODO Auto-generated method stub
		return (ArrayList<BoardInfo>)getSqlSession().selectOne("BoardInfo.getBoardList");
	}

}
