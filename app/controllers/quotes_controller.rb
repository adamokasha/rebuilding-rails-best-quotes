class QuotesController < Rulers::Controller
  def a_quote
    "This is a really profound quote." +
    "\n<pre>\n#{env}\n</pre>"
  end

  def exception
    raise "It's an exception!"
  end
end
