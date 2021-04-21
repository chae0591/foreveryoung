package com.forever.young.entity;

public class NoticeDto {
	private int notice_no;
	private String notice_type;
	private String notice_title;
	private String notice_content;
	private int admin_no;
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	@Override
	public String toString() {
		return "Notice [notice_no=" + notice_no + ", notice_type=" + notice_type + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", admin_no=" + admin_no + "]";
	}
}
