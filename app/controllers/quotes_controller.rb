require "securerandom"

class QuotesController < Rulers::Controller
  def a_quote
    @adjective = "cool"
    @ruby_version = RUBY_VERSION
    render :a_quote, { adjective: @adjective, ruby_version: @ruby_version }
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def quote_1
    quote_1 = FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def update
    raise "Not found" unless env["REQUEST_METHOD"].downcase == "post"

    quote = FileModel.find(1)
    quote.update({
      "submitter" => SecureRandom.uuid
    })
    quote.save

    render :quote, :obj => quote
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

    quote = FileModel.create(attrs)
    render :quote, :obj => quote
  end
end
