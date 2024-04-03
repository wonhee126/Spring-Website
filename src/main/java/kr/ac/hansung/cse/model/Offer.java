package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Getter
@Setter
@ToString
@NoArgsConstructor
//public class Offer {
//    private int user_id;
//    private int year;
//    private int
//    //private int id;
//
//    //@Size(min=2, max=100, message = "Name must be between 2 and 100 chars")
//    private String username;
//
//    //@Email(message="Please provide a valid email address")
//    //@NotEmpty(message="The email address cannot be empty")
//    private String email;
//
//    //@Size(min=5, max=100, message="Text must be between 5 and 100 chars")
//    private String password;
//}
public class Offer {
    private String username;
    private int id;
    private int year;
    private int semester;
    private String courseCode;
    private String courseName;
    @NotNull
    private String courseType;
    private String professor;
    private int credit;


}

