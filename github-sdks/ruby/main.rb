require 'octokit'

client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

client.create_ref(
  "RafaWilliansAC2/GitHubExample",
  "heads/sdks",
  "COMMIT_SHA"
)