package dao;

import db.DBCon;
import vo.Post;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class PostDao {


    public Post post(String postNum) throws SQLException, ClassNotFoundException {
        Connection con = DBCon.getConnection();

        // 담을 객체 post 생성
        Post post = new Post();

        String sql = "select " +
                " hire_post_name," +
                " apply_condition," +
                " WORK_CONDITION," +
                " com_name," +
                " category," +
                " to_char(post_date,'\"\"YYYY\"년 \"MM\"월 \"DD\"일\"') as post_date," +
                " to_char(END_DATE,'\"\"YYYY\"년 \"MM\"월 \"DD\"일\"') as end_date" +
                " from JOBDJ_TY " +
                "where HIRE_POST_NUM=?";
        PreparedStatement pstmt = con.prepareStatement(sql);
        pstmt.setString(1, postNum);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        // apply_condition(지원자격)은 key:value의 형태로 저장되어있다.
        // split 메서드를 통해서 ','를 기준으로 먼저 자르고 ':'를 기준으로 다시 잘라서 저장.
        // key 값은 각각 경력, 학력 ,우대로 나뉨.
        Map<String, String> applyConditionMap = getApplyConditionMap(rs);
        // work_condition(근무조건)은 key:value의 형태로 저장되어있다.
        // split 메서드를 통해서 ','를 기준으로 먼저 자르고 ':'를 기준으로 다시 잘라서 저장.
        // key 값은 각각 고용형태, 급여, 지역, 시간, 직책으로 나뉨.
        // apply_condition에서 사용한 배열 jsons를 그대로 사용.
        Map<String, String> workConditionMap = getWorkConidtionMap(rs);
        List<String> categorys = getCategorys(rs);

        post.setHire_post_name(rs.getString("hire_post_name"));
        post.setApply_condition(applyConditionMap);
        post.setWork_condition(workConditionMap);
        post.setCom_name(rs.getString("com_name"));
        post.setCategory(categorys);
        post.setPost_date(rs.getString("post_date"));
        post.setEnd_date(rs.getString("end_date"));

        return post;
    }
    public List<Post> postList() throws SQLException, ClassNotFoundException {
        Connection con = DBCon.getConnection();
        List<Post> postList = new ArrayList<>();
        String sql = "select " +
                "hire_post_num," +
                " HIRE_POST_NAME, " +
                " COM_NAME," +
                " APPLY_CONDITION," +
                " WORK_CONDITION," +
                " CATEGORY, " +
                " to_char(post_date,'\"\"YYYY\"년 \"MM\"월 \"DD\"일\"') as post_date," +
                " to_char(END_DATE,'\"\"YYYY\"년 \"MM\"월 \"DD\"일\"') as end_date" +
                " from JOBDJ_TY " +
                "order by HIRE_POST_NUM " +
                "desc ";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            Post post = new Post();

            Map<String, String> workConditionMap = getWorkConidtionMap(rs);
            Map<String, String> applyConditionMap = getApplyConditionMap(rs);
            List<String> categorys = getCategorys(rs);
            post.setHire_post_num(rs.getInt("hire_post_num"));
            post.setHire_post_name(rs.getString("hire_post_name"));
            post.setCom_name(rs.getString("com_name"));
            post.setApply_condition(applyConditionMap);
            post.setWork_condition(workConditionMap);
            post.setCategory(categorys);
            post.setPost_date(rs.getString("post_date"));
            post.setEnd_date(rs.getString("end_date"));
            postList.add(post);
            System.out.println("rs = " + rs.getString("com_name"));
        }

        return postList;
    }

    private List<String> getCategorys(ResultSet rs) throws SQLException {
        String category = rs.getString("category");
        return Arrays.asList(category.split(","));
    }

    private Map<String, String> getApplyConditionMap(ResultSet rs) throws SQLException {
        String apply_condition = rs.getString("apply_condition");
        // LinkedHashMap을 사용하면 HashMap과 다르게 들어가는 순서가 보장되어 있다.
        Map<String, String> applyConditionMap = new LinkedHashMap<>();
        String[] jsons = apply_condition.split(",");
        for (String json : jsons) {
            String[] kb = json.split(":");
            for (int i = 0; i < kb.length; i++) {
                applyConditionMap.put(kb[0], kb[1]);
            }
        }
        return applyConditionMap;
    }

    private Map<String, String> getWorkConidtionMap(ResultSet rs) throws SQLException {
        String[] jsons;
        String work_condition = rs.getString("work_condition");
        Map<String, String> workConditionMap = new LinkedHashMap<>();
        jsons = work_condition.split(",");
        for (String json : jsons) {
            String[] kb = json.split(":");
            for (int i = 0; i < kb.length; i++) {
                workConditionMap.put(kb[0], kb[1]);
            }
        }
        return workConditionMap;
    }
}
