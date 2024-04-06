package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.OfferDao;
import kr.ac.hansung.cse.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OfferService {
    @Autowired
    private OfferDao offerDao;

    public List<Offer> getOffers(){
        return offerDao.getOffers();
    }

    public void insert(Offer offer) {
        offerDao.insert(offer);
    }

    public List<Offer> offerList(){
        return offerDao.offerList();
    }

    public int existsByCourseCode(String courseCode){
        return offerDao.existsByCourseCode(courseCode);
    }

}