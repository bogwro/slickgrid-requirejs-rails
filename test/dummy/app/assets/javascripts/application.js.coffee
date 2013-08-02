require [
  'jquery'
  'jquery.spreadsheet'
  'domReady!'
], ($) ->

  jsonData = [
    {
      id: 0
      "name": "CDU"
      'GDP (nominal per capita) - Valid Date': 2009
      'GDP (nominal per capita) - Amount': 30.99
      'GDP (nominal per capita) - Currency': "EUR"
    }
    {
      id: 1
      name: "Forza Italia"
      'GDP (nominal per capita) - Valid Date': 2009
      'GDP (nominal per capita) - Amount': 30.99
      'GDP (nominal per capita) - Currency': "EUR"
    }
    {
      id: 2
      name: "Bulgaria"
      'GDP (nominal per capita) - Valid Date': 2009
      'GDP (nominal per capita) - Amount': 30.99
      'GDP (nominal per capita) - Currency': "EUR"
    }
  ]

  $('#spreadsheet').spreadsheet({
    data: jsonData
  })