package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Offer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import javax.servlet.http.HttpServletRequest;

@Controller // 컨트롤러로 되어있으면 아래 코드 부분이 빈으로 등록이 된다.
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger("kr.ac.hansung.controller.HomeController");

    @GetMapping("/")
    public String home(HttpServletRequest request, Model model) {
//        username을 출력하기 위한 코드
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        model.addAttribute("username", username);

        Offer offer = new Offer();
        offer.setUsername(username);


        String url = request.getRequestURL().toString();
        String clientIPaddr = request.getRemoteAddr();

        logger.info("Request URL: {}, Client IP: {}", url, clientIPaddr);

        return "home";
    }
}


