<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<html lang="en">

<jsp:include page="../fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="../fragments/bodyHeader.jsp"/>
    <c:choose>
        <c:when test="${vet['new']}"><c:set var="method" value="post"/></c:when>
        <c:otherwise><c:set var="method" value="put"/></c:otherwise>
    </c:choose>

    <h2>
        <c:if test="${vet['new']}">New </c:if> Veterinarian
    </h2>
    <form:form modelAttribute="vet" method="${method}" class="form-horizontal" id="add-vet-form">
        <petclinic:inputField label="First Name" name="firstName"/>
        <petclinic:inputField label="Last Name" name="lastName"/>
        <petclinic:inputField label="Address" name="address"/>
        <petclinic:inputField label="City" name="city"/>
        <petclinic:inputField label="State" name="state"/>
        <petclinic:inputField label="Zip" name="zip"/>
        <petclinic:inputField label="Telephone" name="telephone"/>  
        <div class="control-group">
            <label class="control-label">Specialties</label>
            <form:select path="specialties">
			<form:options items="${specialties}" itemValue="Id" itemLabel="Name" size="3" />
            </form:select>
        </div>

        <div class="form-actions">
            <c:choose>
                <c:when test="${vet['new']}">
                    <button type="submit">Add Veterinarian</button>
                </c:when>
                <c:otherwise>
                    <button type="submit">Update Veterinarian</button>
                </c:otherwise>
            </c:choose>
        </div>
    </form:form>
</div>
<jsp:include page="../fragments/footer.jsp"/>
</body>

</html>
