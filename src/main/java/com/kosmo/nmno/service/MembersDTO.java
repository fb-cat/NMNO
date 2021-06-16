package com.kosmo.nmno.service;

import java.util.List;

import lombok.Data;

@Data
public class MembersDTO {

	private String mno;
	private String email;
	private String username;
	private String password;
	private String nickname;
	private String action;
	private java.sql.Date regiDate;
	
}////