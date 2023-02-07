class QuotesController < Rulers::Controller
  def a_quote
    @adjective = "cool"
    @ruby_version = RUBY_VERSION
    render :a_quote, { adjective: @adjective, ruby_version: @ruby_version }
  end

  def exception
    raise "It's an exception!"
  end
end
