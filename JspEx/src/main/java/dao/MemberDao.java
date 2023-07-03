package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtil;
import dto.Member;

public class MemberDao {

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 로그인 
	 * 아이디/비밀번호가 일치하는 회원을 조회합니다.
	 * - 회원이 존재하는 경우 Member 객체를 반환합니다.
	 * - 회원이 존재하지 않는 경우 null을 반환합니다.
	 * @param id
	 * @param pw
	 * @return
	 */
	public Member login(String id, String pw) {
		Member member = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=? AND PASS=?";		
		try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);) {
			psmt.setString(1, id);
			psmt.setString(2, pw);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				String loginid = rs.getString("id");
				String name = rs.getString("name");
				String regidate = rs.getString("regidate");				
				member = new Member(loginid, "", name, regidate);
			};
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return member;
	}
	
	/**
	 * 회원등록
	 * @param member
	 * @return
	 */
	public int insert(Member member) {
		int i = 0;
		String sql = "INSERT INTO MEMBER VALUES (?, ?, ?, SYSDATE)";		
		try(Connection conn = ConnectionUtil.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			i = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}
