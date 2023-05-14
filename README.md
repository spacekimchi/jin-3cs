# README

Tests can be run with `bundle exec rspec`.

There are tests for api service and some controller tests.

I wasn't sure what API to use and what to do with the returned data. Otherwise I would have made unit tests to confirm the response from the external API is used correctly.

## Files of interest
`/app/services/api_service.rb`

`/app/services/api_errors.rb`

`/app/controllers/webfonts_controller.rb`

`/spec/factories/web_fonts_api_responses.rb`

`/spec/controllers/webfonts_controller_spec.rb`

`/spec/services/api_service_spec.rb`

WEBFONTS_API_KEY can be obtained at [https://developers.google.com/fonts/docs/developer_api](https://developers.google.com/fonts/docs/developer_api)

Create a `.env` folder in the project root. An example env exists in `.env.example`

Route `/webfonts` will just make a request to google webfonts api and return webfonts.

