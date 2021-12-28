package com.tech.controll.controllers;

import com.sun.tools.internal.xjc.model.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
