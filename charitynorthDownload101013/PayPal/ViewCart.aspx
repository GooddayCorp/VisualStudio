<%@ Page Title="Shopping Cart" Language="VB" MasterPageFile="~/GoodDay/MasterPage.master" AutoEventWireup="false" CodeFile="ViewCart.aspx.vb" Inherits="ViewCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
        <div>
        <!-- The GridView to display a list of goods in the current cart -->
            <asp:GridView ID="gvCarts" runat="server" DataSourceID="odsCarts" DataKeyNames="rec_id"
                CellPadding="5" ForeColor="#333333" AutoGenerateColumns="False" 
            ShowFooter="True" Width="631px" BorderColor="Black" BorderStyle="Solid" 
            BorderWidth="1px">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="price" HeaderText="Price, $"/>
                    <asp:BoundField DataField="quantity" HeaderText="Quantity" />
                    <asp:ButtonField CommandName="Delete" ButtonType="Button" Text="Delete" HeaderText="Delete" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#EFF3FB" />
                <EditRowStyle BackColor="#2461BF" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:Panel ID="pnlPayPal" runat="server" Width="100%">
                <asp:ImageButton ImageUrl="./Images/paybutton.gif" runat="server" ID="ibPayPal" />
                <br />
                <asp:Button ID="Button1" runat="server" Text="Continue Shopping" />
            </asp:Panel>
            <!-- The ObjectDataSource to work with the current cart -->
            <asp:ObjectDataSource ID="odsCarts" runat="server" TypeName="KBSoft.Carts" SelectMethod="LoadCart"
                DeleteMethod="Delete">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="1" Name="cart_id" QueryStringField="cart_id"
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="rec_id" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
        </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

