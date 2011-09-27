/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.onRouteDB;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author javidgon
 */
public class InsertRouteAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)


            throws Exception {

         // extract user data
        InsertRouteForm formBean = (InsertRouteForm) form;
        String name = formBean.getName();
        String country = formBean.getCountry();
        String province = formBean.getProvince();
        String city = formBean.getCity();
        String description = formBean.getDescription();
        String message = "Errors: <br/>";
// perform validation

        if (name.equals("")) {

            message += "- Name field is not valid <br/>";
        }

        if (name.length() > 70) {

            message += "- Name field has more than 70 characters <br/>";
        }
        if (country.equals("")) {

            message += "- Country field is empty <br/>";
        }

        if (province.equals("")) {

            message += "- Province field is empty <br/>";
        }

        if (city.equals("")) {

            message += "- City field is empty <br/>";
        }

        if (description.equals("")) {

            message += "- Description field is empty <br/>";
        }

        if (description.length() > 200) {

            message += "- Description field has more than 200 characters <br/>";
        }

        if (!message.equals("Errors: <br/>")) {

            formBean.setError(message);
            return mapping.findForward(FAILURE);
            
        } else {

            onRouteDB.createRoute(formBean);


            return mapping.findForward(SUCCESS);
        }

    }

    
}
