package data.serviceW;

import data.dto.GradingDto;
import data.dto.TestDto;
import data.mapperW.GradingMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class GradingService {
    @Autowired
    private GradingMapperInter gradingMapperInter;

    public List<TestDto> getTest(int tutorcate_no){
        return gradingMapperInter.getTest(tutorcate_no);
    }

    public int getTutorcate(int user_no){
        return gradingMapperInter.getTutorcate(user_no);
    }

    public List<TestDto> getTestUser(Map<String, Object> map){
        return gradingMapperInter.getTestUser(map);
    }

    public void insertGrading(GradingDto dto){
        gradingMapperInter.insertGrading(dto);
    }
}
