Imports RestSharp
Imports Newtonsoft.Json

Public Class DBapi

    Public Function postRegistroPersonas(headers As List(Of Parametros), parametros As List(Of Parametros), objeto As Object) As String
            Dim Client = New RestClient()
            Dim response
        Dim url As String = "http://localhost:4000/api/personas/"
        Client.BaseUrl = New Uri(url)

            Dim request = New RestRequest()
            request.Method = Method.POST

            For Each item As Parametros In headers
                request.AddHeader(item.Clave, item.Valor)
            Next

            For Each parametro As Parametros In parametros
                request.AddParameter(parametro.Clave, parametro.Valor)
            Next

            If (parametros.Count = 0) Then
                request.AddJsonBody(objeto)
            End If

            response = Client.Execute(request).Content.ToString

            Return response
        End Function

    Public Function getGeneros(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarGeneros"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getTiposDocumentos(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/tipodocumento/"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getPersonas(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarPersonas"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getTotalM(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarM"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getTotalH(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarH"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getPromedio(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarPromedio"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

    Public Function getNombreMayor(headers As List(Of Parametros), parametros As List(Of Parametros)) As String
        Dim Client = New RestClient()
        Dim url As String = "http://localhost:4000/api/consultarMayor"
        Dim response
        Client.BaseUrl = New Uri(url)

        Dim request = New RestRequest()
        request.Method = Method.GET

        For Each item As Parametros In headers
            request.AddHeader(item.Clave, item.Valor)
        Next

        For Each parametro As Parametros In parametros
            request.AddParameter(parametro.Clave, parametro.Valor)
        Next

        response = Client.Execute(request).Content.ToString

        Return response
    End Function

End Class
