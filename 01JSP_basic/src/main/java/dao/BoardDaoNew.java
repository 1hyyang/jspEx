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

public class BoardDaoNew {

	public BoardDaoNew() {
		// TODO Auto-generated constructor stub
	}

	public List<Board> getListPage(Criteria criteria){
		List<Board> boardlist = new ArrayList<>();
		
		String sql = "SELECT * FROM (SELECT T.*, ROWNUM RNUM FROM ("
						+ "SELECT NUM, TITLE, CONTENT, ID"
							+ ", DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE)"
								+ ", TO_CHAR(POSTDATE, 'HH24:MI:SS')"
								+ ", TO_CHAR(POSTDATE, 'YYYY-MM-DD')) POSTDATE"
							+ ", VISITCOUNT "
						+ "FROM BOARD ";	
		if(criteria.getSearchword()!=null && !"".equals(criteria.getSearchword())) {
			sql += "WHERE " + criteria.getSearchfield() + " LIKE '%" + criteria.getSearchword() + "%' ";
		}
		sql += "ORDER BY NUM DESC) T) "
				+ "WHERE RNUM BETWEEN " + criteria.getStartnum() + " AND " + criteria.getEndnum();

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
	
	public int getTotalcount(Criteria criteria) {
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
	
	public int insertPost(Board board) {
		int res = 0;
		String sql = "INSERT INTO BOARD VALUES (SEQ_BOARD_NUM.NEXTVAL, ?, ?, ?, SYSDATE, 0)";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent().replace("\r\n", "<br>"));
			pstmt.setString(3, board.getId());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;		
	}
	
	public int insertPostNum(String id) {
		int num = 0;
		String sql = "SELECT MAX(NUM) FROM BOARD WHERE ID = '" + id + "'";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return num;
	}
	
	public Board selectPost(String num) {
		Board board = null;
		String sql = "SELECT * FROM BOARD WHERE NUM = " + num;		
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				board = new Board();
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setId(rs.getString(4));
				board.setPostdate(rs.getString(5));
				board.setVisitcount(rs.getInt(6));
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
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("조회수 업데이트 중 예외 발생");
			e.printStackTrace();
		}
		return res; 
	}
	
	public int updatePost(Board board) {
		int res = 0;
		String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE NUM = ?";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent().replace("\r\n", "<br>"));
			pstmt.setInt(3, board.getNum());			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public int deletePost(String num) {
		int res = 0;
		String sql = "DELETE FROM BOARD WHERE NUM = " + num;
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
}
