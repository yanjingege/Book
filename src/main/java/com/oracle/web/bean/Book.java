package com.oracle.web.bean;

public class Book {
 
    private Integer id;

    //private String fname;

    private String name;

    private String price;

    private String chuban;

    private String zhuangtai;

    private String jieshuren;

    private Integer fId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

  //  public String getFname() {
   //     return fname;
   // }

   // public void setFname(String fname) {
   //     this.fname = fname == null ? null : fname.trim();
   // }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }
    
    public String getChuban() {
        return chuban;
    }

    public void setChuban(String chuban) {
        this.chuban = chuban == null ? null : chuban.trim();
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai == null ? null : zhuangtai.trim();
    }

    public String getJieshuren() {
        return jieshuren;
    }

    public void setJieshuren(String jieshuren) {
        this.jieshuren = jieshuren == null ? null : jieshuren.trim();
    }

    public Integer getfId() {
        return fId;
    }

    public void setfId(Integer fId) {
        this.fId = fId;
    }

	public Book(Integer id,String name, String price, String chuban, String zhuangtai, String jieshuren,
			Integer fId) {
		super();
		this.id = id;
		//this.fname = fname;
		this.name = name;
		this.price = price;
		this.chuban = chuban;
		this.zhuangtai = zhuangtai;
		this.jieshuren = jieshuren;
		this.fId = fId;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}