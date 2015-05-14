module ApplicationHelper

  def today
    Time.now.to_s(:short_date)
  end

  def bento_available?
    t = Time.now
    !( t.saturday? || t.sunday? || t.hour < 9 || t.hour > 11 )
    false
  end

  def icon(name)
    "<span class=\"glyphicon glyphicon-#{name}\"><span>".html_safe
  end


end
