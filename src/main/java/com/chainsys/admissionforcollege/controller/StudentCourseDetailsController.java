package com.chainsys.admissionforcollege.controller;
import java.util.List;
import java.util.Optional;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.chainsys.admissionforcollege.model.StudentCourseDetails;
import com.chainsys.admissionforcollege.service.StudentCourseDetailsService;
import com.chainsys.admissionforcolllege.compositekey.StudentCompositeKey;

@Controller
@RequestMapping("/studentcourse")
public class StudentCourseDetailsController {
	 @Autowired
	    private StudentCourseDetailsService studentCourseDetailsService;
	 private static final String STUDENTCOURSE="redirect:/studentcourse/list";
	    @GetMapping("/list")
	    	public String getFindAllStudentCourseDetails(Model model) {
	    		List<StudentCourseDetails> list = studentCourseDetailsService.getStudententCourse();
	    		model.addAttribute("alladdstudentCourseDetails", list);
	    		return "list-studentcoursedetails";
	    	}
	    	@GetMapping("/addform")
	    	public String showAddStudentCourseDetailse(@RequestParam("id") int id,@RequestParam("id1") String id1 ,Model model) {
	    		StudentCourseDetails studentCourseDetails = new StudentCourseDetails();
	    		studentCourseDetails.setUserid(id);
	    		studentCourseDetails.setCourseName(id1);
	    		model.addAttribute("addstudentCourse", studentCourseDetails);
	    		return "add-studentcourse-form";
	    	}
	    	@PostMapping("/addstudentcoursedetails")
	    	public String addNewStudentCourseDetails(@ModelAttribute("addstudentCourse") StudentCourseDetails studentCourseDetails,Model model){
	       
	        		
	        		studentCourseDetailsService.save(studentCourseDetails);
	    		return STUDENTCOURSE;
	    	}
	    	
	    	@GetMapping("/updateform")
	    	public String showUpdatestudentcoursedetails(@RequestParam("id") int id,@RequestParam("cid")int cid, Model model) {
	    		StudentCompositeKey studentCompositeKey=new StudentCompositeKey(id, cid);
	    		Optional<StudentCourseDetails> studentCourseDetails = studentCourseDetailsService.findById(studentCompositeKey);
	    		model.addAttribute("updatestudentcoursedetails", studentCourseDetails);
	    		return "update-studentcourse-form";
	    	}

	    	@PostMapping("/updatestudentCompositeKey")
	    	public String updateStudentCompositeKey(@ModelAttribute("updatestudentcoursedetails") StudentCourseDetails studentCourseDetails) {
	    		studentCourseDetailsService.save(studentCourseDetails);
	    		return STUDENTCOURSE;
	    	}

	    	@GetMapping("/deletestudentcoursedetails")
	    	public String deleteStudentCourseDetails(@RequestParam("id") int id,@RequestParam("cid")int cid) {
	    		StudentCompositeKey studentCompositeKey=new StudentCompositeKey(id, cid);
	    		studentCourseDetailsService.deleteById(studentCompositeKey);
	    		return STUDENTCOURSE;
	    	}
	    	@GetMapping("/getbyidstudentcourse")
	    	public String getStudentCourseDetails(@RequestParam("id") int id,@RequestParam("id")int id1, Model model) {
	    		StudentCompositeKey studentCompositeKey=new StudentCompositeKey(id, id1);
	    		Optional<StudentCourseDetails> studentCourseDetails = studentCourseDetailsService.findById(studentCompositeKey);
	    		model.addAttribute("findbyid", studentCourseDetails);
	    		return "findby-studentcourseid";
	    	}
}
