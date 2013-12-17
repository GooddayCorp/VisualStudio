<%@ Page Title="Shopping" Language="VB" MasterPageFile="~/GoodDay/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<%@ Import Namespace="KBSoft" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
        <div>
            <table>
                <tr>
                    <td>
                    <!-- choosing an identifier of the cart where goods will be added -->
                        <span tabindex="0">Select Cart ID:</span>&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlCartID" runat="server" Width="50" AutoPostBack="true">
                            <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>
                  &nbsp;
                  <asp:Label ID="Label1" runat="server"></asp:Label>   
                    </td>
                </tr>
                <tr>
                    <td>
                    <!-- The GridView to display a list of goods -->
                        <asp:GridView ID="gvGoods" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1"
                            CellPadding="10" ForeColor="#333333" DataKeyNames="id" 
                        BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
                        HorizontalAlign="Right" Width="641px">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText=" #" SortExpression="id" >
                              
                                <HeaderStyle HorizontalAlign="Right" Width="30px" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                              
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" >
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:ImageField DataImageUrlField="ImageUrl" HeaderText="Image" nulldisplaytext="No image on file." />
                              
                                <asp:BoundField DataField="description" HeaderText="Description" >
                                <HeaderStyle Width="200px" />
                                <ItemStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="price" HeaderText="Price, $" SortExpression="price" >
                                <HeaderStyle Width="80px" Wrap="False" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <table align="right">
                                            <tr>
                                                <td width="1" style="height: 24px">
                                                    <asp:RequiredFieldValidator ID="vrfQuantity" runat="server" ControlToValidate="txtQuantity"
                                                        CssClass="ValidatorMessage" Display="Dynamic" ErrorMessage="Quantity is required"
                                                        EnableClientScript="False" TabIndex="0">!&nbsp;</asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="vQuantity" runat="server" ControlToValidate="txtQuantity"
                                                        Display="Dynamic" ErrorMessage="Quantity is invalid" Type="Integer" Operator="LessThan"
                                                        ValueToCompare="100000000" EnableClientScript="False" TabIndex="0">!</asp:CompareValidator>
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txtQuantity" runat="server" ToolTip="Enter quantity" Width="40px"
                                                        Text="1">
                                                    </asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="AddToBasket" 
                                  Text="Add to Cart" />
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" BorderColor="Black" BorderStyle="None" 
                              BorderWidth="1px" HorizontalAlign="Right" VerticalAlign="Middle" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                              HorizontalAlign="Right" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:ImageButton ID="ibEdit" runat="server" 
                          ImageUrl="~/PayPal/Images/viewcart.gif" />
                    </td>
                </tr>
            </table>
        </div>
        <!-- The ObjectDataSource to work with the list of goods -->
        <asp:ObjectDataSource ID="odsGoods" runat="server" TypeName="KBSoft.Carts" SelectMethod="LoadAllGoods">
        </asp:ObjectDataSource>
        &nbsp;&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
&nbsp;<asp:XmlDataSource ID="XmlDataSource1" runat="server" 
          DataFile="~/App_Data/Goods.xml"></asp:XmlDataSource>
        <br />
        <%--add this instance of the gvCart grid to get the row count--%>
        <asp:GridView ID="gvCarts" runat="server" DataSourceID="XmlDataSource2"
            CellPadding="5" ForeColor="White" AutoGenerateColumns="False" 
      GridLines="None">
            <Columns>
                <asp:BoundField DataField="rec_id" HeaderText="rec_id" 
                  SortExpression="rec_id" />
                <asp:BoundField DataField="cart_id" HeaderText="cart_id" 
                  SortExpression="cart_id"/>
                <asp:BoundField DataField="item_id" HeaderText="item_id" 
                  SortExpression="item_id" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="quantity" HeaderText="quantity" 
                  SortExpression="quantity" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" BorderStyle="None" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="White" 
              BorderStyle="None" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="White" Font-Bold="True" ForeColor="White" 
              BorderStyle="None" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
    <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
      DataFile="~/App_Data/Carts.xml" XPath="/Carts/Cart">
    </asp:XmlDataSource>
    </asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

