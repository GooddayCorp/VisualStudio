Imports System
Imports System.Net
Imports System.IO
Partial Class GoodDay_PublicContent_stockScreenScraper
	Inherits System.Web.UI.Page

	Dim objWebRequest As System.Net.HttpWebRequest
	Dim objWebResponse As System.Net.HttpWebResponse
	Dim streamReader As System.IO.StreamReader
	Dim strHTML As String	'= streamReader.ReadToEnd

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		Dim symbol As String
		Dim contentPath As String = Server.MapPath("Content")
		codeLabel.Text = File.ReadAllText(contentPath & "\codeReview.txt")
		If (resultsTable.Rows.Count < stockTable.Rows.Count) Then
			For I = 1 To stockTable.Rows.Count - resultsTable.Rows.Count - 1
				addRow()
			Next
		End If
		addRow()
		For I = 1 To resultsTable.Rows.Count - 1
			symbol = stockTable.Rows(I).Cells(0).InnerHtml
			resultsTable.Rows(I).Cells(0).InnerHtml = symbol
			getQuote(symbol, I)
		Next I
	End Sub

	Protected Sub inputButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles inputButton.Click
		addRow()
		Dim rowCount As Integer = resultsTable.Rows.Count - 1
		Dim symbol As String = inputTextBox.Text.ToUpper
		resultsTable.Rows(rowCount).Cells(0).InnerHtml = symbol
		getQuote(symbol, rowCount)
		resultsTable.Rows(rowCount).BgColor = "#CCCC98"
	End Sub

	Public Sub addRow()
		Dim row As HtmlTableRow
		Dim cell As HtmlTableCell
		row = New HtmlTableRow
		For I = 0 To 6
			cell = New HtmlTableCell
			cell.InnerText = "test" & I
			row.Cells.Add(cell)
		Next
		resultsTable.Rows.Add(row)
	End Sub

	Public Sub getQuote(ByVal symbol As String, Optional ByVal I As Integer = 1)
		On Error GoTo errorHandler
		Dim strURL As String = "http://finance.yahoo.com/q?s="
		strURL = strURL & symbol
		objWebRequest = CType(System.Net.WebRequest.Create(strURL), System.Net.HttpWebRequest)
		objWebRequest.Method = "GET"
		objWebResponse = CType(objWebRequest.GetResponse(), System.Net.HttpWebResponse)

		streamReader = New System.IO.StreamReader(objWebResponse.GetResponseStream)
		strHTML = streamReader.ReadToEnd

		'parse for current price
		Dim intPos1, intPos2, intPos3 As Integer
		Dim searchString1 As String = "(" & symbol & ")"
		Dim searchString2 As String = "_" & symbol.ToLower & """>"
		Dim symbolLen As Integer = Len(symbol)
		intPos1 = strHTML.IndexOf(searchString1, 0)
		intPos2 = strHTML.IndexOf(searchString2, intPos1)
		intPos3 = strHTML.IndexOf(".", intPos2)
		Dim test1 As String = strHTML.Substring(intPos2 + symbolLen + 3, intPos3 - intPos2 - symbolLen).Replace(" ", vbNullString)
		resultsTable.Rows(I).Cells(1).InnerHtml = strHTML.Substring(intPos2 + symbolLen + 3, intPos3 - intPos2 - symbolLen).Replace(" ", vbNullString)

		'parse for previous close to calculate price change in $
		Dim intPos12, intPos13, intPos14 As Integer
		Dim searchString3 As String = "(" & symbol & ")"
		Dim searchString4 As String = "_" & symbol.ToLower & """>"
		intPos12 = strHTML.IndexOf("Prev Close", 0)
		intPos13 = strHTML.IndexOf("data1"">", intPos12)
		intPos14 = strHTML.IndexOf(".", intPos13)
		Dim test4 As String = strHTML.Substring(intPos13 + 7, intPos14 - intPos13 - 4).Replace(" ", vbNullString)
		resultsTable.Rows(I).Cells(2).InnerHtml = Format(test1 - test4, "0.00")

		'calculate price change from previous close in %
		resultsTable.Rows(I).Cells(3).InnerHtml = Format(100 * (test1 - test4) / test4, "0.00")

		'parse for todays Volume
		Dim intPos4, intPos5, intPos6, intPos7 As Integer
		intPos4 = strHTML.IndexOf("table2", 0)
		intPos5 = strHTML.IndexOf("Volume:", intPos4)
		intPos6 = strHTML.IndexOf(searchString2, intPos5)
		intPos7 = strHTML.IndexOf("</span>", intPos6)
		Dim test2 As String = strHTML.Substring(intPos6 + symbolLen + 3, intPos7 - intPos6 - symbolLen - 3).Replace(" ", vbNullString)
		resultsTable.Rows(I).Cells(4).InnerHtml = strHTML.Substring(intPos6 + symbolLen + 3, intPos7 - intPos6 - symbolLen - 3).Replace(" ", vbNullString)

		'parse for Avg Vol
		Dim intPos8, intPos9, intPos10, intPos11 As Integer
		intPos8 = strHTML.IndexOf("table2", 0)
		intPos9 = strHTML.IndexOf("Avg Vol", intPos8)
		intPos10 = strHTML.IndexOf("td class=", intPos9)
		intPos11 = strHTML.IndexOf("</td>", intPos10)
		Dim test3 As String = strHTML.Substring(intPos10 + 27, intPos11 - intPos10 - 27).Replace(" ", vbNullString)
		resultsTable.Rows(I).Cells(5).InnerHtml = strHTML.Substring(intPos10 + 27, intPos11 - intPos10 - 27).Replace(" ", vbNullString)
		Dim dayVol As Single = CInt(resultsTable.Rows(I).Cells(4).InnerHtml)
		Dim avgVol As Single = CInt(resultsTable.Rows(I).Cells(5).InnerHtml)
		resultsTable.Rows(I).Cells(6).InnerHtml = Format(dayVol / avgVol, "0.00")
		lblError.Text = " "
		GoTo closeSub
errorHandler:
		For J = 0 To 6
			resultsTable.Rows(I).Cells(J).InnerText = "---"
		Next
		resultsTable.Rows(I).Cells(0).InnerText = "Error"
		lblError.Text = "The stock was not found. Please check the symbol spelling."
closeSub:
		streamReader.Close()
		objWebResponse.Close()
		objWebRequest.Abort()
	End Sub

End Class
