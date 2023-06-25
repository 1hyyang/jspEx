package mvcboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionPool;
import dto.Board;
import mvcboard.BoardDto;
import mvcboard.Criteria;

public class BoardDao {

	public BoardDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 게시물을 조회합니다.
	 * @param criteria
	 * @return
	 */
	public List<BoardDto> getListPage(Criteria criteria) {
		List<BoardDto> boardlist = new ArrayList<BoardDto>();		
		String sql = "SELECT * FROM (SELECT T.*, ROWNUM RNUM FROM ("
						+ "SELECT IDX, NAME, TITLE, CONTENT"
							+ ", DECODE(TRUNC(SYSDATE), TRUNC(POSTDATE)"
							+ ", TO_CHAR(POSTDATE, 'HH24:MI:SS')"
							+ ", TO_CHAR(POSTDATE, 'YYYY-MM-DD')) POSTDATE"
							+ ", OFILE, SFILE, DOWNCOUNT, PASS, VISITCOUNT "
						+ "FROM MVCBOARD ";	
		// 검색 조건이 없을 경우 criteria.getSearchword()에 의해 searchword가 빈 문자열""로 초기화되므로 if문을 실행하지 않는다.
		if(!"".equals(criteria.getSearchword())) {
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
	public int getTotalcount(Criteria criteria) {
		int totalcount = 0;		
		String sql = "SELECT COUNT(*) FROM MVCBOARD ";
		if(!"".equals(criteria.getSearchword())) {
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
	
	/**
	 * 게시물을 등록합니다.
	 * @return
	 */
	public int insertPost(BoardDto board) {
		int res = 0;		
		String sql = "INSERT INTO MVCBOARD VALUES (SEQ_MVCBOARD_IDX.NEXTVAL, ?, ?, ?, SYSDATE, ?, ?, 0, ?, 0)";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent().replace("\r\n", "<br>"));			
			pstmt.setString(4, board.getOfile());			
			pstmt.setString(5, board.getSfile());			
			pstmt.setString(6, board.getPass());			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시물 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	

	public int insertPostIdx(String name, String pass) {
		int idx = 0;		
		String sql = "SELECT MAX(IDX) FROM MVCBOARD WHERE NAME = '" + name + "' AND PASS = '" + pass + "'";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("게시글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return idx;
	}
	
	/**
	 * 게시글을 조회합니다.
	 * @param idx
	 * @return
	 */
	public BoardDto selectPost(String idx) {
		BoardDto board = null;
		String sql = "SELECT * FROM MVCBOARD WHERE IDX = " + idx;
		if(idx==null || "".equals(idx)) {
			return null;
		}
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			if(rs.next()) {
				board = new BoardDto();
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
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.err.println("게시글 조회 중 예외 발생");
			e.printStackTrace();
		}		
		return board;
	}

	public boolean confirmPassword(String idx, String pass) {
		boolean res = false;
		String sql = "SELECT * FROM MVCBOARD WHERE IDX = " + idx + " AND PASS = '" + pass + "'";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			res = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public int deletePost(String idx) {
		int res = 0;
		String str = "DELETE FROM MVCBOARD WHERE IDX = " + idx ;		
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(str);) {
			res = pstmt.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
}
