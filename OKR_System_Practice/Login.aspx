<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OKR_System_Practice.Login" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> -->
    <script src="js/Jquery172.js"></script>

    <script>
        function validateForm() {
            var username = $("#username").val().trim();
            var password = $("#password").val().trim();
            var usernameError = $("#usernameError");
            var passwordError = $("#passwordError");
            var isValid = true;
            if (username === "") {
                usernameError.html("请输入用户名!");
                isValid = false;
            } else {
                usernameError.html("");
            }
            if (password === "") {
                passwordError.html("请输入密码");
                isValid = false;
            } else {
                passwordError.html("");
            }
            return isValid;
        }

        $(document).ready(function () {
            $(".loginBtn").click(function (event) {
                //event.preventDefault(); // 阻止表单提交事件默认行为
                var isValid = validateForm();
                if (isValid) {
                    // 如果表单验证通过，则提交表单
                    $("form").submit();
                }
            });
        });
    </script>
    <link rel="stylesheet" href="css/login.css">
    <style>
		</style>
</head>

<body >
    <div >
        <form action="#" method="post"  runat="server" onsubmit="return validateForm()">
            <span id="tittle_1">LOGIN</span>
            <span id="tittle_2">OKR System</span>
            <div>
                <label for="username">ID/Email:</label>
                <input type="text" id="username" name="username" runat="server" >
                <span id="usernameError" class="error"></span>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" runat="server">
                <span id="passwordError" class="error"></span>
            </div>
            <span id="otherError" class="otherError"></span>
            <asp:Button ID="Button" CssClass="loginBtn" runat="server" Text="Login" OnClick="Button_Click" />
            <div>
        </div>
    </form>
   </div>
</body>
</html>

