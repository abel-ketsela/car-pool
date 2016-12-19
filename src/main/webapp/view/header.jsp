<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<header class="main-header">
    <a href="<c:url value="/index"/>" class="logo"><b>CAR POOLING</b></a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account: style can be found in dropdown.less -->
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">                        
                        <span class="hidden-xs">
                            
                        </span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- User image -->
                        <li class="user-header">                            
                            <p>
                                <c:if test="${user != null}">
                                    ${user}
                                </c:if>
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <sec:authorize access="hasRole('ROLE_USER')">
                                <c:url value="/logout" var="logoutUrl" />
                                <form action="${logoutUrl}" method="post" id="logoutForm">
                                    <input type="hidden" id="csrfToken" name="${_csrf.parameterName}"
                                           value="${_csrf.token}" />
                                </form>                            
                                <script type="text/javascript">
                                    function formSubmit() {
                                        document.getElementById("logoutForm").submit();
                                    }
                                </script>
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Change Password</a>
                                </div>
                                <div class="pull-right">
                                    <a href="javascript:formSubmit()" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </sec:authorize>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>

