package data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class HdkindDto {
    private int hdkind_no;
    private String hdkind_name;
    private double hdkind_days;
}
