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
public class LoginAction extends org.apache.struts.action.Action {
    
    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    private static final String FAILURELOGIN = "failurelogin";
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
        LoginForm formBean = (LoginForm) form;
        String email = formBean.getEmail();
        String password = formBean.getPassword();
        String message = "Errors: <br/>";
        String res = null;

        if (email.equals("")) {

            message += "- Email field is empty <br/>";
        }
        if (password.equals("")) {

            message += "- Password field is empty <br/>";
        }

        if (!message.equals("Errors: <br/>")) {

            formBean.setError(message);
            return mapping.findForward(FAILURE);
        } else {

            password = s.getHash(password);
            formBean.setPassword(password);
            res = onRouteDB.loginUser(formBean);

            if(null != res){

                session.setAttribute("email", formBean.getEmail());
                return mapping.findForward(SUCCESS);

            }else{
                message += "- Coudn't find user :( <br/>";
                formBean.setError(message);
                return mapping.findForward(FAILURELOGIN);
            }
        }

        
    }
}
