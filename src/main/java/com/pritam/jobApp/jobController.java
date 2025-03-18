package com.pritam.jobApp;

//import ch.qos.logback.core.model.Model;
import com.pritam.jobApp.model.JobPost;
import com.pritam.jobApp.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;
import java.util.List;


@Controller
public class jobController {

    @Autowired
    private JobService service;

    @GetMapping("contact")
    public String contact(){
        return "contact";
    }


    @GetMapping({"/", "home"})
    public String home() {
        return "home";
    }


    @GetMapping("addjob")
    public String addJob() {
        return "addjob";
    }


    @PostMapping("handleForm")
    public String handleForm(JobPost jobPost) {
//        if (jobPost.getPostTechStack() == null) {
//            jobPost.setPostTechStack(new ArrayList<>()); // Set an empty list if null
//        }
        service.addJob(jobPost);
        return "success";
    }

    @GetMapping("viewAllJobs")
    public String viewJobs(Model m){
        List<JobPost> jobs=service.getAllJobs();
        m.addAttribute("jobPosts", jobs);
        return "viewAllJobs";
    }



}
