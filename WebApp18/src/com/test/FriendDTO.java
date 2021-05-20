/*====================
    FriendDTO.java
====================*/


package com.test;


public class FriendDTO
{
	// 주요 속성 구성(이름, 나이, 성별, 이상형)
	private String name, age, gender;
	private String[] lover;
	//--이상형은 여러 개의 데이터가 동시에 전달되므로
	//  다중 선택이 가능하도록 구성된 컨트롤이기 때문에
	//  배열로 처리한다.

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getAge()
	{
		return age;
	}

	public void setAge(String age)
	{
		this.age = age;
	}

	public String getGender()
	{
		return gender;
	}

	public void setGender(String gender)
	{
		this.gender = gender;
	}

	public String[] getLover()
	{
		return lover;
	}

	public void setLover(String[] lover)
	{
		this.lover = lover;
	}
}
