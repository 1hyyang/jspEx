package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionPool;
import dto.Board;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시글을 조회합니다.
	 * @param searchfield
	 * @param searchword
	 * @return List<Board>
	 */
	public List<Board> getList(String searchfield, String searchword) {
		List<Board> boardlist = new ArrayList<Board>();		
		String sql = "SELECT * FROM BOARD ";
		// 검색어가 입력되면 검색 조건을 추가		
		if(searchword!=null && !"".equals(searchword)) {
			sql += "WHERE " + searchfield + " LIKE '%" + searchword + "%' ";
		} else {
			sql += "";
		}
		sql += "ORDER BY NUM DESC";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
//				int num = rs.getInt(1);
//				String title = rs.getString(2);
//				String content = rs.getString(3);
//				String id = rs.getString(4);
//				String postdate = rs.getString(5);				
//				int visitcount = rs.getInt(6);
//				Board board = new Board(num, title, content, id, postdate, visitcount);
//				boardlist.add(board);
				Board board = new Board();
				board.setNum(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setId(rs.getString(4));
				board.setPostdate(rs.getString(5));				
				board.setVisitcount(rs.getInt(6));	
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
	 * 전체 게시물의 개수를 반환합니다.
	 * @return
	 */
	public int getTotalCount(String searchfield, String searchword) {
		int totalcount = 0;
		String sql = "SELECT COUNT(*) FROM BOARD ";
		if(searchword!=null && !"".equals(searchword)) {
			sql += "WHERE " + searchfield + " LIKE '%" + searchword + "%' ";
		} else {
			sql += "";
		}
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				totalcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("전체 게시물의 개수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return totalcount;
	}
	
	/**
	 * 게시물을 등록합니다.
	 * @return
	 */
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

	/**
	 * 게시글 번호를 전달 받아 게시글을 조회합니다.
	 * @param num
	 * @return
	 */
	public Board selectPost(String num) {
		Board board = null;
		String sql = "SELECT * FROM BOARD WHERE NUM = " + num;
		if(num==null || "".equals(num)) {
			return null;
		}
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
			// TODO Auto-generated catch block
			System.err.println("게시글 조회 중 예외 발생");
			e.printStackTrace();
		}		
		return board;
	}
	
	/**
	 * 게시글의 조회수를 업데이트(+1)합니다. 
	 * @param num
	 * @return
	 */
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
	
	/**
	 * 게시글을 수정합니다.
	 * @param board
	 * @return
	 */
	public int updatePost(Board board) {
		int res = 0;
		String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE NUM = ?";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	/**
	 * 게시글을 삭제합니다.
	 * @param num
	 * @return
	 */
	public int deletePost(String num) {
		int res = 0;
		String sql = "DELETE FROM BOARD WHERE NUM = " + num;
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {	
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시글 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
}