*** Settings ***
Resource            ../resources/keywords.robot
Suite Setup          Setup Browser
Suite Teardown       End suite



*** Test Cases ***

Kion_Test      	   
	Appstate       	Linde Business   
	ClickText      	Login as Admin  
 TypeText       	Emailaddress   maaritest1@gmail.com
	TypeText       	Password   maari@1       	   
	ClickText      	Login                            
	ClickText      	Installation Report          
