package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class HolidayDto {
    private int holiday_no;
    private int user_no;
    private int hdkind_no;
    private String holiday_start;
    private String holiday_end;
}
