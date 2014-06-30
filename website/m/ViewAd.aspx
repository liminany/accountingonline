<%@ Page Title="" Language="C#" MasterPageFile="~/m/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAd.aspx.cs" Inherits="m_ViewAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(document).ready(function () {
            $("#div_Country").css("display", "none");
        });
    </script>
    <div id="containerInner" style="margin-bottom: 12px;">

        <div class="classifiedPost">
            <div class="classifieds-title">
                <span class="viewPagePremiumImage">
                    <img runat="server" src="./images/star.png" border="0"></span>
                <h1 runat="server" id="spAdsTitle"></h1>
            </div>
            <div class="classifieds-optionBlock">
                <div class="classifieds-img">
                    <div style="display: none; margin: 10px; text-align: center; width: 100%; padding-right: 10px;" id="div_Slider" runat="server">
                    </div>
                    <div id="slider_google_ads"></div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="classifieds-desc">
                <h2><font size="+1"><b></b></font></h2>
                <p>
                    Contact permissions:
                                 
                                                                                                                                                                                                                                        <b>Agents/Brokers Can Contact Me</b>
                </p>
                <p>
                    Locality:
                                 
                                                                                                                                                                                                                                        <b>New Town</b>
                </p>
                <p>
                    Type:
                                 
                                                                                                                                                                                                                                        <b>Single Occupancy / Sharing Basis</b>
                </p>
                <p>
                    Accepted:
                                 
                                                                                                                                                                                                                                        <b>Female</b>
                </p>
                <p>
                    Offer/Wanted:
                                 
                                                                                                                                                                                                                                        <b>Offer</b>
                </p>
                <p>
                    Posted by:
                                 
                                                                                                                                                                                                                                        <b>Owner</b>
                </p>
                <p class="showmore" style="display: none;">
                    ** New Fully Furnished Paying Guest / Single &amp; Shared A.C Rooms for Rent - With All Appliances &amp; Lift<br>
                    @ New Town (Behind Hometown) , Kolkata **<br>
                    FOR LADIES<br>
                    <br>
                    CALL - 98311 36315<br>
                    VISIT - http://www.pgkolkata.in/fm<br>
                    <br>
                    Spacious A.C Rooms for rent for Twin Sharing OR Single Occupancy<br>
                    3 Fully Furnished A.C rooms with Beds, Cupboard , Lights, Fan, Curtains<br>
                    High quality Two new bathrooms with Western Toilet , Shower &amp; Geyser.<br>
                    Modular Kitchen with Hob, Chimney, Refrigerator, Micro Oven, Aqua Guard &amp; Gas<br>
                    Convenient location to all amenities.Walk to Reliance Fresh,HomeTown,ATM, Park<br>
                    Sufficient water supply. Hardly any power outage. 5 STAR Rating A.C<br>
                    Well connected by Transport @ New Town. [ Just Behind Home Town, New Town ]<br>
                    Complete Marble Flooring<br>
                    Lift / Elevator present.<br>
                    Minimum stay 6 Months<br>
                    <br>
                    FACILITIES :: Fully Furnished with Appliances<br>
                    <br>
                    A.C Bed Rooms<br>
                    TV with Dish Connection<br>
                    Washing Machine<br>
                    2 Western Toilets<br>
                    Sofa Set &amp; Misc Furniture
                    <br>
                    Refrigerator<br>
                    6 Seater Dining Table<br>
                    Full Marble Flooring
                    <br>
                    Fully Furnished<br>
                    2 Geysers<br>
                    Aqua Guard Water<br>
                    Modular Kitchen<br>
                    Micro Oven
                    <br>
                    Gas Connection
                    <br>
                    Sofa Set &amp; Curtains<br>
                    Hob &amp; Chimney
                    <br>
                    Prepaid Meter
                    <br>
                    Elevator / Lift
                </p>
            </div>
            <div style="font-size: 25px; text-align: center;">
                <a href="~/m/default.aspx" runat="server">رجوع للصفحة الرئيسية</a>
            </div>
        </div>

    </div>
</asp:Content>

