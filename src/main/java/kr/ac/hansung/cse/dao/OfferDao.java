package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OfferDao {

    private JdbcTemplate jdbcTemplate;  // psa(portable service abstraction, sql(x) api

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public int getRowCount() {
        String sqlStatement= "select count(*) from offers";
        return jdbcTemplate.queryForObject(sqlStatement, Integer.class);

    }


    //query and return a single object
//    public Offer getOffer(String name) { //조회(R) -> 하나
//
//        String sqlStatement= "select * from offers where name=?";
//        return jdbcTemplate.queryForObject(sqlStatement, new Object[] {name},
//                new RowMapper<Offer>() {
//
//                    @Override
//                    public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
//
//                        Offer offer= new Offer();
//
//                        offer.setId(rs.getInt("id"));
//                        offer.setName(rs.getString("name"));
//                        offer.setEmail(rs.getString("email"));
//                        offer.setText(rs.getString("text"));
//
//                        return offer;
//                    }
//                });
//    }

    //query and return multiple objects
    // cRud method -> 생성, 조회, 수정, 삭제
    public List<Offer> getOffers() { //조회(R) -> all

        String sqlStatement= "select * from infoSystem.Users;";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

            @Override
            public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {

                Offer offer= new Offer();

                offer.setId(rs.getInt("id"));
                offer.setUsername(rs.getString("username"));
                offer.setEmail(rs.getString("email"));
                offer.setPassword(rs.getString("password"));

                return offer;
            }
        });
    }


    // Crud method
    public boolean insert(Offer offer) { //생성(C) -> Users 테이블로 수정 완료

        String username= offer.getUsername();
        String email= offer.getEmail();
        String password = offer.getPassword();

        String sqlStatement= "insert into infoSystem.Users (username, email, password) VALUES values (?,?,?)";

        return (jdbcTemplate.update(sqlStatement, new Object[] {username, email, password}) == 1);
    }

    // crUd method
    public boolean update(Offer offer) { //수정(U)

        int id = offer.getId();
        String username= offer.getUsername();
        String email= offer.getEmail();
        String password = offer.getPassword();

        String sqlStatement= "update offers set username=?, email=?, password=? where id=?";

        return (jdbcTemplate.update(sqlStatement, new Object[] {username, email, password, id}) == 1);
    }

    //cruD method
    public boolean delete(int id) { //삭제(D)
        String sqlStatement= "delete from offers where id=?";
        return (jdbcTemplate.update(sqlStatement, new Object[] {id}) == 1);
    }

}
