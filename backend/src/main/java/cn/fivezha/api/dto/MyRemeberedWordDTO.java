package cn.fivezha.api.dto;

import lombok.Data;

@Data
public class MyRemeberedWordDTO {
    private String word;
    private String translation;
    private int times;
}
