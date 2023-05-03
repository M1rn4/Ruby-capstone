require 'date'

class Item
  def initialize(id, **options)
    @id = id
    @genre = options[genre]
    @author = options[author]
    @source = options[source]
    @label = options[label]
    @publish_date = options[date]
    @archive = options[archive]
  end

  def can_be_archive?
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i

    years = (difference_in_days / 365.25).to_i
    years > 10
  end

  def move_to_archive
    @archive = true if can_be_archive? == true
  end
end
