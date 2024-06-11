package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class LectureDto {
    private int lecture_no;
    private String lecture_name;
    private Time lecture_time;
}
