class Supporter < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  after_initialize :set_done

  def self.wildcard_search(search_term)
    where("name ILIKE :search_term OR email ILIKE :search_term OR message ILIKE :search_term", {search_term: '%'+search_term+'%'})
  end

  private

  def set_done
    self.done = false if self.done.nil?
  end
end
