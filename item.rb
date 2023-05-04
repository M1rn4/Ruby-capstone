require 'date'

class Item
  def initialize(**options)
    @id = options['id']
    @genre = options['genre']
    @author = options['author']
    @source = options['source']
    @label = options['label']
    @publish_date = options['publish_date']
    @archive = options['archive']
  end

  def can_be_archive?
    year_days = 365.25
    now = Date.today
    before = Date.parse(@publish_date)
    difference_in_days = (now - before).to_i
    difference_in_days > 10 * year_days
  end

  def move_to_archive
    @archive = true if can_be_archive? == true
  end
end
