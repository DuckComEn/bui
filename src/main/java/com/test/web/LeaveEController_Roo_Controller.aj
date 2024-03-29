// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.test.web;

import com.test.entity.LeaveE;
import com.test.web.LeaveEController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LeaveEController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LeaveEController.create(@Valid LeaveE leaveE, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, leaveE);
            return "leavees/create";
        }
        uiModel.asMap().clear();
        leaveE.persist();
        return "redirect:/leavees/" + encodeUrlPathSegment(leaveE.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LeaveEController.createForm(Model uiModel) {
        populateEditForm(uiModel, new LeaveE());
        return "leavees/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LeaveEController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("leavee", LeaveE.findLeaveE(id));
        uiModel.addAttribute("itemId", id);
        return "leavees/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LeaveEController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("leavees", LeaveE.findLeaveEEntries(firstResult, sizeNo));
            float nrOfPages = (float) LeaveE.countLeaveEs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("leavees", LeaveE.findAllLeaveEs());
        }
        addDateTimeFormatPatterns(uiModel);
        return "leavees/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LeaveEController.update(@Valid LeaveE leaveE, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, leaveE);
            return "leavees/update";
        }
        uiModel.asMap().clear();
        leaveE.merge();
        return "redirect:/leavees/" + encodeUrlPathSegment(leaveE.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LeaveEController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, LeaveE.findLeaveE(id));
        return "leavees/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LeaveEController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        LeaveE leaveE = LeaveE.findLeaveE(id);
        leaveE.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/leavees";
    }
    
    void LeaveEController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("leaveE_dateatleave_date_format", DateTimeFormat.patternForStyle("SS", LocaleContextHolder.getLocale()));
    }
    
    void LeaveEController.populateEditForm(Model uiModel, LeaveE leaveE) {
        uiModel.addAttribute("leaveE", leaveE);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String LeaveEController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
