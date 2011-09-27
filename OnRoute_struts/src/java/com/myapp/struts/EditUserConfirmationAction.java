/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.myapp.struts;

import encryption.SHA1;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.onRouteDB;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author javidgon
 */
public class EditUserConfirmationAction extends org.apache.struts.action.Action {
    
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

        HttpSession session = request.getSession(true);
        SHA1 s = new SHA1();
             // extract user data
        EditUserForm formBean = (EditUserForm) form;
        String email = ((RegistrationForm)session.getAttribute("user")).getEmail();
        formBean.setEmail(email);
        String password = formBean.getPassword();
        String repassword = formBean.getRepassword();
        String name = formBean.getName();
        String surname = formBean.getSurname();
        String gender = formBean.getGender();
        String country = formBean.getCountry();
        String message = "Errors: <br/>";
// perform validation

        if (email.equals("")) {

            message += "- Email field is not valid <br/>";
        }
        if (password.equals("")) {

            message += "- Password field is empty <br/>";
        }

        if (!password.equals(repassword)) {

            message += "- Passwords don't match <br/>";
        }

        if (name.equals("")) {

            message += "- Name field is empty <br/>";
        }

         if (name.length() > 30) {

            message += "- Name field has more than 30 characters <br/>";
        }
        if (surname.equals("")) {

            message += "- Surname field is empty <br/>";
        }

         if (surname.length() > 30) {

            message += "- Surname field has more than 30 characters <br/>";
        }

        if (gender.equals("")) {

            message += "- Gender field is empty <br/>";
        }

         if (gender.length() > 10) {

            message += "- Gender field has more than 10 characters <br/>";
        }

        if (country.equals("")) {

            message += "- Country field is empty <br/>";
        }

         if (country.length() > 30) {

            message += "- Country field has more than 30 characters <br/>";
        }


        if (!message.equals("Errors: <br/>")) {

            formBean.setError(message);
            return mapping.findForward(FAILURE);

        } else {

            password = s.getHash(password);
            formBean.setPassword(password);

            onRouteDB.updateUser(formBean);

            return mapping.findForward(SUCCESS);
        }
    }

}
