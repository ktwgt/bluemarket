package kr.co.ilck.mapper;

import java.util.ArrayList;

import kr.co.ilck.vo.QnaVo;

public interface QnaMapper {
	
	public int chong();
	
	public ArrayList<QnaVo> qna(int index);
	
	public int getQna_num();
	
	public void qna_write_ok(QnaVo qvo);
	
	public int getNum(String id);
	
	public int getImp(String id);
	
	public void num_change(int num, String id);
	
	public void qna_delete(String id);
	
	public QnaVo getQna_vo(String id);
	
	public void qna_update_ok(QnaVo qvo);

}
