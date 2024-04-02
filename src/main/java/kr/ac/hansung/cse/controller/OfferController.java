package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Offer;
import kr.ac.hansung.cse.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
public class OfferController {
    @Autowired //자동으로 연결시켜준다는 의미, 의존성 주입을 해주세요 라는 의미
    private OfferService offerService;

    @GetMapping("/offers") // 학년별 이수 학점 조회
    public String showOffers(Model model) {
        List<Offer> offers = offerService.getOffers(new Offer().getUser_id());
        model.addAttribute("id_offers", offers);
        return "offers";
    }

    @GetMapping("/createoffer") // 수강신청 하기
    public String createOffer(Model model) {

        model.addAttribute("offer", new Offer());

        return "createoffer";
    }
    @GetMapping("/docreate") //상세보기
    public String showOffers2(Model model) {

        return "offercreated";
    }

    @GetMapping("/enrolledCourses") // 수강신청 조회
    public String showOffers3(Model model) {

        return "enrolledCourses";
    }
}
