package com.acadmi.administrator.copy;

import java.sql.Date;

import com.acadmi.member.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdministratorVO extends MemberVO {

	private Integer deptNum;
	private String name;
	private Integer phone;
	private Date birth;
	private String address;
	private Integer status;
}
