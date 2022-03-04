package com.school.library.service;

import com.school.library.model.Participant;
import com.school.library.repository.ParticipantRepository;
import com.school.library.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.crypto.spec.SecretKeySpec;
import javax.transaction.Transactional;
import java.security.Key;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class ParticipantService implements IParticipantService {

    @Autowired
    private ParticipantRepository participantRepository;

    @Bean
    public PasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private PasswordEncoder passwordEncoder;


    private static final String ALGO = "AES";
    private static final byte[] keyValue = new byte[] { 'T', 'E', 'S', 'T' };

    @Override
    public List<Participant> findAll() {
        return (List<Participant>) participantRepository.findAll(Sort.by(Sort.Direction.ASC, "classLnzId"));
    }

    @Override
    public void createParticipant(Participant participant) {
        //participant.setPassword(encrypt(participant.getPassword()));
        participantRepository.save(participant);
    }

    @Override
    public void removeParticipant(Long id) {
        participantRepository.deleteById(id);

    }
    private static Key generateKey() {
        SecretKeySpec key = new SecretKeySpec(keyValue, ALGO);
        return key;
    }

//    public static String encrypt(String pwd) {
//        String encodedPwd = "";
//        try {
//            Key key = generateKey();
//            Cipher c = Cipher.getInstance(ALGO);
//            c.init(Cipher.ENCRYPT_MODE, key);
//            byte[] encVal = c.doFinal(pwd.getBytes());
//            encodedPwd = Base64.getEncoder().encodeToString(encVal);
//
//        } catch (Exception e) {
//
//            e.printStackTrace();
//        }
//        return encodedPwd;
//
//    }

//    public static String decrypt(String encryptedData) {
//        String decodedPWD = "";
//        try {
//            Key key = generateKey();
//            Cipher c = Cipher.getInstance(ALGO);
//            c.init(Cipher.DECRYPT_MODE, key);
//            byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
//            byte[] decValue = c.doFinal(decordedValue);
//            decodedPWD = new String(decValue);
//
//        } catch (Exception e) {
//
//        }
//        return decodedPWD;
//    }

    @Override
    public Participant findByLoginPass(String login, String password) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        for (Participant participant : participantRepository.findAll()){
            if (participant.getLogin().equals(login) && participant.getPassword().equals(/*decrypt(*/password/*)*/)){
                return participant;
            }
        }
        return null;
    }

    @Override
    public Participant findByLogin(String login){
        for (Participant participant : participantRepository.findAll()){
            if (participant.getLogin().equals(login)){
                return participant;
            }
        }
        return null;
    }

    @Override
    public Participant findById(Long id) {
        return participantRepository.getOne(id);
    }

    @Override
    public List<Participant> findByClass(Long classLnzId){
        List<Participant> participants = participantRepository.findAll();
        List<Participant> showParticipantsByClass = new ArrayList<>();
        for (Participant participant : participants){
            if (participant.getClassLnzId() == classLnzId){
                showParticipantsByClass.add(participant);
            }
        }
        return showParticipantsByClass;
    }

    @Override
    public List<Participant> findByCriteria(String terms){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("FROM Participant WHERE " +
                "lastName like concat('%',:terms,'%')" +
                "or firstName like concat('%',:terms,'%')" +
                "or thirdName like concat('%',:terms,'%')");
        query.setParameter("terms", terms);
        List<Participant> list = query.list();
        if (list.size() == 0)
            return Collections.emptyList();
        return list;
    }
}
