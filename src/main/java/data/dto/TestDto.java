package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class TestDto {
    private int test_no;
    private int lecture_no;
    private int user_no;
    private String test_content;

    private String user_name;
    private String user_id;
    private String lecture_name;
}
