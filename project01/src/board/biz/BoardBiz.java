package board.biz;

import java.util.List;

import board.dto.BoardDto;

public interface BoardBiz {
	
		public List<BoardDto> totalcnt();
		public List<BoardDto> selectPaging(int startseq, int endseq);
		public BoardDto selectOne(int boa_seq);  //선택조회
		public int insert(BoardDto dto);     //글쓰기
		public int update(BoardDto dto);     //글수정
		public int delete(int boa_seq);        //글삭제
		public boolean multiDelete(String[] boa_seqs);  //체크박스 삭제
		public int cntplus(int boa_seq, int boa_cnt);
	

}
