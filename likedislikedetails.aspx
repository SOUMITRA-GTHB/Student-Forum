<%@ Page Title="" Language="VB" MasterPageFile="~/Admin After loginzone .master" AutoEventWireup="false" CodeFile="likedislikedetails.aspx.vb" Inherits="likedislikedetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 485px; background-image: none; background-color: #CCFF99;">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="XX-Large" Text="Select Questions Details :" BackColor="White"></asp:Label>
        &nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="qdtls" DataValueField="qdtls" 
            Height="31px" Width="156px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT [qdtls] FROM [likeadislike]">
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="XX-Large" Text="Your selection details:" BackColor="White"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" 
            EmptyDataText="There are no data records to display." Width="780px">
            <Columns>
                <asp:BoundField DataField="slike" HeaderText="Like" SortExpression="slike" />
                <asp:BoundField DataField="sdislike" HeaderText="Dislike" 
                    SortExpression="sdislike" />
                <asp:BoundField DataField="scomm" HeaderText="Comment" SortExpression="scomm" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [qdtls], [slike], [sdislike], [scomm] FROM [likeadislike] WHERE ([qdtls] = @qdtls)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="qdtls" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

