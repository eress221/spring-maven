package com.eress.springmaven.service.impl;

import com.eress.springmaven.model.UserDTO;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import com.eress.springmaven.mapper.LoginMapper;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import com.eress.springmaven.service.LoginService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Slf4j
@AllArgsConstructor
@Service
public class LoginServiceImpl implements LoginService {

    private final LoginMapper loginMapper;

    @Override
    public UserDTO getUserInfo(UserDTO reqUser) {
        UserDTO resUser = null;
        try {
            resUser = loginMapper.getUserInfo(reqUser);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return resUser;
    }

    @Override
    public String loginCheck(UserDTO reqUser, UserDTO resUser) {
        String result = null;
        if (resUser == null || resUser.getUserId() == null) {
            result = "fail";
        } else if (resUser.getFailCnt() >= 10) {
            result = "lock";
        } else if (!resUser.getPassword().equals(DigestUtils.sha256Hex(reqUser.getPassword()))) {
            reqUser.setPassword(null);
            reqUser.setFailCnt(resUser.getFailCnt() + 1);
            reqUser.setFailDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss")));
            // updateLoginFail
            result = "diff";
        } else {
            reqUser.setPassword(null);
            reqUser.setFailCnt(0);
            reqUser.setFailDate(null);
            // updateLoginFail
            result = "success";
        }
        return result;
    }
}
