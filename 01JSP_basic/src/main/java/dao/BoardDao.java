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
	
	public List<Board> getList() {
		List<Board> boardlist = new ArrayList<Board>();		
		String sql = "SELECT * FROM BOARD ORDER BY NUM DESC";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			ResultSet rs = pstmt.executeQuery();
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
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}		
		return boardlist;
	}
	
	/**
	 * 전체 게시물의 개수를 반환
	 * @return
	 */
	public int getTotalCount() {
		int totalcount = 0;
		String sql = "SELECT COUNT(*) FROM BOARD";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				totalcount = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("전체 게시물의 개수 조회 중 예외 발생");
			e.printStackTrace();
		}
		return totalcount;
	}

}
