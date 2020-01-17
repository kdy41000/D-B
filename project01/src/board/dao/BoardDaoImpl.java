package board.dao;

import static board.db.JDBCTemplate.*;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import board.dto.BoardDto;

public class BoardDaoImpl implements BoardDao{

	@Override
	public List<BoardDto> totalcnt() {   //전체 게시글 수
		//3.쿼리준비
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
	
		List<BoardDto>list = new ArrayList();
		
		try {
			pstm = con.prepareStatement(SELECT_LIST_SQL);
		
			//4.쿼리실행 및 리턴
			rs = pstm.executeQuery();  //부모인터페이스에서 쿼리문 상속
			
			while(rs.next()) {
				BoardDto dto = new BoardDto(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getInt(5),
										rs.getDate(6),
										rs.getInt(7),
										rs.getString(8));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR] : 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);	
		}
		
		return list;
	}
	@Override
	public List<BoardDto> selectPaging(int startseq, int endseq) {   //페이징 번호10개씩 리턴
		//3.쿼리준비
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<BoardDto>list = new ArrayList();
		
		try {
			pstm = con.prepareStatement(ROWNUM_LIST_SQL);
			pstm.setInt(1, startseq);
			pstm.setInt(2, endseq);
			//4.쿼리실행 및 리턴
			rs = pstm.executeQuery();  //부모인터페이스에서 쿼리문 상속
			
			while(rs.next()) {
				BoardDto dto = new BoardDto(rs.getInt(1),
											rs.getString(2),
											rs.getString(3),
											rs.getString(4),
											rs.getInt(5),
											rs.getDate(6),
											rs.getInt(7),
											rs.getString(8));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR] : 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);	
		}
		
		return list;
	}
	@Override
	public BoardDto selectOne(int boa_seq) {  //title클릭시 상세게시판
		
		Connection con = getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		BoardDto res = null;
		
		try {
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(SELECT_ONE_SQL+boa_seq);
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setBoa_seq(rs.getInt(1));
				dto.setMem_id(rs.getString(2));
				dto.setBoa_title(rs.getString(3));
				dto.setBoa_content(rs.getString(4));
				dto.setBoa_cnt(rs.getInt(5));
				dto.setBoa_image(rs.getString(6));
				
				res = dto;
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(rs,stmt,con);
		}
		
		return res;
	}

	@Override
	public int insert(BoardDto dto) {   //게시판 글쓰기
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, dto.getBoa_title());
			pstm.setString(2, dto.getBoa_content());
			pstm.setInt(3, 0);
			pstm.setInt(4, dto.getBoa_category());
			pstm.setString(5, dto.getBoa_image());
			res = pstm.executeUpdate();
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		return res;
	}

	@Override
	public int update(BoardDto dto) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(UPDATE_SQL);
			pstm.setString(1, dto.getBoa_title());
			pstm.setString(2, dto.getBoa_content());
			pstm.setInt(3, dto.getBoa_seq());
			
			res = pstm.executeUpdate();
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
	
		return res;
	}

	@Override
	public int delete(int boa_seq) {
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			pstm.setInt(1, boa_seq);
			
			res = pstm.executeUpdate();
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		return res;
	}

	@Override
	public boolean multiDelete(String[] boa_seqs) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		int[] cnt = null;
		
		try {
			pstm = con.prepareStatement(DELETE_SQL);
			for(int i = 0; i < boa_seqs.length; i++) {
				pstm.setString(1, boa_seqs[i]);  //지금까지 쿼리문에 싱글쿼테이션을 생략해서 사용했지만, 써도되기 때문에 String형 사용이 가능
				pstm.addBatch();
				System.out.println("삭제할 번호 : " +DELETE_SQL);
			}
			cnt = pstm.executeBatch();
			
			for(int i = 0; i < cnt.length; i++) {
				if(cnt[i] == -2) {
					res++;
				}
			}
			if(res == boa_seqs.length) {  //성공하면
				commit(con);
			}else {     //실패하면
				rollback(con);
				res = 0;
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		return (res==boa_seqs.length)?true:false;   //삼항연산자 사용
	}

	
}
