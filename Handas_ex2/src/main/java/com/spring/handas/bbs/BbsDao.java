package com.spring.handas.bbs;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.handas.PageMaker;

public interface BbsDao {
	public ArrayList<BbsDto> bbsList(PageMaker paging);
	public int bbsCnt(@Param("category") String category);
	public void bbsWrite(BbsDto dto);
	public BbsDto bbsRead(int bnum);
	public void bbsCntUp(int bnum);
	public void bbsDelete(int bnum);
	public void bbsUpdate(BbsDto dto);
	
	//답글
	public int replyChk(int ref);
	public void reply(BbsDto dto);
}
