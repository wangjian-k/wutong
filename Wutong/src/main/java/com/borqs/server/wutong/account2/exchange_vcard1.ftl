<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>加邀请者为好友</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <META content="MSHTML 5.50.4613.1700" name=GENERATOR>
    <META name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=2.0">

    <link rel="stylesheet"  href="http://${host}/invite_files/jquerymobile/jquery.mobile-1.0rc2.min.css" />
    <script src="http://${host}/invite_files/jquerymobile/jquery-1.6.4.min.js"></script>
    <script src="http://${host}/invite_files/jquerymobile/jquery.mobile-1.0rc2.min.js"></script>

    <script type=text/javascript>
        var keyStr = "ABCDEFGHIJKLMNOP" +
                "QRSTUVWXYZabcdef" +
                "ghijklmnopqrstuv" +
                "wxyz0123456789+/" +
                "=";

        function encode64(input)
        {
            input = escape(input);
            var output = "";
            var chr1, chr2, chr3 = "";
            var enc1, enc2, enc3, enc4 = "";
            var i = 0;

            do
            {
                chr1 = input.charCodeAt(i++);
                chr2 = input.charCodeAt(i++);
                chr3 = input.charCodeAt(i++);

                enc1 = chr1 >> 2;
                enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                enc4 = chr3 & 63;

                if (isNaN(chr2))
                {
                    enc3 = enc4 = 64;
                }
                else if (isNaN(chr3))
                {
                    enc4 = 64;
                }

                output = output +
                        keyStr.charAt(enc1) +
                        keyStr.charAt(enc2) +
                        keyStr.charAt(enc3) +
                        keyStr.charAt(enc4);
                chr1 = chr2 = chr3 = "";
                enc1 = enc2 = enc3 = enc4 = "";
            } while (i < input.length);

            return output;
        }

        function download()
        {
            document.location = "http://${host}/search?q=com.borqs.qiupu";
        }

        function mutualFriend()
        {
            var uid = document.form1.uid.value;
            var fromid = document.form1.fromid.value;

            document.location = "http://${host}/friend/mutual?user_id=" + uid
                    + "&from_id=" + fromid;
        }
    </script>
</head>
<body style="overflow-x:hidden; background:#fff; color:#000; font-size:18px;  width:320px; margin:auto;">
<form name="form1" action="" method="post" onsubmit="return false">
    <input type="hidden" name="fromid" value="${fromId}" />
    <input type="hidden" name="uid" value="${uid}" />
    <table cellpadding=1 cellspacing=1 border=0 align=left>
        <tr>
            <td>
                <table cellpadding=1 cellspacing=1 border=0 align=left name="t1">
                    <tr>
                        <td align=center valign="bottom">
                            <img border=0 src="http://${host}/invite_files/images/logo.jpg"></td>
                        </td>
                    </tr>
                    <tr>
                        <td align=left valign=top>尊敬的${name0}：<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${fromName}
                        <#assign isFriend = isFriend?number>
                        <#if isFriend == 0>
                            希望和您交换名片。
                        <#else>
                            邀请您使用播思服务(梧桐)。
                        </#if>
                        </td>
                    </tr>
                    <tr>
                        <td align=left valign=top colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding=1 cellspacing=1 border=0 align=left name="t2">
                    <tr>
                    <#assign isFriend = isFriend?number>
                    <#if isFriend == 0>
                        <td align=center valign=top>
                            <input value="交换名片" ID="button"  type="button" name="addBtn" onclick="mutualFriend()">
                        </td>
                    </#if>
                        <td align=center valign=top>
                            <input value="下    载" ID="button"  type="button" name="downBtn" onclick="download()">
                        </td>
                    </tr>
                    <tr>
                        <td align=left valign=top colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellpadding=1 cellspacing=1 border=0 align=left>
                    <tr>
                        <td align=left valign=top colspan=2>激活播思账号后，您可以免费使用播思账号为您提供的应用和便捷的服务。和对方交换名片后，您可以即时获取对方信息变化的更新，实时了解对方动态，沟通更方便。现在就赶快<span style="cursor:hand" onclick="download()"><U><font color=#0000ff>下载</font></U></span>体验吧！
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align=left valign=top colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
        <tr>
            <td align=center valign=top colspan=2>© 2007-2012 Borqs 版权所有</td>
        </tr>
    </table>
</form>
</body>
</html>