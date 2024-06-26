// Offer.java
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

    @Pattern(regexp="[0-9]{4}", message="year must be 4 digits")
    private String year;

    @Pattern(regexp="[1~2]{1}", message="semester must be 1 digit between 1 and 2")
    private String semester;

    @Size(min=7, max=7,message="courseCode must be 7 chars")
    private String courseCode;

    @Size(min=2, max=20,message="courseName must be between 2 and 20 chars")
    private String courseName;

    @Size(min=1, max=10,message="courseType must be between 1 and 10 chars")
    private String courseType;

    @Size(min=2, max=10, message = "professor must be between 2 and 10 chars")
    private String professor;

    @Pattern(regexp="[1-9]{1,2}", message="credit must be between 1 and 10 digits")
    private String credit;
}

