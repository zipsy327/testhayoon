package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GradingDto {
    private int grading_no;
    private int test_no;
    private String grading_content;
    private String grading_grade;
}
