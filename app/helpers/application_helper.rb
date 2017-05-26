module ApplicationHelper
  def shorten(string)
    if string.length<=10
        string
    else
        string[0...9]+"..."
    end
  end
end
