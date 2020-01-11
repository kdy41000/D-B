package board.biz;

import java.util.List;

import board.dao.BoardDao;
import board.dao.BoardDaoImpl;
import board.dto.BoardDto;

public class BoardImpl implements BoardBiz{

	private BoardDao dao = new BoardDaoImpl();
	
	@Override
	public List<BoardDto> selectList() {
	
		return dao.selectList();
	}

	@Override
	public BoardDto selectOne(int boa_seq) {
		
		return dao.selectOne(boa_seq);
	}

	@Override
	public int insert(BoardDto dto) {
		
		return dao.insert(dto);
	}

	@Override
	public int update(BoardDto dto) {
		
		return dao.update(dto);
	}

	@Override
	public int delete(int boa_seq) {
		
		return dao.delete(boa_seq);
	}

	@Override
	public boolean multiDelete(String[] boa_seqs) {
		
		return dao.multiDelete(boa_seqs);
	}

	
}
