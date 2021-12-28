package com.tech.controll.service;

import com.tech.controll.repository.MemberRepository;
import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.GuroMember;

import javax.naming.NamingException;
import java.sql.SQLException;
import java.util.List;

public class MemberService  {
    MemberRepository memberRepository;


    public String login(String id,String pwd) throws Exception {
        memberRepository = new MemberRepository();
            String session = null;
            GuroMember member = memberRepository.findByID(id);
            String bcpass = null;
                bcpass = member.getPwd();
                SHA256 sha = SHA256.getInsatnce();
                String shapass = sha.getSha256(pwd.getBytes());
                if (BCrypt.checkpw(shapass, bcpass)){
                    session = id;
                }
            return session;
        }

    public List<GuroMember> list() throws SQLException, ClassNotFoundException, NamingException {
        memberRepository = new MemberRepository();
        return memberRepository.findAll();
    }

    public int join(String id, String pwd, String name, String tel) throws Exception {
        memberRepository = new MemberRepository();
        SHA256 sha = SHA256.getInsatnce();
        String shPwd = sha.getSha256(pwd.getBytes());
        pwd = BCrypt.hashpw(shPwd,BCrypt.gensalt());
        return memberRepository.insertMember(id,pwd,name,tel);
    }

    public int updateInfo(String id, String name, String tel) throws SQLException, ClassNotFoundException, NamingException {
        memberRepository = new MemberRepository();
        return memberRepository.updateMember(id, name,tel);
    }

    public GuroMember info(String id, String pwd) throws Exception {
        memberRepository = new MemberRepository();
        String login = login(id, pwd);
        return memberRepository.findByID(login);
    }
}
