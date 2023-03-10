require "securerandom"
require_relative "../models/quote"

class QuotesController < Rulers::Controller
  def a_quote
    @adjective = "cool"
    @ruby_version = RUBY_VERSION
  end

  def index
    quotes = Quote.all
    @quotes = quotes
  end

  def show
    quote = Quote.find(params["id"])
    ua = request.user_agent
    @obj = quote
    @ua = ua
  end

  def update
    raise "Not found" unless env["REQUEST_METHOD"].downcase == "post"

    quote = Quote.find(1)
    quote.update({
      "submitter" => SecureRandom.uuid
    })
    quote.save

    @obj = quote
  end

  def exception
    raise "It's an exception!"
  end

  def new_quote
    attrs = {
      "submitter" => "web user",
      "quote" => "A picture is work one k pixels",
      "attribution" => "Me"
    }

    quote = Quote.create(attrs)
    @obj = quote
  end
end
