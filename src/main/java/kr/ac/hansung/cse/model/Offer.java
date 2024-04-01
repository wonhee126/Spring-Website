package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
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
        private int user_id;
        private int year;
        private int semester;
        private String courseCode;
        private String courseName;
        private String courseType;
        @Size(min=2, max=100, message = "Name must be between 2 and 100 chars")
        private String professor;
        private int credit;

    }

