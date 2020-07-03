Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Partial Class questiondetail
    Inherits System.Web.UI.Page

    Dim cmd, cmd1 As New SqlCommand
    Dim dr, dr1 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        TextBox1.Text = GridView1.SelectedRow.Cells(3).Text
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        con.Open()
        Try
            cmd1 = New SqlCommand("insert into likeadislike(qdtls,slike,sdislike,scomm) values (@qdtls,@slike,@sdislike,@scomm)", con)
            cmd1.Parameters.AddWithValue("@qdtls", TextBox1.Text.Trim())
            cmd1.Parameters.AddWithValue("@slike", Label12.Text.Trim())
            cmd1.Parameters.AddWithValue("@sdislike", Label13.Text.Trim())
            cmd1.Parameters.AddWithValue("@scomm", TextBox2.Text.Trim())
            cmd1.ExecuteReader()
            'MsgBox("Submission successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label14.Text = DateAndTime.Now.Date

        con.Open()
        Try
            cmd = New SqlCommand("select * from  likeadislike where qdtls='" + TextBox1.Text + "' ", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                Label12.Text = dr(1).ToString
                Label13.Text = dr(2).ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()


    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Label12.Text = Val(Label12.Text) + 1
        con.Open()
        Try
            cmd1 = New SqlCommand("insert into likeadislike(qdtls,slike,sdislike,scomm) values (@qdtls,@slike,@sdislike,@scomm)", con)
            cmd1.Parameters.AddWithValue("@qdtls", TextBox1.Text.Trim())
            cmd1.Parameters.AddWithValue("@slike", Label12.Text.Trim())
            cmd1.Parameters.AddWithValue("@sdislike", Label13.Text.Trim())
            cmd1.Parameters.AddWithValue("@scomm", TextBox2.Text.Trim())
            cmd1.ExecuteReader()
            'MsgBox("Submission successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Label13.Text = Val(Label13.Text) + 1
        con.Open()
        Try
            cmd1 = New SqlCommand("insert into likeadislike(qdtls,slike,sdislike,scomm) values (@qdtls,@slike,@sdislike,@scomm)", con)
            cmd1.Parameters.AddWithValue("@qdtls", TextBox1.Text.Trim())
            cmd1.Parameters.AddWithValue("@slike", Label12.Text.Trim())
            cmd1.Parameters.AddWithValue("@sdislike", Label13.Text.Trim())
            cmd1.Parameters.AddWithValue("@scomm", TextBox2.Text.Trim())
            cmd1.ExecuteReader()
            'MsgBox("Submission successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
