package com.eress.springmaven.controller;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class MainController {

    @RequestMapping(value = "/main.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String main(HttpSession hs, Model model) {
        if (hs.getAttribute("userId") == null) {
            return "redirect:/login/loginForm.do";
        } else {
            model.addAttribute("title", "메인");
            return "/main.defaultTpl";
        }
    }

    @ResponseBody
    @RequestMapping(value = "/mainTable.do", method = RequestMethod.POST)
    public String mainTable() {
        Gson gson = new Gson();
        Map<String, Object> obj = new HashMap<>();
        List<Map<String, Object>> list = new ArrayList<>();
        for (int i=0; i<10; i++) {
            Map<String, Object> temp = new HashMap<>();
            temp.put("no", (i+1));
            temp.put("col1", "col1");
            temp.put("col2", "col2");
            temp.put("col3", "col3");
            temp.put("col4", "col4");
            temp.put("test1", "test1");
            temp.put("test2", "test2");
            list.add(temp);
        }
        obj.put("data", list);
        return gson.toJson(obj);
    }
}
