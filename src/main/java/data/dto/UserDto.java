package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;
import java.math.BigDecimal;
import java.sql.Timestamp;

@NoArgsConstructor
@Data
@Alias("UserDto")
@Builder
@AllArgsConstructor
public class UserDto {
	private int user_no;
    private String user_name;
    private String user_id;
    private String user_password;
    private String user_addr1;
    private String user_addr2;
    private String user_postal;
    private String user_residentno;
    private String user_email;
    private int user_category; // 행정직원: 0, 학생: 1, 강사: 2
    private double user_holiday;
    private Integer user_incentive; // Nullable, with a default value*/
    private Timestamp user_gaipday; // Timestamp for registration date
    private Integer tutorcate_no; // Nullable as it's a foreign key
    private String user_photo;


    private int hdkind_no;
    private String hdkind_name;
    private double hdkind_days;


    private int holiday_no;
    private String holiday_start;
    private String holiday_end;

    private int lecture_no;
    private String lecture_name;
    private String lecture_time;

    /*
	 * sequence 유저 이름 유저 아이디 유저 비밀번호
	 *  유저 도로명주소 유저 상세주소 유저 우편번호
	 *   유저 주민등록번호 
	 *   유저 이메일 주소 
	 *   유저
	 * 분류 

	 */
}
