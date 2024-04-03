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
    public List<Offer> getOffer(String username) { // 특정 사용자의 코스 조회
        String sqlStatement = "SELECT * FROM infoSystem.courses WHERE username=?";
        List<Offer> offers = jdbcTemplate.query(sqlStatement,
                new RowMapper<Offer>() {
                    @Override
                    public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Offer offer = new Offer();
                        //offer.setId(rs.getInt("id"));
                        offer.setYear(rs.getString("수강년도"));
                        offer.setSemester(rs.getString("학기"));
                        offer.setCourseCode(rs.getString("교과코드"));
                        offer.setCourseName(rs.getString("교과목명"));
                        offer.setCourseType(rs.getString("교과구분"));
                        offer.setProfessor(rs.getString("담당교수"));
                        offer.setCredit(rs.getString("학점"));
                        return offer;
                    }
                });
        return offers;
    }



    //query and return multiple objects
    // cRud method -> 생성, 조회, 수정, 삭제
    public List<Offer> getOffers() { //조회(R) -> all

        String sqlStatement= "select * from infoSystem.courses;";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

            @Override
            public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {

                Offer offer= new Offer();

                //offer.setId(rs.getInt("id"));
                offer.setYear(rs.getString("year"));
                offer.setSemester(rs.getString("semester"));
                offer.setCourseCode(rs.getString("courseCode"));
                offer.setCourseName(rs.getString("courseName"));
                offer.setCourseType(rs.getString("courseType"));
                offer.setProfessor(rs.getString("professor"));
                offer.setCredit(rs.getString("credit"));


                return offer;
            }
        });
    }

    public List<Offer> getOffersByYearAndSemester() { //조회(R) -> all

        String sqlStatement= "select * from infoSystem.courses;";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

            @Override
            public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {

                Offer offer= new Offer();

                //offer.setId(rs.getInt("id"));
                offer.setYear(rs.getString("year"));
                offer.setSemester(rs.getString("semester"));
                offer.setCourseCode(rs.getString("courseCode"));
                offer.setCourseName(rs.getString("courseName"));
                offer.setCourseType(rs.getString("courseType"));
                offer.setProfessor(rs.getString("professor"));
                offer.setCredit(rs.getString("credit"));


                return offer;
            }
        });
    }


    // Crud method
    public boolean insert(Offer offer) {
        String year = offer.getYear();
        String semester = offer.getSemester();
        String courseCode = offer.getCourseCode();
        String courseName = offer.getCourseName();
        String courseType = offer.getCourseType();
        String professor = offer.getProfessor();
        String credit = offer.getCredit();

        String sqlStatement = "INSERT INTO enrolledCourses (year, semester, courseCode, courseName, courseType, professor, credit) VALUES (?,?, ?, ?, ?, ?, ?)";

        return (jdbcTemplate.update(sqlStatement, new Object[]{year, semester,courseCode,courseName, courseType, professor, credit}) == 1);
    }

    public List<Offer> offerList() { //조회(R) -> all

        String sqlStatement= "select * from enrolledCourses;";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

            @Override
            public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {

                Offer offer= new Offer();

                //offer.setId(rs.getInt("id"));
                offer.setYear(rs.getString("year"));
                offer.setSemester(rs.getString("semester"));
                offer.setCourseCode(rs.getString("courseCode"));
                offer.setCourseName(rs.getString("courseName"));
                offer.setCourseType(rs.getString("courseType"));
                offer.setProfessor(rs.getString("professor"));
                offer.setCredit(rs.getString("credit"));


                return offer;
            }
        });
    }



    // crUd method
//    public boolean update(Offer offer) { //수정(U)
//
//        int id = offer.getId();
//        String username= offer.getUsername();
//        String email= offer.getEmail();
//        String password = offer.getPassword();
//
//        String sqlStatement= "update offers set username=?, email=?, password=? where id=?";
//
//        return (jdbcTemplate.update(sqlStatement, new Object[] {username, email, password, id}) == 1);
//    }

    //cruD method
    public boolean delete(int id) { //삭제(D)
        String sqlStatement= "delete from offers where id=?";
        return (jdbcTemplate.update(sqlStatement, new Object[] {id}) == 1);
    }

}