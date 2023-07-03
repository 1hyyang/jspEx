package fileupload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionPool;

public class FileDao {

	public FileDao() {
		// TODO Auto-generated constructor stub
	}
	
	public int insertFile(FileDto file) {
		int res = 0;
		String sql = "INSERT INTO MYFILE (IDX, NAME, TITLE, CATE, OFILE, SFILE, POSTDATE) "
				+ "VALUES (SEQ_MYFILE_NUM.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";		
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, file.getName());
			pstmt.setString(2, file.getTitle());
			pstmt.setString(3, file.getCate());
			pstmt.setString(4, file.getOfile());
			pstmt.setString(5, file.getSfile());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("파일 등록 중 예외 발생");
			e.printStackTrace();
		}
		return res;
	}
	
	public List<FileDto> getFileList(){
		List<FileDto> filelist = new ArrayList<FileDto>();		
		String sql = "SELECT * FROM MYFILE ORDER BY IDX DESC";
		try(Connection conn = ConnectionPool.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
				FileDto file = new FileDto();
				file.setIdx(rs.getInt(1));
				file.setName(rs.getString(2));
				file.setTitle(rs.getString(3));
				file.setCate(rs.getString(4));
				file.setOfile(rs.getString(5));
				file.setSfile(rs.getString(6));
				file.setPostdate(rs.getString(7));
				filelist.add(file);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("등록된 파일 조회 중 예외 발생");
			e.printStackTrace();
		}
		return filelist;		
	}

}
