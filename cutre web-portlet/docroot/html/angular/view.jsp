<%
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * The contents of this file are subject to the terms of the Liferay Enterprise
 * Subscription License ("License"). You may not use this file except in
 * compliance with the License. You can obtain a copy of the License by
 * contacting Liferay, Inc. See the License for the specific language governing
 * permissions and limitations under the License, including but not limited to
 * distribution rights of the Software.
 *
 *
 *
 */
%>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.0/angular-route.min.js"></script>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.css" />

<portlet:defineObjects />
<liferay-theme:defineObjects />

<portlet:resourceURL var="template1">
	<portlet:param name="id" value="/html/angular/home"/>
</portlet:resourceURL>

<portlet:resourceURL var="template2">
	<portlet:param name="id" value="/html/angular/about"/>
</portlet:resourceURL>

<portlet:resourceURL var="template3">
	<portlet:param name="id" value="/html/angular/contact"/>
</portlet:resourceURL>

<div id="<portlet:namespace/>">
	<div data-ng-controller="RouteController<portlet:namespace/>">
		<nav class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="/"><i class="fa fa-usd fa-2x"></i>&nbsp; Pruebas en Angular</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#<portlet:namespace/>"><i class="fa fa-home"></i> Home</a></li>
                    <li><a href="#about<portlet:namespace/>"><i class="fa fa-shield"></i> About</a></li>
                    <li><a href="#contact<portlet:namespace/>"><i class="fa fa-comment"></i> Contact</a></li>
                </ul>
            </div>
		</nav>
	<!--  
	<a href="#/route1<portlet:namespace/>">Route 1</a> &nbsp;
	<a href="#/route2<portlet:namespace/>">Route 2</a> &nbsp;
	-->
	<div data-ng-view></div>
	</div>
</div>


<script>
    var <portlet:namespace/>module = angular.module("sampleApp<portlet:namespace/>", ['ngRoute']);
    <portlet:namespace/>module.config(['$routeProvider','$locationProvider',
        function($routeProvider,$locationProvider) {
	    	$routeProvider
	        .when('/<portlet:namespace/>', {                    
                templateUrl: '${template1}',
                controller: 'RouteController<portlet:namespace/>'
            })
            .when('/about<portlet:namespace/>', {
                templateUrl: '${template2}',
                controller: 'RouteController<portlet:namespace/>'
            })
            .when('/contact<portlet:namespace/>', {
	            templateUrl: '${template3}',
	            controller: 'RouteController<portlet:namespace/>'
       		});
	    	//$locationProvider.html5Mode(true);
      }]);

    <portlet:namespace/>module.controller("RouteController<portlet:namespace/>", function($scope) {
 		
    });
    
 
  <portlet:namespace/>module.run(['$rootScope', '$location','$route',
                function ($rootScope, $location,$route) {                   
                    $rootScope.$on('$locationChangeSuccess', function (event, next, current) {                     	
                   	
                   	 var result= <portlet:namespace/>isValidURL($location.path());           	 
                    	if(!result){                    		
                    		$route.current=current;             		 
                    	}  
                              
                    });

            }]);             
   
    function  <portlet:namespace/>isValidURL(nextURL){
    	var isValidURL=false;
    	var validURL = ["/<portlet:namespace/>","/about<portlet:namespace/>","/contact<portlet:namespace/>"];
    	for (var urlIndex=0; urlIndex<validURL.length;urlIndex++) {    		
            if (nextURL.indexOf(validURL[urlIndex])!=-1){        	
            	isValidURL=true;
            }
        }
    	return isValidURL;
    }  
    //alert("Se ejecutará bootstrap");
    angular.bootstrap(document.getElementById("<portlet:namespace/>"), ['sampleApp<portlet:namespace/>']);
    
</script>
