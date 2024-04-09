// TestFilter.java
package kr.ac.hansung.cse.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*") //루트 이하의 모든 request를 가로채겠다는 의미
public class TestFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println( ((HttpServletRequest) request).getRequestURL() ); //사용자의 url을 출력하는 코드

        // pass the request along the filter chain
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
