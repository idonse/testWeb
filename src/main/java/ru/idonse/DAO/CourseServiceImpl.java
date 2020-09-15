package ru.idonse.DAO;

import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
@Service("courseService")
public class CourseServiceImpl implements CourseService{

    private CourseRepository courseRepository;

    @Autowired
    public void setCourseRepository(CourseRepository courseRepository) {
        this.courseRepository = courseRepository;
    }

    @Transactional(readOnly = true)
    @Override
    public List<Course> findAll() {
        return Lists.newArrayList(courseRepository.findAll());
    }

    @Transactional(readOnly = true)
    @Override
    public Course findById(int id) {
        return courseRepository.findById(id).get();
    }

    @Override
    public Course save(Course course) {
        return courseRepository.save(course);
    }

    @Override
    public void delete(int id) {
        courseRepository.deleteById(id);
    }
}
