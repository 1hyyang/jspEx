package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionPool;
import dto.Board;
import dto.Criteria;

public class BoardPagingDao {

	public BoardPagingDao() {
		// TODO Auto-generated constructor stub
	}

	public List<Board> getListPage(Criteria criteria){
		List<Board> boardlist = new ArrayList<>();
		String sql = "SELECT * FROM (SELECT ROWNUM RN, T.* FROM ("
						+ "SELECT NUM, TITLE, CONTENT, ID"
							+ ", DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE)"
								+ ", TO_CHAR(POSTDATE, 'HH24:MI:SS')"
								+ ", TO_CHAR(POSTDATE, 'YYYY-MM-DD')) POSTDATE"
							+ ", VISITCOUNT "
						+ "FROM BOARD ";	
		if(criteria.getSearchword()!=null && !"".equals(criteria.getSearchword())) {
			sql += "WHERE " + criteria.getSearchfield() + " LIKE '%" + criteria.getSearchword() + "%' ";
		}
		sql += "ORDER BY NUM) T) "
				+ "WHERE RN BETWEEN " + criteria.getStartNo() + " AND " + criteria.getEndNo() 
				+ " ORDER BY NUM DESC";

		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("NUM"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				board.setId(rs.getString("ID"));
				board.setPostdate(rs.getString("POSTDATE"));
				board.setVisitcount(rs.getInt("VISITCOUNT"));
				boardlist.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return boardlist;
	}
	
	public int insertPost(Board board) {
		int res = 0;
		String sql = "INSERT INTO BOARD VALUES (SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, SYSDATE, 0)";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getId());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;		
	}
	
	public Board selectPost(String num) {
		Board board = null;
		String sql = "SELECT * FROM BOARD WHERE NUM = " + num;		
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				board = new Board();
				board.setNum(rs.getInt("NUM"));
				board.setTitle(rs.getString("TITLE"));
				board.setContent(rs.getString("CONTENT"));
				board.setId(rs.getString("ID"));
				board.setPostdate(rs.getString("POSTDATE"));
				board.setVisitcount(rs.getInt("VISITCOUNT"));
			}
		} catch (SQLException e) {
			System.out.println("게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public int updateVisitcount(String num) {
		int res = 0;
		String sql = "UPDATE BOARD SET VISITCOUNT = VISITCOUNT+1 WHERE NUM = " + num;
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("조회수 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return res; 
	}
	
}
