<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>生成测试牌型</title>
<%--    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
    <script src="../js/jquery-3.3.1.min.js"></script>
    <style>
        img:hover{
            background: palegreen;
        }
        #sel div:hover{
            border: 1px solid palegreen;
        }
    </style>
</head>

<body>
<div id="sel">
    <div style="height: 60px; line-height: 60px; font-size: 16px;"><span style="float: left;margin-right: 20px;">玩家一</span><span name="screen" style="float: left;"></span></div>
    <div style="height: 60px; line-height: 60px; font-size: 16px;"><span style="float: left;margin-right: 20px;">玩家二</span><span name="screen" style="float: left;"></span></div>
    <div style="height: 60px; line-height: 60px; font-size: 16px;"><span style="float: left;margin-right: 20px;">玩家三</span><span name="screen" style="float: left;"></span></div>
    <div style="height: 60px; line-height: 60px; font-size: 16px;"><span style="float: left;margin-right: 20px;">玩家四</span><span name="screen" style="float: left;"></span></div>
    <div style="height: 60px; line-height: 60px; font-size: 16px;"><span style="float: left;margin-right: 20px;">other</span><span name="other" style="float: left;"></span></div>
</div>
<hr />
<div>
    <span id="rest"></span>
</div>
<div><button id="copy">生成牌型</button></div>
<input id="hide" type="text" style="border:none;outline:none;caret-color: transparent;background-color: rgba(0, 0, 0, 0);">
</body>
<script>
    $(function () {
        var input = "";
        var color = "rgb(152, 251, 152)", //要变的颜色
            trans = "rgb(0, 0, 0, 0)"; //透明（原来的背景色)
        // var mahjong = "1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9," +
        //     "11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14,15,15,15,15,16,16,16,16,17,17,17,17,17,18,18,18,18,19,19,19,19," +
        //     "21,21,21,21,22,22,22,22,23,23,23,23,24,24,24,24,25,25,25,25,26,26,26,26,27,27,27,27,28,28,28,28,29,29,29,29," +
        //     "31,31,31,31,41,41,41,41,51,51,51,51,61,61,61,61,71,71,71,71,81,81,81,81,91,91,91,91"
        // var mahjong = "1,2,3,4,5,6,7,8,9,1,2,41,31,\n" +
        //     "11,12,13,26,15,16,91,61,51,31,71,81,41,\n" +
        //     "22,21,23,21,23,26,26,26,3,2,51,51,1,\n" +
        //     "22,21,22,24,25,26,27,28,29,22,23,51,\n" +
        //     "51,26,26,26,26,81,91,11,21,23,24,11,\n" +
        //     "1,2,3,4,51,41,31,61,71,81,91,11,21,23,\n" +
        //     "24,11,1,2,3,4,22,3,4,51,41,31,61,71,81,\n" +
        //     "91,11,21,23,24,11,1,2,3,4,22"

        var mahjong = "1,1,1,2,2,2,3,3,3,4,4,4,5,\n" +
            "11,11,12,12,13,13,14,14,15,15,16,16,17,\n" +
            "21,21,21,21,22,22,23,23,24,24,25,25,26,\n" +
            "11,12,13,14,15,16,17,31,41,51,61,71,81,\n" +
            "91,1,2,26,3,4,5,5,6,6,17,6,6,5,7,7,7,7,8,8,8,8,9,9,9,9,11,12,13,14,15,16,17,18,18,18,18,19,19,19,19,22,22,23,23,24,24,25,25,26,26,27,27,27,27,28,28,28,28,29,29,29,29,\n" +
            "31,31,31,41,41,41,51,51,51,61,61,61,71,71,71,81,81,81,91,91,91"
        var mahjongs = mahjong.split(",")
        for (var s in mahjongs){
            var html = "<img src='../png/"+mahjongs[s]+".png' id='"+s+"' width='40' height='55' style='margin:2px 2px 2px 2px;'>"
            $("#rest").append(html)
        }
        $("#rest").on('dblclick','img',function (){
            var slen = $("[name='select']").length;
            if (slen==0){
                alert("还没选择玩家");
                return;
            }
            var imgs = $("[name='select']").find("[name='screen']").find("img").length;
            if (imgs>=13){
                alert("请选择其他玩家");
                return;
            }
            var id = $(this).attr("id");
            $(this).remove();
            var html = "<img src='../png/"+mahjongs[id]+".png' id='"+id+"' width='40' height='55' style='margin:2px 2px 2px 2px;'>"
            if ($("[name='select']").find("[name='other']").length==1){
                $("[name='select']").find("[name='other']").append(html);
            } else{
                $("[name='select']").find("[name='screen']").append(html);
            }
        });
        $("#sel").on('dblclick','img',function (){
            var id = $(this).attr("id");
            $(this).remove();
            var html = "<img src='../png/"+mahjongs[id]+".png' id='"+id+"' width='40' height='55' style='margin:2px 2px 2px 2px;'>"
            $("#rest").append(html);
        });
        $("#sel div").click(function () {
            $("#sel div").removeAttr("name");
            $("#sel div").css("background-color", trans);
            $(this).css("background-color", color);
            $(this).attr("name","select");
        });
        $("#copy").click(function () {
            var copy = ""
            $("img").each(function () {
                copy+=","+mahjongs[$(this).attr("id")];
            });
            copy = copy.substr(1);
            $("#hide").val(copy);
            $("#hide").select();
            document.execCommand("Copy")
            alert("复制成功")
            $("#hide").val("");
        });
    })
</script>
</html>