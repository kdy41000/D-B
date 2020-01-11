package memberdao;

import java.util.List;

import member.dto.MemberDto;

public interface MemberDao {

	//관리자(ADMIN)기능
			//1.회원 전체 정보(탈퇴회원 포함)
			public List<MemberDto> selectList();
			//2.회원 전체 정보(가입된 회원들만):myenabled = y
			public List<MemberDto>selectEnabled();

			//사용자(USER)기능
			//1.로그인
			public MemberDto login(String id, String pw);
			//2.회원가입
			//2-1. 중복체크
			public MemberDto idChk(String id);
			//2-2. 회원가입
			public int insertUser(MemberDto dto);
			//3.내정보 조회
			public MemberDto selectUser(String id);
			//4.내정보 수정
			public int updateUser(MemberDto dto);
			//5.회원탈퇴 : update myenabled = 'n';
			public int deleteUser(String id);
}
