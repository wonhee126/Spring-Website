package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.OfferDao;
import kr.ac.hansung.cse.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OfferService {

    //service -> dao
    @Autowired
    private OfferDao offerDao;

//    public List<Offer> getAllOffers() {
//        return offerDao.getOffers();
//    }

    public List<Offer> getOffers(){
        return offerDao.getOffers();
    }

    public void insert(Offer offer) {
        offerDao.insert(offer);
    }

    public List<Offer> getOffersByYearAndSemester(Integer year, Integer semester) {
        return offerDao.getOffersByYearAndSemester();
    }

//    public List<Offer> getOfferById(int userId) {
//        return offerDao.getOffer(userId);
//    }
}