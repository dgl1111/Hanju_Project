package com.example.hanju.user.controller;

import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.test.service.TestService;
import com.example.hanju.user.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	//휴대폰인증
	@RequestMapping("user/joinbtn.do")
	public String joinBtn(Model model) throws Exception{
		return "user/joinbtn";
	}
	//회원가입
	@RequestMapping("user/join.do")
	public String join(Model model) throws Exception{
		return "user/join";
	}
	//로그인
	@RequestMapping("user/login.do")
	public String login(Model model) throws Exception{
		return "user/login";
	}
	//주소검색
	@RequestMapping("user/juso.do")
	public String juso(Model model) throws Exception{
		return "user/juso";
	}
	//마이페이지
	@RequestMapping("user/mypage.do")
	public String mypage(Model model) throws Exception{
		return "user/mypage";
	}
	//리뷰페이지
	@RequestMapping("user/review.do")
	public String review(Model model) throws Exception{
	return "user/review";
	}
	
	//회원정보수정
	@RequestMapping("user/modify.do")
	public String modify(Model model) throws Exception{
		return "user/modify";
	}
	@RequestMapping("user/modifybefore.do")
	public String modifybefore(Model model) throws Exception{
		return "user/modifybefore";
	}
	@RequestMapping("user/favorite.do")
	public String favoritePage(Model model) throws Exception{
		model.addAttribute("userId",session.getAttribute("sessionId"));
		return "user/favoritePage";
	}
	//리뷰쓰기
	@RequestMapping("user/reviewwrite.do")
	public String reviewwrite(Model model) throws Exception{
		return "user/reviewwrite";
	}
	
	//필요에 의해 만들음. 모든 유저 정보 리스트를 불러오는 API
	@GetMapping(value = "user/allUserList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String allUserList(Model model) throws Exception {
		Map<String, Object> result = userService.allUserList();
		return new Gson().toJson(result);
	}
	@GetMapping(value = "user/getUserInfo.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getUserInfo(Model model, @RequestParam HashMap<String,Object> map) throws Exception {
		Map<String, Object> result = userService.getUserInfo(map);
		return new Gson().toJson(result);
	}


	
	//아이디 중복체크
	@RequestMapping(value = "user/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.idCheck(map);
		return new Gson().toJson(result);
	}
	//회원가입
	@RequestMapping(value = "user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userJoin(map);
		return new Gson().toJson(result);
	}
	//로그인
	@RequestMapping(value = "user/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userLogin(map);
		return new Gson().toJson(result);
	}
	//회원정보
	@RequestMapping(value = "user/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String infoUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userInfo(map);
		return new Gson().toJson(result);
	}
	
	//회원정보 수정
	@RequestMapping(value = "user/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userModify(map);
		return new Gson().toJson(result);
	}
	//회원탈퇴
	@RequestMapping(value = "user/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userDelete(map);
		return new Gson().toJson(result);
	}
	//찜 목록 리스트 불러오기
	@GetMapping(value = "user/getFavoriteItemList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getFavoriteItemList(Model model, @RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> result = userService.getFavoriteItemList(map);
		return new Gson().toJson(result);
	}
	@PostMapping(value = "user/deleteFavoriteItem.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteFavoriteItem(Model model, @RequestBody Map<String, Object> map) throws Exception {
		Map<String, Object> result = userService.deleteFavoriteItem(map);
		return new Gson().toJson(result);
	}
}
