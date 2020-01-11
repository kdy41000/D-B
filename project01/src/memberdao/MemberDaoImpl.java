package memberdao;

import static member.db.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.dto.MemberDto; 

public class MemberDaoImpl implements MemberDao{
    //1,2,3(관리자 기능)
	@Override
	public List<MemberDto> selectList() { //1.회원 전체 정보(탈퇴회원 포함)
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto>list = new ArrayList<MemberDto>();
		
		String sql = " SELECT MEM_ID,MEM_PW,MEM_NAME,MEM_GENDER,MEM_ADDR,MEM_PHONE,MEM_EMAIL,MEM_ADDDATE,MEM_ENABLED,MEM_ROLE " 
				   + " FROM TB_MEMBER "; 
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(rs.getString(1),
											  rs.getString(2),
											  rs.getString(3),
											  rs.getString(4),
											  rs.getString(5),
											  rs.getString(6),
											  rs.getString(7),
											  rs.getDate(8),
											  rs.getString(9),
											  rs.getInt(10)
											  );

				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		return list;
	}

	@Override
	public List<MemberDto> selectEnabled() { //2.회원 전체 정보(가입된 회원들만):myenabled = y
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<MemberDto>list = new ArrayList<MemberDto>();
		
		String sql = " SELECT MEM_ID,MEM_PW,MEM_NAME,MEM_GENDER,MEM_ADDR,MEM_PHONE,MEM_EMAIL,MEM_ADDDATE,MEM_ENABLED,MEM_ROLE "
				   + " FROM TB_MEMBER "
				   + " WHERE MEM_ENABLED ='Y' "
				   + " ORDER BY MEM_SEQ DESC ";	 
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				MemberDto dto = new MemberDto(rs.getString(1),
											  rs.getString(2),
											  rs.getString(3),
											  rs.getString(4),
											  rs.getString(5),
											  rs.getString(6),
											  rs.getString(7),
											  rs.getDate(8),
											  rs.getString(9),
											  rs.getInt(10)
											  );

				list.add(dto);
			}
			
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		return list;
	}
	

	
///////////////////////////////////////////////////////////
	@Override
	public MemberDto login(String mem_id, String mem_pw) { //1.로그인
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto dto = new MemberDto();
		
		String sql = " SELECT MEM_ID,MEM_PW,MEM_NAME,MEM_GENDER,MEM_ADDR,MEM_PHONE,MEM_EMAIL,MEM_ADDDATE,MEM_ENABLED,MEM_ROLE "
				   + " FROM TB_MEMBER "
				   + " WHERE MEM_ID = ? AND MEM_PW = ? "
				   + " AND MEM_ENABLED = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mem_id);
			pstm.setString(2, mem_pw);
			pstm.setString(3, "Y");
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDto(rs.getString(1),
								    rs.getString(2),
									rs.getString(3),
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getDate(8),
									rs.getString(9),
									rs.getInt(10)
									);
				
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		return dto;
	}
///////////////////////////////////////////////////////////
	//2.회원가입
	@Override
	public MemberDto idChk(String id) {  //2-1. 중복체크
		
		return null;
	}

	@Override
	public int insertUser(MemberDto dto) {  //2-2. 회원가입
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " INSERT INTO TB_BOARD "
				   + " VALUES(?,?,?,?,?,?,?,SYSDATE,Y,2) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getMem_id());
			pstm.setString(2, dto.getMem_pw());
			pstm.setString(3, dto.getMem_name());
			pstm.setString(4, dto.getMem_gender());
			pstm.setString(5, dto.getMem_addr());
			pstm.setString(6, dto.getMem_phone());
			pstm.setString(7, dto.getMem_email());
			
			res = pstm.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("[ERROR]:3,4");
			e.printStackTrace();
		}
		
		
		return res;
	}

	@Override
	public MemberDto selectUser(String mem_id) {  //3.내정보 조회
		Connection con = getConnection();
		PreparedStatement pstm = null;
	    ResultSet rs = null;
	    
		String sql= " SELECT MEM_ID,MEM_PW,MEM_NAME,MEM_GENDER,MEM_ADDR,MEM_PHONE,MEM_EMAIL,MEM_ADDDATE,MEM_ENABLED,MEM_ROLE "
				  + " FROM TB_MEMBER "
			      + " WHERE MEM_ID = ? ";
		
		MemberDto dto = new MemberDto();
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, mem_id);
			rs = pstm.executeQuery();
			
			while(rs.next()) {
		
				dto.setMem_id(rs.getString(1));
				dto.setMem_pw(rs.getString(2));
				dto.setMem_name(rs.getString(3));
				dto.setMem_gender(rs.getString(4));
				dto.setMem_addr(rs.getString(5));
				dto.setMem_phone(rs.getString(6));
				dto.setMem_email(rs.getString(7));
				dto.setMem_adddate(rs.getDate(8));
				dto.setMem_enabled(rs.getString(9));
				dto.setMem_role(rs.getInt(10));
				
			}
			
		} catch (SQLException e) {
			System.out.println("[ERROR]: 3,4");
			e.printStackTrace();
		}finally {
			close(rs,pstm,con);
		}
		
		return dto;
	}

	@Override
	public int updateUser(MemberDto dto) {  //4.내정보 수정
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE TB_MEMBER "
				   + " SET MEM_ID=?,MEM_PW=?,MEM_NAME=?,MEM_GENDER=?,MEM_ADDR=?,MEM_PHONE=?,MEM_EMAIL=? "
				   + " WHERE MEM_ID=? AND MEM_PW =? ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getMem_id());
			pstm.setString(2, dto.getMem_pw());
			pstm.setString(3, dto.getMem_name());
			pstm.setString(4, dto.getMem_gender());
			pstm.setString(5, dto.getMem_addr());
			pstm.setString(6, dto.getMem_phone());
			pstm.setString(7, dto.getMem_email());
			pstm.setString(8, dto.getMem_id());
			pstm.setString(9, dto.getMem_pw());
			
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
	public int deleteUser(MemberDto dto) {  //5.회원탈퇴 : update myenabled = 'n';
		
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		String sql = " UPDATE TB_MEMBER "
				   + " SET MEM_ENABLED='N' "
				   + " WHERE MEM_ID = ? AND MEM_PW = ? ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getMem_id());
			pstm.setString(2, dto.getMem_pw());
			
			res = pstm.executeUpdate();
			
			if(res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("[ERROR]:3 ,4");
			e.printStackTrace();
		}finally {
			close(pstm,con);
		}
		
		return res;
	}

}
