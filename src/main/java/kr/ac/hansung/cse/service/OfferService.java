package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.OfferDao;
import kr.ac.hansung.cse.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfferService {

    //service -> dao
    @Autowired
    private OfferDao offerDao;

//    public List<Offer> getAllOffers() {
//        return offerDao.getOffers();
//    }

    public List<Offer> getOffers(int id){
        return offerDao.getOffer(id);
    }

    public void insert(Offer offer) {
        offerDao.insert(offer);
    }
}
