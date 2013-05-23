<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="en">

<jsp:include page="fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="fragments/bodyHeader.jsp"/>
    <h2><fmt:message key="welcome"/></h2>
    <spring:url value="/resources/images/pets.png" htmlEscape="true" var="petsImage"/>
    <img src="${petsImage}"/>

<div>
<h3>Summary of Modifications:</h3>
<p>I built this set of modifications to the Spring Petclinic demo application as a way to demonstrate my skills as a Java web developer.
</p>
<p>The original application can be viewed here: <a href="http://spring-petclinic.cloudfoundry.com">Petclinic on Cloud Foundry</a>
</p>
<p>In the original application, the Veterinarians page is a static list of vets with only two options, an XML view and an Atom RSS feed.  
My enhancement makes the list into a set of live links, each leading to a separate display page, with a further option to edit each record.  
There is also an Add Veterinarian option on the list page.
</p>
<p>For a list of the detailed changes that were required to make this enhancement, please see this page: <a href="<spring:url value="/resources/enhancementDetails.html"/>">Enhancement Details</a>
</p>
</div>


    <jsp:include page="fragments/footer.jsp"/>

</div>
</body>

</html>
