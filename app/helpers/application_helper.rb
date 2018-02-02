module ApplicationHelper

  def time_created(x)
    x.created_at.gmtime.localtime.strftime("%b %d, %Y %I:%M:%S %p")
  end

end
