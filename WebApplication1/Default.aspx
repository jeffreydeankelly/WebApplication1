<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Upload Insurance Invoice
    </h2>
    <asp:Panel ID="pnlHeader" runat="server" Visible="True" CssClass="RDIModalPopup">

        <div class="DetailResults">
        <h2 class="RDIBasicHeader">Insurance Invoice Header - <asp:Label ID="lblStatus" runat="server" /></h2>
        <table border="1">
            <tr>
                <td align="center">
                    <asp:DropDownList ID="ddlVendor" runat="server" CssClass="RDIDropDownList">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="218">Premeria Blue Cross Blue Shld AK</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlVendor" 
                        ErrorMessage="**Vendor is required" CssClass="RDIValidator" Display="Dynamic" InitialValue="" />  
                </td>
                <td align="center">
                    <asp:TextBox ID="txtInvoiceNumber" runat="server" CssClass="RDITextInput"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtInvoiceNumber" 
                        ErrorMessage="**Invoice Number is required" CssClass="RDIValidator" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td align="center" class="RDILabel">Vendor</td>
                <td align="center" class="RDILabel">Invoice Number</td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td align="center">
                    <asp:TextBox ID="txtInvoicePeriodBegin" runat="server" CssClass="RDITextBox"/>
<%--                    <asp:ImageButton ID="ibNextContactDateCalendar" runat="server" CausesValidation="false"
                        ImageUrl="~/ProjectTrack/images/icon_calendar.gif" />
                    <ajax:CalendarExtender ID="calExNextContactDate" runat="server" TargetControlID="txtInvoicePeriodBegin"
                        PopupButtonID="ibNextContactDateCalendar" />
--%>                </td>                                
                <td align="center">
                    <asp:TextBox ID="txtInvoicePeriodEnd" runat="server" CssClass="RDITextBox"/>
<%--                    <asp:ImageButton ID="ibNextContactDateCalendar" runat="server" CausesValidation="false"
                        ImageUrl="~/ProjectTrack/images/icon_calendar.gif" />
                    <ajax:CalendarExtender ID="calExNextContactDate" runat="server" TargetControlID="txtInvoicePeriodBegin"
                        PopupButtonID="ibNextContactDateCalendar" />
--%>                </td>                                
                <td align="center">
                    <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="RDITextBox"/>
<%--                    <asp:ImageButton ID="ibNextContactDateCalendar" runat="server" CausesValidation="false"
                        ImageUrl="~/ProjectTrack/images/icon_calendar.gif" />
                    <ajax:CalendarExtender ID="calExNextContactDate" runat="server" TargetControlID="txtInvoicePeriodBegin"
                        PopupButtonID="ibNextContactDateCalendar" />
--%>                </td>
            </tr>                              
            <tr>
                <td align="center" class="RDILabel">Invoice Period Begin</td>
                <td align="center" class="RDILabel">Invoice Period End</td>
                <td align="center" class="RDILabel">Invoice Date</td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td align="center">
                    $
                    <asp:TextBox ID="txtDueFromPrevInvoice" runat="server" CssClass="RDITextInput" 
                        MaxLength="10" Width="50" />
                    <asp:RequiredFieldValidator ID="rfvEmployeeCost" runat="server" ControlToValidate="txtDueFromPrevInvoice" 
                        ErrorMessage="**Employee cost is required" Display="Dynamic" CssClass="RDIValidator" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtDueFromPrevInvoice"
                        ErrorMessage="**Invalid dollar amount" Display="Dynamic" ValidationExpression="^(-)?\d+(\.\d\d)?$" CssClass="RDIValidator" />
                </td>
                <td align="center">
                    $
                    <asp:TextBox ID="txtCreditsSincePrevInvoice" runat="server" CssClass="RDITextInput" 
                        MaxLength="10" Width="50" />
                    <asp:RequiredFieldValidator ID="rfvRDIHSAContribution" runat="server" ControlToValidate="txtCreditsSincePrevInvoice" 
                        ErrorMessage="**RDI HSA Contribution amount is required" CssClass="RDIValidator" />
                    <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtCreditsSincePrevInvoice"
                        ErrorMessage="**Invalid dollar amount" CssClass="RDIValidator" ValidationExpression="^(-)?\d+(\.\d\d)?$" />
                </td>
                <td align="center">
                    $
                    <asp:TextBox ID="txtTotalAmountDue" runat="server" CssClass="RDITextInput" 
                        MaxLength="10" Width="50" />
                    <asp:RequiredFieldValidator ID="rfvFringeBenefit" runat="server" ControlToValidate="txtTotalAmountDue" 
                        ErrorMessage="**Fringe benefit amount is required" CssClass="RDIValidator" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="txtTotalAmountDue"
                        ErrorMessage="**Invalid dollar amount" CssClass="RDIValidator" ValidationExpression="^(-)?\d+(\.\d\d)?$" />
                </td>
            </tr>
            <tr>
                <td  align="center" class="RDILabel">Balance Due From Prev Invoice</td>
                <td  align="center" class="RDILabel">Credits Posted Since Prev Invoice</td>
                <td  align="center" class="RDILabel">Total Amount Due</td>
            </tr>
            <tr>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <input type="file" id="FileSelect"  name="FileSelect"  runat="server" />
                    <asp:Button runat="server" id="FileUpload" text="Upload" onclick="FileUpload_ServerClick"  CausesValidation="false" />
                </td>
            </tr>
        </table>
        </div>
    </asp:Panel>
</asp:Content>
