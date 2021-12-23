package vo;

import java.util.List;
import java.util.Map;

public class Post {
    int hire_post_num;
    String hire_post_name;
    Map<String,String> apply_condition;
    Map<String,String> work_condition;
    String com_name;
    List<String> category;
    String post_date;
    String end_date;

    public int getHire_post_num() {
        return hire_post_num;
    }

    public void setHire_post_num(int hire_post_num) {
        this.hire_post_num = hire_post_num;
    }

    public String getHire_post_name() {
        return hire_post_name;
    }

    public void setHire_post_name(String hire_post_name) {
        this.hire_post_name = hire_post_name;
    }

    public Map<String ,String> getApply_condition() {
        return apply_condition;
    }

    public void setApply_condition(Map<String,String> apply_condition) {
        this.apply_condition = apply_condition;
    }

    public String getCom_name() {
        return com_name;
    }

    public void setCom_name(String com_name) {
        this.com_name = com_name;
    }

    public List<String> getCategory() {
        return category;
    }

    public void setCategory(List<String> category) {
        this.category = category;
    }

    public String getPost_date() {
        return post_date;
    }

    public void setPost_date(String post_date) {
        this.post_date = post_date;
    }

    public String getEnd_date() {
        return end_date;
    }

    public void setEnd_date(String end_date) {
        this.end_date = end_date;
    }

    public Map<String, String> getWork_condition() {
        return work_condition;
    }

    public void setWork_condition(Map<String, String> work_condition) {
        this.work_condition = work_condition;
    }
}
