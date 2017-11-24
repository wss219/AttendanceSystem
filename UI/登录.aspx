﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="登录.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
     body
     {
         margin:0px;
         padding:0px;
         background-image:url("loginimages/网页搭建/beijing2.jpg");
         background-size:100%;  
         background-repeat:no-repeat;
     }


     #xiaohuiimage
     {
         width:240px;
         }
     
     table,table tr,table tr td,table tr th{
	        border:0px solid white;
	        border-collapse:collapse;
	        }
	 table{
	        margin:0 auto;
	        margin-top:0px;
	        height:120px;
	        border-radius:30px;
	        background-color:rgba(0,0,0,0.05);
            }
	 table td
	 {
	     height:100px;
	     font-weight:bolder;
	     }
	  #tr1td1
	  {
	      width:100px;
	      text-align:center;
	      }
	  #tr2td1
	  {
	      width:100px;
	      }
	  #tr2td2
	  {
	      width:400px;
	      }
	 table tr td ul
	 {
	     list-style-type:none;
	     line-height:40px;
	     }
	 h1
      {
          margin:0 auto;
          }
	 h2
	  {
	      text-align:left;
	      color:blue;
	      }
	  span
	  {
	      font-size:20px;
	      }
	 .span1
	 {
	     letter-spacing:20px;
	     margin-right:-20px;
	    }
     #txtUserID
     {
         width:200px;
         height:22px;
         }
      #txtUserPWD
     {
         width:200px;
         height:22px;
         }
     #txtUserID:hover,#txtUserPWD:hover,#txtCode:hover
     {
         border:1px solid blue;
         }
      #loginbtn
      {
          text-align:center;
          }
     #btnlogin
     {
         font-size:16px;
         background-color:#ee848e;
         border:0px;
         border-radius:3px;
         letter-spacing:40px;
         padding-left:45px;
         width:185px;
         height:27px;
         margin:auto;
         text-align:center;    
         } 
      #btnlogin:hover
      {
          background-color:#f06d7a;
          }
     #labCode
     {
         margin-right:-5px;
         }
     #imgCode
     {
         margin-bottom:-10px;
         width：85px;
         height:25px;
         }
       #flash
       {
           width:100%;
           height:200px;
           }
    </style>
   
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
    <embed src="loginimages\script\59.swf" wmode="transparent" id="flash"></embed>
    <table> 
        <tr>
            <td colspan="2" id="tr1td1">
                 <h1><image src="loginimages/网页搭建/font.png"></image></h1>
            </td>
        </tr>
        <tr>
            <td id="tr2td1"><image src="loginimages/网页搭建/xiaohui1.png" id="xiaohuiimage"></td>
            <td id="tr2td2">
                <ul>
                    <li>
                        <h2><image src="loginimages/网页搭建/yhfont.png"></image></h2>
                    </li>
                    <li>
                        <span class="span1">账号</span><span>：</span><asp:TextBox ID="txtUserID" 
                            runat="server" AutoCompleteType="Disabled" BorderWidth="1px"></asp:TextBox>
                        
                    </li>
                    <li>
                        <span class="span1">密码</span><span>：</span><asp:TextBox ID="txtUserPWD" 
                            runat="server" TextMode="Password" AutoCompleteType="Disabled" 
                            BorderWidth="1px"></asp:TextBox>
                        
                    </li>
                    <li>
                        <span>验证码：</span><asp:TextBox ID="txtCode" runat="server" Height="21px" 
                            Width="108px" AutoCompleteType="Disabled" style="margin-left: 0px" 
                            BorderWidth="1px"></asp:TextBox>   
                        <asp:Image ID="imgCode" src="验证码.aspx" runat="server" alt="验证字符"  
                            onclick="this.src=this.src+'?'"/>
               
                    </li>
                    <li id="loginbtn">
                        <asp:Button ID="btnlogin" runat="server"  Text="登录" Font-Bold="True" onclick="btnlogin_Click" />
                    </li>
                    <li>
                        
                        <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                        
                    </li>
                </ul>
            </td>            
        </tr>
       
    </table>
   
    
    </div>
    </form>
</body>
</html>
