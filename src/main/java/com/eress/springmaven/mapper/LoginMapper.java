package com.eress.springmaven.mapper;

import com.eress.springmaven.model.UserDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginMapper {

    UserDTO getUserInfo(UserDTO resUser) throws Exception;
}
