<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
	<title>Multiplex List</title>

	   <!-- reference our style sheet -->
	       <!-- Required meta tags -->
           <meta charset="utf-8">
           <meta name="viewport" content="width=device-width, initial-scale=1">

           <!-- Bootstrap CSS -->
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">



</head>

<body>
<div class="jumbotron">
    <br>
        <div class="container">
            <div class="header">
                <h2>Multiplex List</h2>
            </div>
        </div>
    <br>
        <div class="container">
            <div class="content">

                    <button onclick="window.location.href='showFormForAddMultiplex'; return false;"
                           class="btn btn-info btn-lg" data-toggle="tooltip" title="add multiplex">
                           Add Multiplex</button>

                    <br>
                    <br>

                    <table class="table table-bordered table-striped table-hover">
                    <thead class="thead-dark">
                        <tr class="table-primary">
                            <th>Multiplex Name</th>
                            <th>Multiplex Rating</th>
                            <th>Multiplex Location</th>
                            <th>Movies</th>
                            <th>Action</th>
                       <!-- <th>Visit</th> -->
                        </tr>
                    </thead>

                        <c:forEach var="tempMultiplex" items="${multiplex}">

                             <c:url var="updateLink" value="/multiplex/showFormForMultiplexUpdate">
                                <c:param name="multiplex_id" value="${tempMultiplex.idMultiplex}" />
                             </c:url>

                              <c:url var="deleteLink" value="/multiplex/deleteMultiplex">
                                <c:param name="multiplex_id" value="${tempMultiplex.idMultiplex}" />
                              </c:url>

                             <!--   <c:url var="visitLink" value="/multiplex/visitMovies">
                                  <c:param name="multiplex_id" value="${tempMultiplex.idMultiplex}" />
                                </c:url> -->


                            <tr>
                                <td> ${tempMultiplex.multiplexName} </td>
                                <td> ${tempMultiplex.multiplexRating} </td>
                                <td>
                               ${tempMultiplex.multiplexLocation} </td>
                                <td>
                                <c:forEach var="temp" items="${tempMultiplex.movieList}">
                                        <li> ${temp.movieTitle} </li>
                                </c:forEach>
                                </td>
                             <!--   <td> ${tempMultiplex.movieList} </td> -->
                                <td>
                                    <a href="${updateLink}" class="btn btn-success btn-sm"
                                    data-toggle="tooltip" title="update">Update</a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="${deleteLink}" class="btn btn-danger btn-sm"
                                    data-toggle="tooltip" title="delete"
                                    onclick="if (!(confirm('Are you sure you want to delete this multiplex?'))) return false">
                                    Delete</a>
                                </td>
                           <!--     <td>
                                    <a data-toggle="tooltip" title="visit" class="btn btn-info btn-sm"
                                    href="${visitLink}">
                                    visit</a>
                                </td>  -->
                            </tr>

                        </c:forEach>

                    </table>

            </div>
                    <button onclick="window.location.href='backToHome'; return false;"
                           class="btn btn-info btn-lg" data-toggle="tooltip" title="back">
                           back</button>
           </div>
    </div>
</body>

</html>









