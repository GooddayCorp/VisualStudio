<%@ Page Title="" Language="C#" MasterPageFile="~/GoodDay/MasterPage.master" AutoEventWireup="true" CodeFile="pwdRecovery.aspx.cs" Inherits="GoodDay_pwdRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
    <div id="passwordrecovery" >
      <div class="popuptitle">Recover Password</div>
      <div class="popupbody" >
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"
          onsendingmail="PasswordRecovery1_SendingMail" >                           
          <MailDefinition From="mike@gooddaycorp.com" Subject="Forgetton Password" Priority="High">
          </MailDefinition>
          <UserNameTemplate>
              <span style="text-align:center">
              <font face="Verdana">
<%--              <h3>Forgot Password </h3>
--%>              UserName: 
              <asp:TextBox ID="UserName" runat="server" 
                  Width="150px"></asp:TextBox>&nbsp;
                  <asp:Button ID="SubmitButton" runat="server" 
                  Text="Submit" 
                  CommandName="Submit" 
                  />
                  <br />
              <span  style="color: #FF0000">
              <asp:Literal ID="FailureText" runat="server"></asp:Literal>
              </span>
              </font> 
              </span>                    
          </UserNameTemplate>
          <QuestionTemplate>
<%--          <h2>Forgot Password</h2>
--%>Hello <asp:Literal ID="UserName" runat="server"></asp:Literal>:<br />
          Please answer your password question: <br />
          <asp:Literal ID="Question" runat="server"></asp:Literal>
          <asp:TextBox ID="Answer" runat="server" Width="300px"></asp:TextBox>&nbsp;
           <asp:Button ID="SubmitButton" class="inputButton" runat="server" 
            Text="Submit" 
            CommandName="Submit"/>
            <br />
            <span  style="color: #FF0000">
            <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
          </QuestionTemplate>
          <SuccessTemplate>
          Your password has been sent to:
          <asp:Label ID="EmailLabel" runat="server"></asp:Label>.
          </SuccessTemplate>
        </asp:PasswordRecovery>
        <input 
        type="button" 
        value="Close"             
        id="Button2" 
        class="inputButton" 
        onclick="javascript:window.open(URL='../Default.aspx',name='_self',fullscreen='yes',replace=false);" />
        <br /> 
        <br />
      </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

