'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'
'  File:           Default.aspx.vb
'
'  Facility:       The unit contains the Default class
'
'  Abstract:       This class is responsible for display of interface of goods
'                  addition to a cart and supports interaction with user.
'
'  Environment:    VC 8.0
'
'  Author:         KB_Soft Group Ltd.
'
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Imports System
Imports System.IO
Imports System.Xml
Imports System.Web.UI.WebControls
Imports System.Globalization

Partial Class _Default
  Inherits System.Web.UI.Page
  'Dim cartIsEmpty As String
  'Dim cartText As String = "1"

  Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    'Dim isCartEmpty As String = Request.QueryString("cartIsEmpty")
    If (Request.QueryString("cartIsEmpty") = "true") Then
      Label1.Text = "Cart is empty."
      If gvCarts.Rows.Count = 0 Then Label1.Text = "Your shopping cart is empty."
    End If
    If Not Page.IsPostBack Then Me.ddlCartID.SelectedValue = Request.QueryString("cart_id")
  End Sub

  Protected Sub ddlCartID_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCartID.PreRender
    XmlDataSource2.XPath = "Carts/Cart[@cart_id=" & Me.ddlCartID.SelectedValue & "]"
    'If Page.IsPostBack Then 
    If Page.IsPostBack Then
      Label1.Text = ""
    Else
      'the count is out of sync with the grid?
    End If
  End Sub

  Protected Sub gvCarts_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvCarts.DataBound
      Label1.Text = "Items= " & gvCarts.Rows.Count
  End Sub

  Protected Sub ibEdit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ibEdit.Click
    Response.Redirect("~/PayPal/ViewCart.aspx" + "?cart_id=" + Me.ddlCartID.SelectedItem.Text)
  End Sub

    ''' <summary>
    ''' adding an item to a cart
    ''' </summary>
    ''' <param name="cart_id">a cart identifier</param>
    ''' <param name="item_id">a item identifier</param>
    ''' <param name="price">a price of the item</param>
    ''' <param name="quantity">the nuber of items</param>
    ''' <returns>true if the item was successfully added to the cart</returns>
    Protected Function AddToBasket(ByVal cart_id As String, ByVal item_id As String, ByVal price As String, ByVal quantity As String) As Boolean

        Dim xmlFile As String = Server.MapPath("~/App_Data/Carts.xml")
        Dim doc As New XmlDocument()
        Dim reader As XmlTextReader

        If File.Exists(xmlFile) Then
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        Else
            KBSoft.Carts.CreateXml(xmlFile, "Carts")
            reader = New XmlTextReader(xmlFile)
            reader.Read()
        End If

        doc.Load(reader)
        reader.Close()

        ' getting a unique number of the rec_id record.
        Dim nodes As XmlNodeList = doc.GetElementsByTagName("Cart")
        Dim rec_id As Integer
        If nodes.Count <> 0 Then
            rec_id = KBSoft.Carts.GetIdentity(nodes, "rec_id")
        Else
            rec_id = 0
        End If

        ' creating a new XML element (adding an item in a cart)
        Dim cart As XmlElement = doc.CreateElement("Cart")
        cart.SetAttribute("rec_id", rec_id)
        cart.SetAttribute("cart_id", cart_id)
        cart.SetAttribute("item_id", item_id)
        cart.SetAttribute("price", price)
        cart.SetAttribute("quantity", quantity)
        doc.DocumentElement.AppendChild(cart)

        Try
            doc.Save(xmlFile)
        Catch ex As Exception
            Response.Write("Error in Default.AddToBasket(): " + ex.Message)
            Return False
        End Try

        Return True
    End Function

    Protected Sub gvGoods_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvGoods.RowCommand
        ' handling the event of the "Add To Basket" button pressure
        If e.CommandName = "AddToBasket" Then
            Dim index As Integer = e.CommandArgument
            ' Checking whether the quantity of goods added to the cart is correct
            Me.Validate()
            If Not CType(Me.gvGoods.Rows(index).Cells(3).FindControl("vQuantity"), System.Web.UI.WebControls.CompareValidator).IsValid Then
                Response.Write("Quantity is not valid!")
                Return
            End If
            If Not CType(Me.gvGoods.Rows(index).Cells(3).FindControl("vrfQuantity"), System.Web.UI.WebControls.RequiredFieldValidator).IsValid Then
                Response.Write("Quantity is requared!")
                Return
            End If
            ' adding goods to the cart
            If AddToBasket(GetCartID(), GetItemID(index), GetPrice(index), GetQuantity(index)) Then Label1.Text = ""
        End If
    End Sub
    ''' <summary>    
    ''' getting an identifier of the cart that was selected by user
    ''' </summary>
    ''' <returns>the identifier of the cart that was selected by user</returns>
    Protected Function GetCartID() As String
        Return Me.ddlCartID.SelectedValue.ToString
    End Function

    ''' <summary>    
    ''' getting an identifier of the item being added to the cart by user
    ''' </summary>
    ''' <param name="index">the number of the line on the button where user clicked</param>
    ''' <returns>the identifier of the item being added by user</returns>
    Protected Function GetItemID(ByVal index As Integer) As String
        Return Me.gvGoods.DataKeys(index).Value.ToString
    End Function

    ''' <summary>    
    ''' getting a price of the added item
    ''' </summary>
    ''' <param name="index">the number of the line on the button where user clicked</param>
    ''' <returns>the price of the item being added by user</returns>
    Protected Function GetPrice(ByVal index As Integer) As String
        Dim ci As CultureInfo = New CultureInfo("en-us")
        Return Me.gvGoods.Rows(index).Cells(4).Text.ToString(ci)
    End Function

    ''' <summary>    
    ''' getting the number of items being added
    ''' </summary>
    ''' <param name="index">the number of the line on the button where user clicked</param>
    ''' <returns>the number of items added by iser</returns>
    Protected Function GetQuantity(ByVal index As Integer) As String
        Return CType(Me.gvGoods.Rows(index).Cells(5).FindControl("txtQuantity"), System.Web.UI.WebControls.TextBox).Text
    End Function

End Class
