package com.acadmi.professor;

import java.sql.Date;

import com.acadmi.member.MemberVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProfessorVO extends MemberVO{
	private Integer deptNum;
	private String name;
	private Integer professorRoom;
	private Integer phone;
	private Date birth;
	private String address;
	private Integer status;
}
