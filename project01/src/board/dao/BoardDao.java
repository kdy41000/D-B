package board.dao;

import java.util.List;

import board.dto.BoardDto;


public interface BoardDao {

	String SELECT_LIST_SQL =" SELECT BOA_SEQ,MEM_ID,BOA_TITLE,BOA_CONTENT,BOA_CNT,REGDATE,BOA_CATEGORY,BOA_IMAGE "
						   +" FROM TB_BOARD "
						   + " ORDER BY BOA_SEQ DESC ";
	String ROWNUM_LIST_SQL = " SELECT BOA_SEQ,MEM_ID,BOA_TITLE,BOA_CONTENT,BOA_CNT,REGDATE,BOA_CATEGORY,BOA_IMAGE "
							+ " FROM (SELECT ROWNUM AS row_num, tb_board.* FROM TB_BOARD) "
							+ " WHERE row_num >=? AND row_num <=? ";
	
	String SELECT_ONE_SQL = " SELECT BOA_SEQ,MEM_ID,BOA_TITLE,BOA_CONTENT,BOA_CNT,BOA_IMAGE "
	                      + " FROM TB_BOARD "
						  + " WHERE BOA_SEQ = ";
	String INSERT_SQL = " INSERT INTO TB_BOARD "
			          + " VALUES(TB_BOARDSEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?) ";
	
	String UPDATE_SQL = " UPDATE TB_BOARD "
						+ " SET BOA_TITLE=?,BOA_CONTENT=? "
						+ " WHERE BOA_SEQ = ? ";
	
	String DELETE_SQL = " DELETE FROM TB_BOARD WHERE BOA_SEQ = ? ";
	
	String CNTPLUS_SQL = " UPDATE TB_BOARD "
			           + " SET BOA_CNT = ? "
			           + " WHERE BOA_SEQ =? "; 
	public List<BoardDto> totalcnt();
	public List<BoardDto> selectPaging(int startseq, int endseq);
	public BoardDto selectOne(int boa_seq);
	public int insert(BoardDto dto);
	public int update(BoardDto dto);   //int형 파라미터로 넘어와도 된다.
	public int delete(int boa_seq);
	public boolean multiDelete(String[] boa_seqs);   //DELETE 쿼리를 배열형태로 활용
	public int cntplus(int boa_seq, int boa_cnt);
}
