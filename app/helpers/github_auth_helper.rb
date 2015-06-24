require "hurley"
require "json"

module GithubAuthHelper
  def self.getNames(orgs_url)
    hurley = Hurley::Client.new
    body = hurley.get(orgs_url).body
    org_array = JSON.parse(body)
    org_array.map do |org|
      org["login"]
    end
  end
end
