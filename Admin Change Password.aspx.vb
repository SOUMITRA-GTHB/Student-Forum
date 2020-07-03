Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Configuration

Partial Class Admin_Change_Password
    Inherits System.Web.UI.Page
    Dim cmd, cmd1 As SqlCommand
    Dim dr As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub ImageButton6_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton6.Click
        con.Open()
        Try
            If TextBox5.Text <> TextBox2.Text Then
                MsgBox("You have enter worong old password", MsgBoxStyle.OkCancel)
            Else
                cmd1 = New SqlCommand("update admin set apass='" + TextBox4.Text + "' where aid='" + Label9.Text + "'", con)
                cmd1.ExecuteReader()
                Response.Redirect("adminlogin.aspx")
            End If
        Catch ex As Exception

        End Try

        con.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label9.Text = Session("aid")
        con.Open()
        Try
            cmd = New SqlCommand("select * from  admin where aid='" + Label9.Text + "' ", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                TextBox5.Text = dr(3).ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()

    End Sub
End Class
