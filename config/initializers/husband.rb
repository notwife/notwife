require 'restclient'

url     = configatron.husband.url
url     = url.blank? ? ENV['HUSBAND_URL'] : url
keyword = configatron.husband.keyword
keyword = keyword.blank? ? ENV['HUSBAND_KEYWORD'] : keyword

unless !url.nil? && !keyword.nil?
  raise 'husband settings is not found. Add config/config.yml OR ENV["HUSBAND_URL"] and ENV["HASBAND_KEYWORD"]'
end

class Husband
  def initialize(url, keyword)
    @url     = url
    @keyword = keyword
  end

  def post(parameters = {})
    parameters[:keyword] = @keyword
    RestClient.post(@url, parameters.map { |k, v| "#{k}=#{v}" }.join("&"))
  end
end

$husband = Husband.new(url, keyword)
