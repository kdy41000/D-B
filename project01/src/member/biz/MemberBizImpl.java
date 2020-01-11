package member.biz;

import java.util.List;

import member.dto.MemberDto;
import memberdao.MemberDao;
import memberdao.MemberDaoImpl;

public class MemberBizImpl implements MemberBiz{

	private MemberDao dao = new MemberDaoImpl();
	
	@Override
	public List<MemberDto> selectList() {
		
		return dao.selectList();
	}

	@Override
	public List<MemberDto> selectEnabled() {
	
		return dao.selectEnabled();
	}

	@Override
	public MemberDto login(String mem_id, String mem_pw) {
		
		return dao.login(mem_id, mem_pw);
	}

	@Override
	public MemberDto idChk(String mem_id) {
		
		return dao.idChk(mem_id);
	}

	@Override
	public int insertUser(MemberDto dto) {
		
		return dao.insertUser(dto);
	}

	@Override
	public MemberDto selectUser(String mem_id) {
		
		return dao.selectUser(mem_id);
	}

	@Override
	public int updateUser(MemberDto dto) {
	
		return dao.updateUser(dto);
	}

	@Override
	public int deleteUser(String mem_id) {
		
		return dao.deleteUser(mem_id);
	}

}
