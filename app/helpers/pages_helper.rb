module PagesHelper

  def formatter(text)
    text.gsub(/\*\*((?:(?!\*\*).)*)\*\*/, '<b>\1</b>').
         gsub(/\\\\((?:(?!\\\\).)*)\\\\/, '<i>\1</i>').
         gsub(/\(\(([^\s]+)\s+((?:(?!\)\)).)*)\)\)/, '<a href="\1">\2</a>')
  end

end
