package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Offer;
import kr.ac.hansung.cse.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.*;

@Controller
public class OfferController {
    @Autowired //자동으로 연결시켜준다는 의미, 의존성 주입을 해주세요 라는 의미
    private OfferService offerService;

    @GetMapping("/offers") // 학년별 이수 학점 조회
    public String showOffers(Model model) {

        List<Offer> offers = offerService.getOffers();
        Map<String, Map<String, Integer>> year_Semester_Map = new HashMap<>();

        for (Offer offer : offers) {
            String year = offer.getYear();
            String semester = offer.getSemester();
            int credit = Integer.parseInt(offer.getCredit());

            if (!year_Semester_Map.containsKey(year)) {
                year_Semester_Map.put(year, new HashMap<>());
            }

            Map<String, Integer> semesterMap = year_Semester_Map.get(year);
            if (semesterMap.containsKey(semester)) {
                int totalCredit = semesterMap.get(semester);
                semesterMap.put(semester, totalCredit + credit);
            } else {
                semesterMap.put(semester, credit);
            }
        }

        model.addAttribute("year_semester_map", year_Semester_Map);

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        model.addAttribute("username", username);

        Offer offer = new Offer();
        offer.setUsername(username);

        return "offers";
    }

    @GetMapping("/createoffer") // 수강신청 하기
    public String createOffer(@ModelAttribute @Validated Offer offer, BindingResult result, Model model) {
        if (result.hasErrors()) {
            System.out.println("== Form data does not validate ==");

            List<ObjectError> errors = result.getAllErrors();
            for (ObjectError error : errors) {
                System.out.println(error.getDefaultMessage());
            }

            return "createoffer";
        }
        return "createoffer";
    }


    @GetMapping("/docreate") // 상세보기
    public String showOffers2(@RequestParam("year") String year,
                              @RequestParam("semester") String semester,
                              Model model) {

        List<Offer> allOffers = offerService.getOffers(); // 모든 데이터 조회

        List<Offer> year_semester_offerList = new ArrayList<>(); // (year, semester)에 해당하는 데이터만 담을 리스트 생성
        for (Offer offer : allOffers) {
            if (offer.getYear().equals(year) && offer.getSemester().equals(semester)) { // 해당 학년도와 학기에 해당하는 데이터일 경우
                year_semester_offerList.add(offer); // 리스트에 추가
            }
        }

        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("offers", year_semester_offerList);

        return "offercreated";
    }


    @GetMapping("/enrolledCourses") // 수강신청 조회
    public String showOffers3(Model model, Offer offer) {
        List<Offer> offerList = offerService.offerList();
        model.addAttribute("offerList", offerList);

        // username을 출력하기 위한 코드
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        model.addAttribute("username", username);
        offer.setUsername(username);

        return "enrolledCourses";
    }

    @PostMapping("/check") // 수강신청 성공 후
    public String check(Model model, @Valid Offer offer, BindingResult result) {
        if(result.hasErrors()) { // 유효성 검사
            System.out.println("== Form data does not validated ==");

            List<ObjectError> errors = result.getAllErrors();

            for(ObjectError error:errors) {
                System.out.println(error.getDefaultMessage());
            }

            model.addAttribute("offer", offer);
            return "createoffer";
        }
        String courseCode = offer.getCourseCode(); // 입력 폼에서 courseCode 값을 가져옴
        int alreadyExists = offerService.existsByCourseCode(courseCode); // db와 비교해서 이미 존재하면 alreadyExists 값은 1이 됨
        if (alreadyExists != 0) { // 이미 존재한다면 에러 메시지 출력하는 로직
            String errorMsg = "이미 해당 강의가 수강신청되었습니다.";
            System.out.println(errorMsg);
            model.addAttribute("errorMsg", errorMsg);
            return "createoffer";
        }

        offerService.insert(offer);

        return "check";
    }

    @GetMapping("/delete") // 수강신청 조회-삭제하기
    public String deleteOffer(@RequestParam("courseCode") String courseCode,Model model) {
            offerService.delete(courseCode);
            List<Offer> offerList = offerService.offerList();
            model.addAttribute("offerList", offerService.offerList());

            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
            model.addAttribute("username", username);

            return "enrolledCourses";
    }
}

