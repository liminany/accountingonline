<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAds1.aspx.cs" Inherits="m_ViewAds" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        div {
            text-align: right;
            color: #333;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .container {
            width: 100%;
            margin-left: 2%;
            margin-right: 2%;
            background: #e0e0e0;
            margin: 0px;
            padding: 0px;
        }

            .container div {
                width: 98%;
                padding-right:2%;
            }

        .title {
            text-align: center;
            background: #f7941c;
            color: #fafafa;
            font-size: 1.2em;
        }

        .logo
        {
            background:#FFF;
            text-align:center;
        }

         .logo img
         {
             max-width:100%;
         }

        .subtitle {
            background: #f2f4f3;
            font-size: 1.05em;
        }


        .details {
            background: #FFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="logo">
                <a href="http://www.arabisky.com">
                    <img src="http://www.arabisky.com/images/ArabiSkyLogo.png" />
                </a>
                </div>
            <div class="title">
                العقارات والإسكان
            </div>
            <div class="subtitle">
                شقق سوبر ديلوكس للبيع في القويسمة..مساحات مختلفة..32000دينار
            </div>
            <div class="title">
                السعر
            </div>
            <div class="details">
                عشر ليرات
            </div>

            <div class="title">
                التفاصيل
            </div>
            <div class="details">
                شقق سوبر ديلوكس للبيع في القويسمة ..مساحات مختلفة..أراضي سيراميك..أباجورات كهربائبة..قرب المدارس ومقابل المسجد..تبدأ الأسعار من 32000دينار ..للمراجعة : 0797456943 /0788837769 المهندس أبو العبد
            </div>
            <div class="title">
                العنوان
            </div>
            <div class="details">
                النهارية مقابل مسجد الريحان - عمان - الأردن
            </div>
        </div>
    </form>
</body>
</html>
