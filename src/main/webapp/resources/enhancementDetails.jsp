<!DOCTYPE html> 

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<html lang="en">

<jsp:include page="fragments/headTag.jsp"/>

<body>
<div class="container">
    <jsp:include page="fragments/bodyHeader.jsp"/>

<div>
<h3>Detailed changes for the Veterinarian enhancement:</h3>
<ul>
<li>Changed title in headTag.jsp</li>
<li>Created createOrUpdateVetForm.jsp</li>
<li>Added link to vetList.jsp for Add Veterinarian</li>
<li>Updated VetController.java to support request mappings to createOrUpdateVetForm.jsp</li>
<li>Added custom request mapping to VetController to support mappings of individual records to vetDetails.jsp</li>
<li>Added attributes to Vet.java</li>
<li>Updated VetRepository to save a Vet</li>
<li>Updated ClinicService to save a Vet</li>
<li>Updated ClinicServiceImpl to save a Vet</li>
<li>Updated repository implementations for jpa and jdbc</li>
<li>Added findById to VetRepository.java</li>
<li>Added findVetById to ClinicService.java and ClinicServiceImpl.java</li>
<li>Added findById to JdbcVetRepositoryImpl.java and JpaVetRepositoryImpl.java</li>
<li>Added a @CacheEvict to the save method to refresh the cache after an add or update of a vet</li>
<li>Added WebDataBinder to VetController.java for security on updates to vets</li>
<li>Added a style to petclinic.css for padding between multiple links at the bottom of the vet list</li>
<li>Applied the pc-table-buttons style to the links at the bottom of vetList.jsp</li>
<li>Added Specialities to findVetById</li>
<li>Added Specialities to vetDetails.jsp</li>
<li>Updated Vet in model to support the specialty type. This is working with the exception of the persistence of any changes to the specialties associated with a veterinarian.  I may do that later, but it will take a bit of code, so I may not.</li>
<li>Added a test for insertVet() to AbstractClinicServiceTests.java</li>
</ul>

</div>
    <jsp:include page="fragments/footer.jsp"/>

</div>
</body>

</html>
