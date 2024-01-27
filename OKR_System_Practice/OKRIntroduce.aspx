<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="OKRIntroduce.aspx.cs" Inherits="OKR_System_Practice.OKRIntrduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/OKRIntroduce.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>OKR System首页</h2>
    <hr>
    <div class="groupIntro">
        <div class="content">
            <div>①  关于OKR目標管理系统</div>
            <ul>
                <li>1.显示OKR目标管理的目的、管理方法和操作的概要。</li>
            </ul>
             
         <div>②  通知</div>
            <ul>
                <li><asp:Label ID="deadLineIdLabel" CssClass="edditLb" runat="server"  /></li>
            </ul>
            </div>
    </div>
</asp:Content>
