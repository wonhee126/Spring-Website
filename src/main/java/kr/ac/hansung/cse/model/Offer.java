package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class Offer {
    private String username;
    private int id;

    @Size(min=4, max=4,message="year must be 4 chars")
    private String year;

    @Size(min=1, max=1,message="year must be 1 chars")
    private String semester;

    @Size(min=7, max=7,message="courseCode must be 7 chars")
    private String courseCode;

    @Size(min=2, max=20,message="courseName must be between 2 and 20 chars")
    private String courseName;

    @Size(min=1, max=10,message="courseType must be between 1 and 10 chars")
    private String courseType;

    @Size(min=2, max=10, message = "professor must be between 2 and 10 chars")
    private String professor;

    @Size(min=1, max=10, message = "credit must be between 1 and 10 chars")
    private String credit;


}

