<%@ Page Title="" Language="C#" MasterPageFile="~/OKRMain.Master" AutoEventWireup="true" CodeBehind="OKRIntroduce.aspx.cs" Inherits="OKR_System_Practice.OKRIntrduce" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/OKRIntroduce.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>OKR System とは</h2>
    <hr>
    <div class="groupIntro">
        <div class="content">
            <div>①  OKR目標管理について</div>
            <ul>
                <li>1.OKR目標管理の目的や管理の仕方や操作の概要を示す。
                </li>
            </ul>


            <div>②  OKRグループ管理</div>
            <ul>
                <li>1.目標管理をするグループを管理します。

                </li>
                <li>2.目標管理システムの「OKRグループ管理」を押下すると、OKRグループ管理一覧表を表示する。
                </li>
            </ul>



            <div>③  OKRユーザー管理</div>
            <ul>
                <li>1.目標管理をするユーザーを管理します。

                </li>
                <li>2.目標管理システムの「OKRユーザー管理」を押下すると、OKRユーザー管理一覧表を表示する。	
                </li>
            </ul>
        </div>


    </div>
</asp:Content>
