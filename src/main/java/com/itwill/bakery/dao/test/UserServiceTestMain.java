package com.itwill.bakery.dao.test;

import com.itwill.bakery.service.UserService;
import com.itwill.bakery.vo.Address;
import com.itwill.bakery.vo.User;


public class UserServiceTestMain {

	public static void main(String[] args) throws Exception {
		UserService userService = new UserService();
		String id = "three";
		
		//회원가입
		 //int rowCount = userService.createUser(new User_info("two2", "insert", "인서트",
		// "insert@email.com", "2223333", 1000, null));
		// 회원가입
		// System.out.println("회원가입>>" +rowCount);
		// 로그인
		System.out.println(userService.login("three", "3333"));
		// 전체 회원 정보
		// System.out.println(userService.selectAllUser());
		// 주소추가
		// System.out.println(userService.createAddress(new Address(0, "서비스테스트", "two")));
		// 회원정보
		 System.out.println(userService.selectUser(id));
		// 주소삭제
		// System.out.println(userService.deleteAddress(new Address(10, null, id)));
		// 회원탈퇴
		 //System.out.println(userService.deleteUser(new User_info(id, null, null, null, null, 0, null)));

	}
}