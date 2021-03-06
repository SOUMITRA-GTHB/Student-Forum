﻿
Imports System.Data
Imports System.Data.SqlClient
Partial Class teacher_new_registration_zone
    Inherits System.Web.UI.Page
    Dim cmd, cmd1 As New SqlCommand
    Dim dr, dr1 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click

        con.Open()
        Try
            cmd = New SqlCommand("insert into teacher(tid,tsl,tname,tdes,tins,tdob,tage,temail,tmob,tpass) values (@tid,@tsl,@tname,@tdes,@tins,@tdob,@tage,@temail,@tmob,@tpass)", con)
            cmd.Parameters.AddWithValue("@tid", TextBox1.Text.Trim())
            cmd.Parameters.AddWithValue("@tsl", TextBox2.Text.Trim())
            cmd.Parameters.AddWithValue("@tname", TextBox3.Text.Trim())
            cmd.Parameters.AddWithValue("@tdes", TextBox4.Text.Trim())
            cmd.Parameters.AddWithValue("@tins", TextBox5.Text.Trim())
            cmd.Parameters.AddWithValue("@tdob", TextBox6.Text.Trim())
            cmd.Parameters.AddWithValue("@tage", TextBox7.Text.Trim())
            cmd.Parameters.AddWithValue("@temail", TextBox8.Text.Trim())
            cmd.Parameters.AddWithValue("@tmob", TextBox9.Text.Trim())
            cmd.Parameters.AddWithValue("@tpass", TextBox10.Text.Trim())
            cmd.ExecuteReader()
            MsgBox("registration successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'generate id
        Dim n As Integer
        Try
            con.Open()
            cmd1 = New SqlCommand("select MAX(tsl) from teacher", con)
            dr1 = cmd1.ExecuteReader
            If dr1.Read Then
                n = dr1(0).ToString
                n = n + 1
                TextBox2.Text = Val(n)
                TextBox1.Text = "PBC-TCH-ID-" & n.ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub
End Class