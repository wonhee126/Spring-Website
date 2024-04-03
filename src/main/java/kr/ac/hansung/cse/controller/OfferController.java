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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.*;

@Controller
public class OfferController {
    @Autowired //자동으로 연결시켜준다는 의미, 의존성 주입을 해주세요 라는 의미
    private OfferService offerService;

    @GetMapping("/offers") // 학년별 이수 학점 조회
    public String showOffers(Model model) {
        List<Offer> offers = offerService.getOffers();
        Map<String, Map<String, Integer>> yearSemesterMap = new HashMap<>();

        for (Offer offer : offers) {
            String year = offer.getYear();
            String semester = offer.getSemester();
            String creditString = offer.getCredit();
            int credit = Integer.parseInt(creditString);

            if (!yearSemesterMap.containsKey(year)) {
                yearSemesterMap.put(year, new HashMap<>());
            }

            Map<String, Integer> semesterMap = yearSemesterMap.get(year);
            if (semesterMap.containsKey(semester)) {
                int totalCredit = semesterMap.get(semester);
                semesterMap.put(semester, totalCredit + credit);
            } else {
                semesterMap.put(semester, credit);
            }
        }

        model.addAttribute("year_semester_map", yearSemesterMap);
        return "offers";
    }

    @GetMapping("/createoffer") // 수강신청 하기
    public String createOffer(@ModelAttribute @Validated Offer offer, BindingResult result) {
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

        List<Offer> filteredOffers = new ArrayList<>(); // (year, semester)에 해당하는 데이터만 담을 리스트 생성
        for (Offer offer : allOffers) {
            if (offer.getYear().equals(year) && offer.getSemester().equals(semester)) { // 해당 학년도와 학기에 해당하는 데이터일 경우
                filteredOffers.add(offer); // 리스트에 추가
            }
        }

        model.addAttribute("year", year);
        model.addAttribute("semester", semester);
        model.addAttribute("offers", filteredOffers);

        return "offercreated";
    }


    @GetMapping("/enrolledCourses") // 수강신청 조회
    public String showOffers3(Model model, Offer offer) {
        List<Offer> offerList = offerService.offerList();
        model.addAttribute("offerList", offerList);

        return "enrolledCourses";
    }

    @PostMapping("/check") // 수강신청 성공 후
    public String check(Model model, @Valid Offer offer, BindingResult result) {
        if(result.hasErrors()) {
            System.out.println("== Form data does not validated ==");

            List<ObjectError> errors = result.getAllErrors();

            for(ObjectError error:errors) {
                System.out.println(error.getDefaultMessage());
            }

            model.addAttribute("offer", offer);
            return "createoffer";
        }

        offerService.insert(offer);

        return "check";
    }
}