<%@ Page Title="" Language="VB" MasterPageFile="~/Admin After loginzone .master" AutoEventWireup="false" CodeFile="detailsteacherzone.aspx.vb" Inherits="detailsteacherzone" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-position: center; height: 686px; background-color: #CCFFCC; background-image: url('pic/learn_gifs/barr8.gif'); background-repeat: no-repeat; background-attachment: scroll;">
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="20pt" Text="Select id:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            DataSourceID="SqlDataSource1" DataTextField="tid" DataValueField="tid" 
            Height="34px" Width="157px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [tid] FROM [teacher]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="True" 
            Font-Size="20pt" Text="Your selection details :"></asp:Label>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="tid" DataSourceID="SqlDataSource2" 
            EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="tid" HeaderText="tid" ReadOnly="True" 
                    SortExpression="tid" />
                <asp:BoundField DataField="tsl" HeaderText="tsl" SortExpression="tsl" />
                <asp:BoundField DataField="tname" HeaderText="tname" SortExpression="tname" />
                <asp:BoundField DataField="tdes" HeaderText="tdes" SortExpression="tdes" />
                <asp:BoundField DataField="tins" HeaderText="tins" SortExpression="tins" />
                <asp:BoundField DataField="tdob" HeaderText="tdob" SortExpression="tdob" />
                <asp:BoundField DataField="tage" HeaderText="tage" SortExpression="tage" />
                <asp:BoundField DataField="temail" HeaderText="temail" 
                    SortExpression="temail" />
                <asp:BoundField DataField="tmob" HeaderText="tmob" SortExpression="tmob" />
                <asp:BoundField DataField="tpass" HeaderText="tpass" SortExpression="tpass" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM [teacher] WHERE [tid] = @tid" 
            InsertCommand="INSERT INTO [teacher] ([tid], [tsl], [tname], [tdes], [tins], [tdob], [tage], [temail], [tmob], [tpass]) VALUES (@tid, @tsl, @tname, @tdes, @tins, @tdob, @tage, @temail, @tmob, @tpass)" 
            SelectCommand="SELECT [tid], [tsl], [tname], [tdes], [tins], [tdob], [tage], [temail], [tmob], [tpass] FROM [teacher] WHERE ([tid] = @tid)" 
            UpdateCommand="UPDATE [teacher] SET [tsl] = @tsl, [tname] = @tname, [tdes] = @tdes, [tins] = @tins, [tdob] = @tdob, [tage] = @tage, [temail] = @temail, [tmob] = @tmob, [tpass] = @tpass WHERE [tid] = @tid">
            <DeleteParameters>
                <asp:Parameter Name="tid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tid" Type="String" />
                <asp:Parameter Name="tsl" Type="String" />
                <asp:Parameter Name="tname" Type="String" />
                <asp:Parameter Name="tdes" Type="String" />
                <asp:Parameter Name="tins" Type="String" />
                <asp:Parameter DbType="Date" Name="tdob" />
                <asp:Parameter Name="tage" Type="Decimal" />
                <asp:Parameter Name="temail" Type="String" />
                <asp:Parameter Name="tmob" Type="String" />
                <asp:Parameter Name="tpass" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="tid" 
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="tsl" Type="String" />
                <asp:Parameter Name="tname" Type="String" />
                <asp:Parameter Name="tdes" Type="String" />
                <asp:Parameter Name="tins" Type="String" />
                <asp:Parameter DbType="Date" Name="tdob" />
                <asp:Parameter Name="tage" Type="Decimal" />
                <asp:Parameter Name="temail" Type="String" />
                <asp:Parameter Name="tmob" Type="String" />
                <asp:Parameter Name="tpass" Type="String" />
                <asp:Parameter Name="tid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

