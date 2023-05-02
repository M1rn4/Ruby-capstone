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

  end

  def move_to_archive
  end


end