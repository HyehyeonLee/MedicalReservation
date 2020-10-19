package com.medical.dto;

public class GrahpDto {
	private String stateDt;
	private String decideCnt;
	private String clearCnt;
	private String deathCnt;
	
	public GrahpDto() {}
	public GrahpDto(String stateDt, String decideCnt, String clearCnt, String deathCnt) {
		this.stateDt = stateDt;
		this.decideCnt = decideCnt;
		this.clearCnt = clearCnt;
		this.deathCnt = deathCnt;
	}


	public String getStateDt() {
		return stateDt;
	}

	public void setStateDt(String stateDt) {
		this.stateDt = stateDt;
	}

	public String getDecideCnt() {
		return decideCnt;
	}

	public void setDecideCnt(String decideCnt) {
		this.decideCnt = decideCnt;
	}

	public String getClearCnt() {
		return clearCnt;
	}

	public void setClearCnt(String clearCnt) {
		this.clearCnt = clearCnt;
	}

	public String getDeathCnt() {
		return deathCnt;
	}

	public void setDeathCnt(String deathCnt) {
		this.deathCnt = deathCnt;
	}
	
}
