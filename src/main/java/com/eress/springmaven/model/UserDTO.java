package com.eress.springmaven.model;

import lombok.Data;

@Data
public class UserDTO {

    private String userId;
    private String userNm;
    private String password;

    private int failCnt;
    private String failDate;
}
