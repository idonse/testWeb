package ru.idonse.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.idonse.DAO.Course;
import ru.idonse.DAO.CourseService;

import java.util.List;

@Controller
@RequestMapping("/courses/")
public class CourseController {

    private CourseService courseService;

    @Autowired
    public void setCourseService(CourseService courseService) {
        this.courseService = courseService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String list(Model uiModel){
        List<Course> courses = courseService.findAll();
        uiModel.addAttribute("courses", courses);
        return "courses/list";
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(method = RequestMethod.GET, value = "delete/{id}")
    public  String delete(@PathVariable("id") int id, Model uiModel){
        courseService.delete(id);
//        return list(uiModel);
        return "redirect:/courses/";
    }

    @RequestMapping(method = RequestMethod.GET, value = "update/{id}")
    public String updateForm(@PathVariable("id") int id, Model uiModel){
        uiModel.addAttribute("course", courseService.findById(id));
        return "courses/edit";
    }

    @RequestMapping(method = RequestMethod.GET, value = "update/0")
    public String newForm(Model uiModel){
        return "courses/edit";
    }

    @PreAuthorize("hasRole('ROLE_USER')")
    @RequestMapping(method = RequestMethod.POST, value = "update/{id}")
    public String update(Course course, BindingResult bindingResult, Model uiModel){
        if (bindingResult.hasErrors()){
            uiModel.addAttribute("course", course);
            return "courses/update";
        }
        courseService.save(course);
        return "redirect:/courses/";
    }
}
