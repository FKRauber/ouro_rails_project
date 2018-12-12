Rails.application.config.middleware.use Omniauth::Builder do
	provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user"
end