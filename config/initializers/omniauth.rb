OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1159204240761952', '04ccc275bed030296e917f496ee619d0'
end
