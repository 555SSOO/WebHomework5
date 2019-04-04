package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "webapp.ServletForm", urlPatterns = {"/showscopes"})
public class ServletForm extends HttpServlet {

    private final String REQUEST_SCOPE = "request";
    private final String SESSION_SCOPE = "session";
    private final String APPLICATION_SCOPE = "application";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String scope = request.getParameter("scope");
        String key = request.getParameter("key");
        String value = request.getParameter("value");

        switch (scope){
            case REQUEST_SCOPE:
                // Set request scoped attribute
                request.setAttribute(key, value);
                break;
            case SESSION_SCOPE:
                // Set session scoped attribute
                request.getSession().setAttribute(key, value);
                break;
            case APPLICATION_SCOPE:
                // Set application scoped attribute
                request.getServletContext().setAttribute(key, value);
                break;
            default:
                break;
        }
        // Send redirect to other servlet
        request.getRequestDispatcher("/response.jsp").forward(request, response);
    }

}
