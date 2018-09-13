package com.bitacademy.vo;

import java.util.List;

public class ResultGridVo {

	private int page; // 요청페이지
	private int records; // 총데이타수(전체데이타수)
	private List<Object> rows; // 데이터리스트
	private int total; // 마지막페이지 값
	
	
	public ResultGridVo() {
	}

	public ResultGridVo(int page, int records, List<Object> rows, int rowCnt) {
		/*rowCnt 한페이지당 출력갯수*/
		this.page = page;
		this.records = records;
		this.rows = rows;
		
		if (records % rowCnt > 0) { //페이지수 계산
			this.total = (records / rowCnt) + 1; //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이 아닐때 int형의 결과에 1을 더해줌
        } else {
        	this.total = (records / rowCnt); //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이면 int형의 결과를 그대로 씀
        }
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRecords() {
		return records;
	}

	public void setRecords(int records) {
		this.records = records;
	}

	public List<Object> getRows() {
		return rows;
	}

	public void setRows(List<Object> rows) {
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	@Override
	public String toString() {
		return "ResultGridVo [page=" + page + ", records=" + records + ", rows=" + /*rows +*/ ", total=" + total + "]";
	}

}
