$(function () {

    $("#editFileBtn").click(function () {
        console.log("!!!");
        var a = $("#addFileArea").css("display");
        if (a === "none") {
            $("#addFileArea").css("display", "block");
        }
        else {

            $("#addFileArea").css("display", "none");
        }
    });

    //$("#editBtn").click(function () {
    //    $(".edditTxb").css("display", "inline-block");
    //    $(".edditLb").css("display", "none");
    //})
});

function showCalendar() {
    console.log(Calendar1);//直接引用id也行？？
    Calendar1.style.display = "block";
    Calendar1.style.position = "absolute";
    Calendar1.style.top = startDateTextBox.offsetTop + startDateTextBox.offsetHeight + "px";
    Calendar1.style.left = startDateTextBox.offsetLeft + "px";
}
function showCalendar2() {
    //var cal = document.getElementById("<%= parentContainer.ClientID %>_<%= calDate.ClientID %>");

    var cal = document.getElementById("Calendar2");
    console.log(cal);
    cal.style.display = "block";
    cal.style.position = "absolute";
    cal.style.top = estimateCompletionDateTextBox.offsetTop + estimateCompletionDateTextBox.offsetHeight + "px";
    cal.style.left = estimateCompletionDateTextBox.offsetLeft + "px";
}