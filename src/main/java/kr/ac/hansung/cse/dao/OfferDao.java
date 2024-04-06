package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Offer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.net.SocketOption;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class OfferDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public int getRowCount() {
        String sqlStatement= "select count(*) from offers";
        return jdbcTemplate.queryForObject(sqlStatement, Integer.class);

    }

    public List<Offer> getOffers() { // 수강한 목록 모두 조회

        String sqlStatement= "select * from infoSystem.courses;";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Offer>() {

            @Override
            public Offer mapRow(ResultSet rs, int rowNum) throws SQLException {

                Offer offer= new Offer();

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
    public boolean insert(Offer offer) { // DB에 삽입
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

    public List<Offer> offerList() { // 수강신청한 목록 모두 조회

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
    public boolean delete(int id) { //삭제(D)
        String sqlStatement= "delete from offers where id=?";
        return (jdbcTemplate.update(sqlStatement, new Object[] {id}) == 1);
    }
    public int existsByCourseCode(String courseCode) { //courseCode 중복 금지 검사 코드
        String sqlStatement = "SELECT COUNT(*) FROM enrolledCourses WHERE courseCode = ?";
        int result = jdbcTemplate.queryForObject(sqlStatement, new Object[]{courseCode}, Integer.class);
        System.out.println(result); // db에 존재하면 result는 1이 됨
        return result;
    }
}