package study.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	String sql = "";
	LoginVO vo = null;
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/javaclass", user = "root", password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패 "+e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB 연결 실패 "+e.getMessage());
		}
	}
	
	// 사용한 객체의 반납(conn 반납)
	public void connClose() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
	}
	// 사용한 객체의 반납(pstmt 반납)
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	// 사용한 객체의 반납(rs 반납)
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	public LoginVO getLoginIdCheck(String mid, String pwd) {
		vo = new LoginVO();
		try {
			sql = "select * from hoewon where mid=? and pwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 전체 회원 정보 검색
	public ArrayList<LoginVO> getLoginList() {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "select * from hoewon order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 가입 처리
	public int setLoginInput(LoginVO vo) {
		int res = 0;
		try {
			sql = "insert into hoewon values(default,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setInt(4, vo.getAge());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getAddress());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 최근 가입한 5명의 회원
	public ArrayList<LoginVO> getRecentFiveMember() {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "select * from hoewon order by idx desc limit 5";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 이름으로 자료 검색
	public ArrayList<LoginVO> getLoginSearch(String name) {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		try {
			sql = "select * from hoewon where name like ? order by name";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// idx로 검색
	public LoginVO getLoginIdxSearch(int idx) {
		vo = new LoginVO();
		try {
			sql = "select * from hoewon where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원 정보 수정
	public int setLoginUpdate(LoginVO vo) {
		int res = 0;
		try {
			sql = "update hoewon set pwd=?,name=?,age=?,gender=?,address=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPwd());
			pstmt.setString(2, vo.getName());
			pstmt.setInt(3, vo.getAge());
			pstmt.setString(4, vo.getGender());
			pstmt.setString(5, vo.getAddress());
			pstmt.setInt(6, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 정보 삭제(아이디가 중복불가일 경우로 가정)
	public void setLoginDelete(String mid) {
		try {
			sql = "delete from hoewon where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 회원 정보 정렬해서 보기
	public ArrayList<LoginVO> getLoginSortList(String val) {
		ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
		sql = "select * from hoewon order by ";
		
		switch(val) {
			case "idx" : sql+="idx"; break;
			case "idxDesc" : sql+="idx desc"; break;
			case "name" : sql+="name"; break;
			case "nameDesc" : sql+="name desc"; break;
			case "age" : sql+="age"; break;
			case "ageDesc" : sql+="age desc"; break;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new LoginVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setAge(rs.getInt("age"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
}
