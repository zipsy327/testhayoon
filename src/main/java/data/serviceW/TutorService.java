package data.serviceW;

import data.dto.UserDto;
import data.mapperW.TutorcateMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TutorService {
    @Autowired
    private TutorcateMapperInter tutorMapperInter;

    public List<UserDto> getAllTutor(){
        return tutorMapperInter.getAllTutor();
    }
}
