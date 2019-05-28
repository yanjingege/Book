package com.oracle.web.bean;

public class SubBook extends Book {

	
	private Fenlei fenLei;

	public Fenlei getFenLei() {
		return fenLei;
	}

	public void setFenLei(Fenlei fenLei) {
		this.fenLei = fenLei;
	}

	@Override
	public String toString() {
		return "SubBook [fenLei=" + fenLei + "]";
	}

}
