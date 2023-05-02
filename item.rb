require 'date'

class Item 
  
  def initialize(id,genre,author,source,label,date,archive)
     @id = id
     @genre= genre
     @author=author
     @source=source
     @label=label
     @publish_date= date
     @archive=archive
  end
  
  def can_be_archive?
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i
    
    years=(difference_in_days/365.25).to_i
    if (years>10)
      @archive = true
    else
      @archive = false  
    end
  end

  def move_to_archive
  end


end