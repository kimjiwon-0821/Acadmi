package com.acadmi.administrator;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;import org.springframework.boot.context.properties.ConfigurationPropertiesBinding;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.acadmi.college.CollegeVO;
import com.acadmi.department.DepartmentVO;
import com.acadmi.lecture.LectureVO;
import com.acadmi.lecture.room.LectureRoomVO;
import com.acadmi.member.MemberSeqVO;
import com.acadmi.member.MemberVO;
import com.acadmi.professor.ProfessorVO;
import com.acadmi.student.StudentVO;
import com.acadmi.util.Pagination;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/administrator/*")
@Slf4j
public class AdministratorController {
	
	@Autowired
	private AdministratorService administratorService;

	//회원 관리
	//아이디

	
	//계정 관리
	@GetMapping("studentAdd")
	public ModelAndView setStudentAdd(MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<CollegeVO>ar = administratorService.getCollege();
		List<DepartmentVO> ar2 = administratorService.getDepartment();
		
		
		mv.addObject("college", ar);
		mv.addObject("department", ar2);
		mv.setViewName("administrator/studentAdd");
		
		return mv;
		
	}
	@PostMapping("studentAdd")
	public ModelAndView setStudentAdd(@Valid StudentVO studentVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
			if(bindingResult.hasErrors()) {
				log.warn("검중에 실패");
				mv.setViewName("administrator/studentAdd");
				return mv;
			}
			
			int result = administratorService.setStudentAdd(studentVO,memberVO, memberSeqVO);
			
			String message="등록 실패";
			
			if(result > 0) {
				message = "등록 되었습니다";
				
			}
			
			mv.addObject("result", message);
			mv.setViewName("administrator/result");
			
			mv.addObject("url", "./studentList");
			return mv;
		
	}
	@GetMapping("administratorAdd")
	public ModelAndView setAdministratorAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("administrator/administratorAdd");
		
		return mv;
		
	}
	
	@PostMapping("administratorAdd")
	public ModelAndView setAdministratorAdd(@Valid AdministratorVO administratorVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setAdministratorAdd(administratorVO, memberVO, memberSeqVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검중에 실패");
			mv.setViewName("administrator/administratorAdd");
			return mv;
		}
		
		String message="등록 실패";
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("administrator/result");
		
		mv.addObject("url", "./administratorList");
		return mv;
		
		
	}
	
	@GetMapping("professorAdd")
	public ModelAndView setProfessorAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("administrator/professorAdd");
		
		return mv;
		
	}
	
	@PostMapping("professorAdd")
	public ModelAndView setProfessorAdd(@Valid ProfessorVO professorVO, BindingResult bindingResult, MemberVO memberVO, MemberSeqVO memberSeqVO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setProfessorAdd(professorVO, memberVO, memberSeqVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검중에 실패");
			mv.setViewName("administrator/professorAdd");
			return mv;
		}
		
		String message="등록 실패";
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("administrator/result");
		
		mv.addObject("url", "./professorList");
		return mv;
		
		
	}
	
	//회원 조회
	@GetMapping("studentList")
	public ModelAndView getMemberList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<StudentVO> ar =  administratorService.getStudentList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/studentList");
		
		return mv;
	}
	
	@GetMapping("professorList")
	public ModelAndView getProfessorList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<ProfessorVO> ar = administratorService.getProfessorList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/professorList");
		
		return mv;
	}
	
	@GetMapping("administratorList")
	public ModelAndView getAdministratorList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<AdministratorVO> ar = administratorService.getAdministratorList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/administratorList");
		
		return mv;
		
	}
	
	//강의실 관리
	
	//강의실 조회
	@GetMapping("lectureRoomList")
	public ModelAndView getLectureRoomList(Pagination pagination) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<LectureRoomVO> ar = administratorService.getLectureRoomList(pagination);
		mv.addObject("list", ar);
		mv.setViewName("administrator/lectureRoomList");
		
		return mv;
	}
	//강의실 등록
	@GetMapping("lectureRoomAdd")
	public ModelAndView getLectureRoomAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("administrator/lectureRoomAdd");
		
		return mv;
	}
	
	@PostMapping("lectureRoomAdd")
	public ModelAndView setLectureRoomAdd(@Valid LectureRoomVO lectureRoomVO, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = administratorService.setLectureRoomAdd(lectureRoomVO);
		
		if(bindingResult.hasErrors()) {
			log.warn("검증에 실패");
			mv.setViewName("administrator/lectureRoomAdd");
			return mv;
			
		}
		
		String message="등록 실패";
		
		if(result > 0) {
			message = "등록 되었습니다";
			
		}
		
		mv.addObject("result", message);
		mv.setViewName("administrator/result");
		
		mv.addObject("url", "./lectureRoomList");
		return mv;
	}
	
	@GetMapping("lectureRoomUpdate")
	public ModelAndView setLectureRoomUpdate(LectureRoomVO lectureRoomVO) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		
		mv.addObject("lectureRoom",lectureRoomVO);
		mv.setViewName("administrator/lectureRoomUpdate");
		
		return mv;
		
	}

}
