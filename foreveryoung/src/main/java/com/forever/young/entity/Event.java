package com.forever.young.entity;

import java.sql.Date;

public class Event {
	private int event_no;
	private String event_name;
	private Date event_start;
	private Date event_end;
	private int event_discount;
	private String event_target;
	public int getEvent_no() {
		return event_no;
	}
	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public String getEvent_name() {
		return event_name;
	}
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	public Date getEvent_start() {
		return event_start;
	}
	public void setEvent_start(Date event_start) {
		this.event_start = event_start;
	}
	public Date getEvent_end() {
		return event_end;
	}
	public void setEvent_end(Date event_end) {
		this.event_end = event_end;
	}
	public int getEvent_discount() {
		return event_discount;
	}
	public void setEvent_discount(int event_discount) {
		this.event_discount = event_discount;
	}
	public String getEvent_target() {
		return event_target;
	}
	public void setEvent_target(String event_target) {
		this.event_target = event_target;
	}
	@Override
	public String toString() {
		return "Event [event_no=" + event_no + ", event_name=" + event_name + ", event_start=" + event_start
				+ ", event_end=" + event_end + ", event_discount=" + event_discount + ", event_target=" + event_target
				+ "]";
	}
	
	
	
}
