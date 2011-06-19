package com.jeremylund.templating.web;

import com.jeremylund.templating.form.EntryForm;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@RequestMapping("/example1")
public class Example1Controller {

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView setupForm() {
        return new ModelAndView("example1/form", "entryForm", new EntryForm());
    }

    @RequestMapping(method = RequestMethod.POST)
    public String submitForm(@ModelAttribute @Valid EntryForm entryForm, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "example1/form";
        } else {
            // Do something real here
            return "example1/results";
        }
    }
}
