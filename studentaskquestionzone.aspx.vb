Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Partial Class studentaskquestionzone
    Inherits System.Web.UI.Page
    Dim cmd, cmd1 As New SqlCommand
    Dim dr, dr2 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")
    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label14.Text = DateAndTime.Now.Date

        TextBox7.Text = Session("sid")
        con.Open()
        Try
            cmd = New SqlCommand("select * from  student where sid='" + TextBox7.Text + "' ", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                TextBox1.Text = dr(2).ToString
                TextBox3.Text = dr(6).ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        con.Open()
        Try
            cmd = New SqlCommand("insert into saskques(sname,semail,sques,sub,adate) values (@sname,@semail,@sques,@sub,@adate)", con)
            cmd.Parameters.AddWithValue("@sname", TextBox1.Text.Trim())
            cmd.Parameters.AddWithValue("@semail", TextBox3.Text.Trim())
            cmd.Parameters.AddWithValue("@sques", TextBox4.Text.Trim())
            cmd.Parameters.AddWithValue("@sub", TextBox6.Text.Trim())
            cmd.Parameters.AddWithValue("@adate", Label14.Text.Trim())
            cmd.ExecuteReader()
            MsgBox("Asking question successful reply later", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub
End Class
