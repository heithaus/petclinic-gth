<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>

<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>

    <h2>Veterinarian Information</h2>

    <table class="table table-striped" style="width:600px;">
        <tr>
            <th>Name</th>
            <td><b><c:out value="${vet.firstName} ${vet.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><c:out value="${vet.address}"/></td>
        </tr>
        <tr>
            <th>City</th>
            <td><c:out value="${vet.city}"/></td>
        </tr>
        <tr>
            <th>State</th>
            <td><c:out value="${vet.state}"/></td>
        </tr>
        <tr>
            <th>Zip</th>
            <td><c:out value="${vet.zip}"/></td>
        </tr>
        <tr>
            <th>Telephone</th>
            <td><c:out value="${vet.telephone}"/></td>
        </tr>        
        
		<tr>
            <th>Specialties</th>
            <td>		
            	<c:forEach var="specialty" items="${vet.specialties}">
                	<c:out value="${specialty.name}"/>
            	</c:forEach>
            	<c:if test="${vet.nrOfSpecialties == 0}">none</c:if>
            </td>
		</tr>
		<tr>
            <td> 
            	<spring:url value="{vetId}/edit.html" var="editUrl">
                    <spring:param name="vetId" value="${vet.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(editUrl)}" class="btn btn-info">Edit Veterinarian</a></td>
        </tr>
    </table>

    <jsp:include page="../fragments/footer.jsp"/>

</div>

</body>

</html>
