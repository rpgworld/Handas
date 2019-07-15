package com.spring.handas.bbs;

import java.util.ArrayList;

import com.spring.handas.PageMaker;

public interface BbsDao {
	public ArrayList<BbsDto> bbsList(PageMaker paging);
	public int bbsCnt();
	public void bbsWrite(BbsDto dto);
	public BbsDto bbsRead(int bnum);
	public void bbsCntUp(int bnum);
	public void bbsDelete(int bnum);
	public void bbsUpdate(BbsDto dto);
}
