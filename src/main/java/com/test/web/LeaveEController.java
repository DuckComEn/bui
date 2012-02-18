package com.test.web;

import com.test.entity.LeaveE;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/leavees")
@Controller
@RooWebScaffold(path = "leavees", formBackingObject = LeaveE.class)
public class LeaveEController {
}
