require 'octokit'

client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

client.create_ref(
  "RafaWilliansAC2/GitHubExample",
  "heads/sdks",
  "837feb5fe2fc5f462499350c9be13649da003c9d"
)