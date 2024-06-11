package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Time;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class AttendanceDto {
    private int attendance_no;
    private Time attendance_in;
    private Time attendance_out;
    private Date attendance_day;
    private int user_no;
}
