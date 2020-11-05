<%--
    This is jsp includes html for our web page. It's connected with style.css under same WEB-INF folder
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">        
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
        <style><%@include file="./style.css"%></style>
        <title>Week 8 Lab</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <div class="row m-5">
            <div class="col-3">
                <div class="card  bg-dark text-white">
                    <c:choose>
                        <c:when test="${defaultTitle == true}">
                            <h1 class="card-header">User</h1>
                        </c:when>
                        <c:when test="${addUserTitle == true}">
                            <h1 class="card-header">Add User</h1>
                        </c:when>
                        <c:when test="${editUserTitle == true}">
                            <h1 class="card-header">Edit User</h1>
                        </c:when>
                    </c:choose>
                    <div class="card-body">
                        <form method="post" action="User">
                            <c:choose>
                                <c:when test="${addUserForm == true}">
                                    <input type="submit" value="Add User" class="btn btn-primary btn-block">
                                    <input type="hidden" name="action" value="addUser">                   
                                </c:when>
                                <c:when test="${addUserForm == false}">
                                    <input type="submit" value="Add User"  class="btn btn-primary btn-block" disabled>            
                                </c:when>            
                            </c:choose>          
                            <br>                    
                            <c:choose>
                                <c:when test="${emailForm == true}">
                                    <input type="email" name="email" placeholder="Email" class="form-control bg-dark text-white" value=${userToEdit.email}>
                                </c:when>
                                <c:when test="${emailForm == false}">
                                    <input type="email" name="email" class="form-control bg-dark" value="" disabled>
                                </c:when>            
                            </c:choose>
                            <br>            
                            <c:choose>
                                <c:when test="${firstNameForm == true}">
                                    <input type="text" name="firstName" placeholder="First Name" class="form-control bg-dark text-white" value=${userToEdit.firstName} >
                                </c:when>
                                <c:when test="${firstNameForm == false}">
                                    <input type="text" name="firstName" class="form-control bg-dark" value="" disabled>
                                </c:when>            
                            </c:choose>            
                            <br>
                            <c:choose>
                                <c:when test="${lastNameForm == true}">
                                    <input type="text" name="lastName" placeholder="Last Name" class="form-control bg-dark text-white" value=${userToEdit.lastName} >
                                </c:when>
                                <c:when test="${lastNameForm == false}">
                                    <input type="text" name="lastName" class="form-control bg-dark" value="" disabled>
                                </c:when>            
                            </c:choose>            
                            <br>
                            <c:choose>
                                <c:when test="${passwordForm == true}">
                                    <input type="password" name="password" placeholder="Password" class="form-control bg-dark text-white" value=${userToEdit.password} >
                                </c:when>
                                <c:when test="${passwordForm == false}">
                                    <input type="password" name="password" class="form-control bg-dark" value="" disabled>
                                </c:when>            
                            </c:choose>
                            <br>                                
                            <c:choose>
                                <c:when test="${roleNameForm == true}">
                                    <select name="roleName" class="form-control bg-dark text-white" value=${userToEdit.role}>
                                        <c:forEach items="${roles}" var="role">
                                            <option value=${role.roleID}>${role.roleName}</option>
                                        </c:forEach>                        
                                    </select>                  
                                </c:when>
                                <c:when test="${roleNameForm == false}">                    
                                    <select name="roleName" class="form-control bg-dark" value=${userToEdit.role} disabled>                                            
                                    </select>                  
                                </c:when>            
                            </c:choose>
                            <br>
                            <c:choose>
                                <c:when test="${saveForm == true}">
                                    <input type="submit" value="Save" class="btn btn-success btn-block">
                                    <input type="hidden" name="action" value="saveUser">                                   
                                </c:when>
                                <c:when test="${saveForm == false}">
                                    <input type="submit" value="Save" class="btn btn-success btn-block" disabled>     
                                </c:when>   
                            </c:choose>
                        </form>
                        <br>
                        <form method="post" action="User">
                            <c:choose>
                                <c:when test="${cancelForm == true}">
                                    <input type="submit" value="Cancel" class="btn btn-secondary btn-block">
                                    <input type="hidden" name="action" value="cancel">                                         
                                </c:when>
                                <c:when test="${cancelForm == false}">
                                    <input type="submit" value="Cancel" class="btn btn-secondary btn-block" disabled>            
                                </c:when>            
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-9">
                <div class="card bg-dark text-white">
                    <h1 class="card-header">Manage Users</h1>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Email Address</td>
                                    <th>First Name</td>
                                    <th>Last Name</td>
                                    <th>Role</td>
                                    <th>Edit</td>
                                    <th>Delete</td>
                                </tr>
                            </thead>
                            <c:forEach items="${users}" var="user">
                                <tr class=" text-white">
                                    <td>           
                                        ${user.email}
                                    </td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <c:forEach items="${roles}" var="role">
                                        <c:if test="${role.roleID == user.role}">
                                            <td>${role.roleName}</td>
                                        </c:if>
                                    </c:forEach>
                                    <td>
                                        <form action="User" method="post">
                                            <input type="submit" value="Edit" class="btn btn-warning">
                                            <input type="hidden" name="action" value="editUser">
                                            <input type="hidden" name="key" value=${user.email}>
                                        </form>
                                        <br>            
                                    </td>

                                    <td>
                                        <form action="User" method="post">
                                            <input type="submit" value="Delete"class="btn btn-danger">
                                            <input type="hidden" name="action" value="deleteUser">                        
                                            <input type="hidden" name="key" value=${user.email}>
                                            <br>            
                                        </form>
                                    </td>

                                </tr>
                            </c:forEach>
                        </table>  
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
