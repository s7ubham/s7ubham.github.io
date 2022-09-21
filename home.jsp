<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<head>
    <script src="js.js"></script>
    <link href="image/ic.JPG" type="icon" rel="icon">
</head>
<body >
    <link rel="stylesheet" href="styles.css" >
    <div id="1" class="first" style="width: 100%;padding: 0%;margin-top: 25px;border: none;height: fit-content;"> 
        
        <div id="1a" style="margin-left: 95px;margin-right: 125px;border: none;padding: 0%;">
            
            <a href="home.jsp">
            <img src="image/LOGO.png"  height="75PX" style="padding: 0%;margin: 0%;">
            </a>
        </div>
        
        <div id="1b" style="  border-radius: 5% ; border-width: 2px;border-style:solid ;margin-left: 90px;margin-right: 125px;margin-top: 16px;">
            <input type="search" name="search bar" placeholder="Enter stocks" style="height: 38px;width: 300px ;vertical-align: top;border: none;">
            <button type="submit" style="background-color:#0769e0; padding: 0%;margin: 0%;float: right;width: fit-content;height: 38px;border-radius: 5%;">
            <span style="font-size: 22px;color: white;">Search</span>
            </button>
            
            
                
                
        </div>
        <div id="1c" style="margin-left: 125px;margin-right: 125px;;vertical-align: top;margin-top: 17.5px;border: none;">

            <a href="welcome.jsp">
                <button type="button" name="Account" style="border-radius: 5%;background-color:#0769e0 ; height: 38px;width: fit-content;vertical-align: top; ">    
                    <span style="font-size: 22px;color: white;">Account</span>
                </button>
            </a>
        </div>
    </div>
    <div style="margin-top: 100px;margin-left: 95px; height: 750px;margin-right: 85px;border: none;">
        <div style="height: inherit; width: 600px;display: inline-block;border: none;margin-top: 50px;">
            <div>
                <h1 style="display: inline-block;margin-left: 15px;"><span style="margin-left: 20px;">Invest Today in</span></h1>
                <div class="slidingvertical" style="display: inline-block;margin-top: 23px;border: none;">
                    <span style="color:brown;" >Stocks</span>
                    <span style="color: coral;">IPO</span>
                    <span style="color:seagreen;">Vote</span>
                    <span style="color: rgb(153, 88, 190);">Automate</span>
                </div>
            </div>
            <div style="align-items: center;">
                <img src="image/image.png" alt="" height="300px" width=300px style="display: inline-block;">
                <a href="register.jsp">
                    <button style="height: fit-content;width: fit-content;display: inline-block;margin-top: 100px;margin-left: 25px; vertical-align: top;background-color:#0769e0 ;">
                        <span style="color: white;">Begin</span>
                    </button>
                </a>
                
            </div>
        </div>
        <div style="height:fit-content;width: fit-content;display: inline-block;float:right;border: none;">
            <div style="height: fit-content;padding: 0%;margin: 0%;border-radius: 0%;border: none;">
                <div style="display: inline-block;height: fit-content;width: fit-content;border: none;">
                    <a href="stocks.jsp">
                        <img class="xxx" id="10" src="image/StocksO.png" alt="" height="300" width="300" style="border-radius: 10% ; " >
                    </a>
                </div>
                <div  style="display: inline-block;height:fit-content;width: fit-content;float:right;border: none;">
                    <a  href="ipo.jsp">
                        <img class="xxx" id="11" src="image/IPOO.png" alt="" height="300" width="300" style="border-radius: 10% ; " >
                    </a>
                </div>
            </div>
            <div style="height: fit-content;padding: 0%;margin: 0%;border-radius: 0%;border: none;">
                <div  style="display: inline-block;height: fit-content;width: fit-content;border: none;">
                    <a  href="vote.jsp">
                        <img class="xxx" id="12" src="image/VoteO.png" alt="" height="300" width="300" style="border-radius: 10% ; "  >
                    </a>
                </div>
                <div  style="display: inline-block;height:fit-content;width: fit-content;float:right;border: none;">
                    <a  >
                        <img  class="xxx" id="13" src="image/AutomateO.png" alt="" height="300" width="300" style="border-radius: 10% ; " >
                    </a>
                </div>
            </div>
        </div>
    </div>
    </body>