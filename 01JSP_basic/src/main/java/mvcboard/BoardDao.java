package mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionPool;
import dto.Board;
import dto.Criteria;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시물을 조회합니다.
	 * @param criteria
	 * @return
	 */
	public List<BoardDto> getListPage(mvcboard.Criteria criteria) {
		List<BoardDto> boardlist = new ArrayList<BoardDto>();		
		String sql = "SELECT * FROM (SELECT T.*, ROWNUM RNUM FROM ("
						+ "SELECT IDX, NAME, TITLE, CONTENT"
							+ ", DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE)"
							+ ", TO_CHAR(POSTDATE, 'HH24:MI:SS')"
							+ ", TO_CHAR(POSTDATE, 'YYYY-MM-DD')) POSTDATE"
							+ ", OFILE, SFILE, DOWNCOUNT, PASS, VISITCOUNT "
						+ "FROM MVCBOARD ";	
		if(criteria.getSearchword()!=null && !"".equals(criteria.getSearchword())) {
			sql += "WHERE " + criteria.getSearchfield() + " LIKE '%" + criteria.getSearchword() + "%' ";
		}
		sql += "ORDER BY IDX DESC) T) "
				+ "WHERE RNUM BETWEEN " + criteria.getStartnum() + " AND " + criteria.getEndnum();
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
				BoardDto board = new BoardDto();
				board.setIdx(rs.getInt(1));
				board.setName(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setPostdate(rs.getString(5));
				board.setOfile(rs.getString(6));
				board.setSfile(rs.getString(7));
				board.setDowncount(rs.getInt(8));
				board.setPass(rs.getString(9));
				board.setVisitcount(rs.getInt(10));
				boardlist.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}		
		return boardlist;
	}

	/**
	 * 전체 게시물의 수를 반환합니다.
	 * @return
	 */
	public int getTotalcount(mvcboard.Criteria criteria) {
		int totalcount = 0;		
		String sql = "SELECT COUNT(*) FROM BOARD ";
		if(criteria.getSearchword()!=null && !"".equals(criteria.getSearchword())) {
			sql += "WHERE " + criteria.getSearchfield() + " LIKE '%" + criteria.getSearchword() + "%' ";
		}		
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				totalcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("전체 게시물 수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return totalcount;
	}
}
