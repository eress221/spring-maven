package com.eress.springmaven.service;

import com.eress.springmaven.model.UserDTO;

public interface LoginService {

    UserDTO getUserInfo(UserDTO reqUser);
    String loginCheck(UserDTO reqUser, UserDTO resUser);
}
