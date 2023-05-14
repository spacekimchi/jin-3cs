require 'webmock/rspec'

FactoryBot.define do
  factory :missing_api_key, class: OpenStruct do
    code { '403' }
    body { 
      '{
        "error": {
          "code": 403,
          "message": "The request is missing a valid API key.",
          "status": "PERMISSION_DENIED"
        }
      }'
    }
  end

  factory :invalid_api_key, class: OpenStruct do
    code { '400' }
    body {
      '{
        "error": {
          "code": 400,
          "message": "API key not valid. Please pass a valid API key.",
          "status": "INVALID_ARGUMENT"
        }
      }'
    }
  end

  factory :internal_error, class: OpenStruct do
    code { '500' }
    body {
      '{
        "error": {
          "code": 500,
          "message": "Internal error encountered.",
          "status": "INTERNAL"
        }
      }'
    }
  end

  factory :invalid_query_string_error, class: OpenStruct do
    code { '400' }
    body {
      '{
        "error": {
          "code": 400,
          "message": "Invalid JSON payload received: Cannot bind query parameter.",
          "status": "INVALID_ARGUMENT",
        }
      }'
    }
  end

  factory :get_fonts, class: OpenStruct do
    code { '200' }
    body {
      '{ "items": [
        {
          "family": "ABeeZee",
          "subsets": ["latin", "latin-ext"]
        },
        {
          "family": "Baloo Paaji 2",
          "subsets": ["gurmukhi", "latin", "vietnamese"]
        },
        {
          "family": "Condiment",
          "subsets": ["latin"]
        }
      ]}'
    }
  end
end
