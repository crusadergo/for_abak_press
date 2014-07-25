module PagesHelper

  def formatter(text)
    text.gsub(/\*\*((?:(?!\*\*).)*)\*\*/, '<b>\1</b>').gsub(/\\\\((?:(?!\\\\).)*)\\\\/, '<i>\1</i>')
  end

end
