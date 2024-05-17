package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class BoardDAO {
	
	//GetConn getConn = GetConn.getInstance();
	
	private Connection conn = GetConn.getConn();
	//private Connection conn2 = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	BoardVO vo = null;
	
	public BoardDAO() {
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

	// 게시글 전체 가져오기
	// 전체 게시글 보기
		public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize, String contentsShow, String search, String searchString) {
			ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
			try {
				if(search == null || search.equals("")) {
					if(contentsShow.equals("adminOK")) {
					  sql = "select *, datediff(wDate, now()) as date_diff, "
					  		+ "timestampdiff(hour, wDate, now()) as hour_diff, "
					  		+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
					  		+ "from board b order by idx desc limit ?,?";
					  pstmt = conn.prepareStatement(sql);
					  pstmt.setInt(1, startIndexNo);
					  pstmt.setInt(2, pageSize);
					}
					else {
						sql = "select *, datediff(wDate, now()) as date_diff, "
								+ "timestampdiff(hour, wDate, now()) as hour_diff, "
								+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
								+ "from board b where openSW = 'OK' and complaint = 'NO' union "
								+ "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff, "
								+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
								+ "from board b "
								+ "where mid = ? order by idx desc limit ?,?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, contentsShow);
						pstmt.setInt(2, startIndexNo);
						pstmt.setInt(3, pageSize);
					}
				}
				else {
					if(contentsShow.equals("adminOK")) {
					  sql = "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff, "
					  		+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
					  		+ "from board b where "+search+" like ? order by idx desc limit ?,?";
					  pstmt = conn.prepareStatement(sql);
					  pstmt.setString(1, "%"+searchString+"%");
					  pstmt.setInt(2, startIndexNo);
					  pstmt.setInt(3, pageSize);
					}
					else {
						sql = "select *, datediff(wDate, now()) as date_diff, "
								+ "timestampdiff(hour, wDate, now()) as hour_diff, "
								+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
								+ "from board b where openSW = 'OK' and complaint = 'NO' and "+search+" like ? union "
								+ "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff,"
								+ "(select count(*) from boardReply where boardIdx = b.idx) as replyCnt "
								+ " from board b "
								+ "where mid = ? and "+search+" like ? order by idx desc limit ?,?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%"+searchString+"%");
						pstmt.setString(2, contentsShow);
						pstmt.setString(3, "%"+searchString+"%");
						pstmt.setInt(4, startIndexNo);
						pstmt.setInt(5, pageSize);
					}
				}
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new BoardVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setNickName(rs.getString("nickName"));
					vo.setTitle(rs.getString("title"));
					vo.setContent(rs.getString("content"));
					vo.setReadNum(rs.getInt("readNum"));
					vo.setHostIp(rs.getString("hostIp"));
					vo.setOpenSw(rs.getString("openSw"));
					vo.setwDate(rs.getString("wDate"));
					vo.setGood(rs.getInt("good"));
					vo.setComplaint(rs.getString("complaint"));
					
					vo.setHour_diff(rs.getInt("hour_diff"));
					vo.setDate_diff(rs.getInt("date_diff"));
					
					vo.setReplyCnt(rs.getInt("replyCnt"));
					
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL 오류.. : " + e.getMessage());
			} finally {
				rsClose();			
			}
			return vos;
		}

	// 게시글 등록
	public int setBoardInput(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default, ?, ?, ?, ?, default, ?, ?, default, default, default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 내용 보기
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 게시글 조회수 증가
	public void setBoardReadNumPlus(int idx) {
		try {
			sql = "update board set readNum = readNum+1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 게시글 삭제
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx=?";
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

	// 게시글 총 레코드 건수 가져오기
	public int getTotalRecCnt(String contentsShow, String search, String searchString) {
		int totRecCnt = 0;
		try {
			if(search == null || search.equals("")) {
				if(contentsShow.equals("adminOK")) {
				  sql = "select count(*) as cnt from board";
				  pstmt = conn.prepareStatement(sql);
				}
				else {
					sql = "select sum(a.cnt) as cnt from (select count(*) as cnt from board where openSW = 'OK' and complaint = 'NO' union select count(*) as cnt from board where mid = ? and (openSW = 'NO' or complaint = 'OK')) as a";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, contentsShow);
				}
			}
			else { // 검색어 조건 추가
				if(contentsShow.equals("adminOK")) {
					sql = "select count(*) as cnt from board where "+search+" like ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+searchString+"%");
				}
				else {
					sql = "select sum(a.cnt) as cnt from (select count(*) as cnt from board where openSW = 'OK' and complaint = 'NO' and "+search+" like ? union select count(*) as cnt from board where mid = ? and (openSW = 'NO' or complaint = 'OK') and "+search+" like ?) as a";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%"+searchString+"%");
					pstmt.setString(2, contentsShow);
					pstmt.setString(3, "%"+searchString+"%");
				}
			}
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 오류!! : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return totRecCnt;
	}

	// 이전글/다음글 idx,title,nickName,wDate 가져오기
	public BoardVO getPreNextSearch(int idx, String str) {
		BoardVO vo = new BoardVO();
		try {
			if(str.equals("preVo")) sql = "select idx, title, nickName, wDate from board where idx < ? order by idx desc limit 1";
			else sql = "select idx, title, nickName, wDate from board where idx > ? order by idx limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 게시글 좋아요 수 증가처리
	public int setBoardGoodCheck(int idx) {
		int res = 0;
		try {
			sql = "update board set good = good+1 where idx=?";
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

	// 게시글 좋아요 중복불가
	public void setBoardGoodCheckPlusMinus(int idx, int goodCnt) {
		try {
			sql = "update board set good = good + ? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 게시글 수정하기
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "update board set title=?, content=?, openSw=?, hostIp=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 댓글 가져오기
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		ArrayList<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
		try {
			sql = "select * from boardReply where boardIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			BoardReplyVO vo = null;
			while(rs.next()) {
				vo = new BoardReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setwDate(rs.getString("wDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setContent(rs.getString("content"));
				replyVos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			rsClose();
		}
		return replyVos;
	}

	// 댓글 작성
	public int setReplyInput(BoardReplyVO vo) {
		int res = 0;
		try {
			sql = "insert into boardReply values (default, ?, ?, ?, default, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoardIdx());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setString(5, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql 오류 "+e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 댓글 삭제
	public int setReplyDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from boardReply where idx=?";
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
