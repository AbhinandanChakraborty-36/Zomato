Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2,"743652887831-k17uqtf8qqv1vv5984tpbtmjcupv6sml.apps.googleusercontent.com","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"
    provider :facebook,"294924159496145","d500ef5a9e0eab5013ea178da8976f88",
    scope: 'email,read_stream', display: 'popup'
  end
  OmniAuth.config.allowed_request_methods = %i[get]