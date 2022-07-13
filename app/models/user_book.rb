class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def as_book_json
    json = self.as_json
    json[:book] = self.book.as_json
    json
  end
end
