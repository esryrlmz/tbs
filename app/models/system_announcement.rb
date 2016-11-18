class SystemAnnouncement < ActiveRecord::Base
  def self.search(query)
    where('lower(title) like ?', "%#{query}%".downcase)
  end
end
