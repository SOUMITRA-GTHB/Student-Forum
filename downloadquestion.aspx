<%@ Page Title="" Language="VB" MasterPageFile="~/after login student.master" AutoEventWireup="false" CodeFile="downloadquestion.aspx.vb" Inherits="downloadquestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-position: center center; height: 954px; background-color: #FFFF00; background-image: url('pic/forum_pics/library.jpg'); background-repeat: no-repeat;">
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="30pt" ForeColor="#006595" 
        Text="Download Question Here....." BorderColor="Black" BackColor="#FFFFCC" 
            Font-Names="Arial"></asp:Label>
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="20pt" Text="Select Course:" BackColor="#FFFF99" 
            ForeColor="#0066FF"></asp:Label>
&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" Height="51px" Width="210px" 
            AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="qcourse" 
            DataValueField="qcourse">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [qcourse] FROM [question]">
        </asp:SqlDataSource>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="20pt" Text="Select Subject:" BackColor="#FFFF99" 
            ForeColor="#0066FF"></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server" Height="51px" Width="210px" 
            AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="qsub" 
            DataValueField="qsub">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [qsub] FROM [question] WHERE ([qcourse] = @qcourse)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="qcourse" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="20pt" Text="Select Year:" BackColor="#FFFF99" 
            ForeColor="#0066FF"></asp:Label>
        <asp:DropDownList ID="DropDownList3" runat="server" Height="51px" Width="210px" 
            AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="qyear" 
            DataValueField="qyear">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [qyear] FROM [question] WHERE ([qsub] = @qsub)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" Name="qsub" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="30pt" ForeColor="#006595" 
        Text="Your Selected question details :" BorderColor="Black" BackColor="#FFFFCC" 
            Font-Names="Arial"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="qid" DataSourceID="SqlDataSource4" 
            EmptyDataText="There are no data records to display." Width="817px">
            <Columns>
                <asp:CommandField SelectText="Select to download" ShowSelectButton="True" />
                <asp:BoundField DataField="qid" HeaderText="question id" ReadOnly="True" 
                    SortExpression="qid" />
                <asp:BoundField DataField="qsl" HeaderText="qsl" SortExpression="qsl" />
                <asp:BoundField DataField="qpaper" HeaderText="qpaper" 
                    SortExpression="qpaper" />
                <asp:BoundField DataField="qcourse" HeaderText="qcourse" 
                    SortExpression="qcourse" />
                <asp:BoundField DataField="qyear" HeaderText="qyear" SortExpression="qyear" />
                <asp:BoundField DataField="qsub" HeaderText="qsub" SortExpression="qsub" />
                <asp:BoundField DataField="qname" HeaderText="qname" SortExpression="qname" />
                <asp:BoundField DataField="qset" HeaderText="qset" SortExpression="qset" />
                <asp:BoundField DataField="qdet" HeaderText="qdet" SortExpression="qdet" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [question] WHERE [qid] = @qid" 
            InsertCommand="INSERT INTO [question] ([qid], [qsl], [qpaper], [qcourse], [qyear], [qsub], [qname], [qset], [qdet]) VALUES (@qid, @qsl, @qpaper, @qcourse, @qyear, @qsub, @qname, @qset, @qdet)" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT [qid], [qsl], [qpaper], [qcourse], [qyear], [qsub], [qname], [qset], [qdet] FROM [question] WHERE ([qyear] = @qyear)" 
            UpdateCommand="UPDATE [question] SET [qsl] = @qsl, [qpaper] = @qpaper, [qcourse] = @qcourse, [qyear] = @qyear, [qsub] = @qsub, [qname] = @qname, [qset] = @qset, [qdet] = @qdet WHERE [qid] = @qid">
            <DeleteParameters>
                <asp:Parameter Name="qid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="qid" Type="String" />
                <asp:Parameter Name="qsl" Type="String" />
                <asp:Parameter Name="qpaper" Type="String" />
                <asp:Parameter Name="qcourse" Type="String" />
                <asp:Parameter Name="qyear" Type="String" />
                <asp:Parameter Name="qsub" Type="String" />
                <asp:Parameter Name="qname" Type="String" />
                <asp:Parameter Name="qset" Type="String" />
                <asp:Parameter Name="qdet" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="qyear" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="qsl" Type="String" />
                <asp:Parameter Name="qpaper" Type="String" />
                <asp:Parameter Name="qcourse" Type="String" />
                <asp:Parameter Name="qyear" Type="String" />
                <asp:Parameter Name="qsub" Type="String" />
                <asp:Parameter Name="qname" Type="String" />
                <asp:Parameter Name="qset" Type="String" />
                <asp:Parameter Name="qdet" Type="String" />
                <asp:Parameter Name="qid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="ImageButton4" runat="server" Height="62px" 
            ImageUrl="~/pic/downld2.png" Width="73px" />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</asp:Content>

