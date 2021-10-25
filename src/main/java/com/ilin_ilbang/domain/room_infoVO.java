package com.ilin_ilbang.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class room_infoVO {

	private int rcode; // �� ��Ϲ�ȣ
	private char btype; // �ǹ� ���� 
	private char rtype; // �� ���� 
	private String addr; // �ּ� 
	private int area; // ���� 
	private int whlarea; // ���� ����
	private int flr; // ����
	private String rface; // ����
	private char mvable; // ������� ���ɿ��� 
	private Date mvdate; // ���ְ����� 
	private char elev; // ���������� ���ɽ� 'Y' �ƴҽ� 'N' 
	private char park; // ���� ������ ���ɽ� 'Y' �ƴҽ� 'N' 
	private char pet; // �ݷ����� ���ɽ� 'Y' �ƴҽ� 'N' 
	private String rcmt; // �� ����
	private Date regdate; // ��� ��¥(�ð�)
	private Date updatedate; // ���� ��¥(�ð�)
	private String agntid; // �߰��� ���̵�  
	
}
