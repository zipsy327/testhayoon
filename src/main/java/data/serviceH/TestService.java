package data.serviceH;

import data.dto.UserDto;
import data.mapperH.TestMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    private TestMapperInter testInter;

    // user_id에 해당하는 UserDto를 반환합니다.
    public UserDto getSessionid(String user_id){
        return testInter.getSessionid(user_id);
    }

    public void insertTest(int lectureNo, int userNo, String testContent){
        testInter.insertTest(lectureNo,userNo,testContent);

    }
}
