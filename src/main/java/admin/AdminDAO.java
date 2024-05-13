package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class AdminDAO {
	
	//GetConn getConn = GetConn.getInstance();
	
	private Connection conn = GetConn.getConn();
	//private Connection conn2 = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	MemberVO vo = null;
	
	public AdminDAO() {
		//if(conn == conn2) System.out.println("같은 객체입니다.");
		//else System.out.println("다른 객체입니다.");
	}
	
	// conn.close()는 현재 싱글톤객체여서 여기서 닫으면 안됨
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (Exception e) {}
			finally {
				pstmtClose();
			}
		}
	}

	// 관리자모드에서 레벨별 회원 보기
	public ArrayList<MemberVO> getAdminMemberList(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(level == 999) {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member where level=? order by idx";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원들 등급 변경
	public int setMemberLevelChange(int idx, int level) {
		int res = 0;
		try {
			if(level == 99) {
				sql = "update member set level=?, userDel='OK' where idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, idx);
			}
			else {
				sql = "update member set level=?, userDel='NO' where idx=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
				pstmt.setInt(2, idx);
			}
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 회원 DB에서 영구삭제
	public int MemberDeleteOk(int idx) {
		int res = 0;
		try {
			sql = "delete from member where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
}
