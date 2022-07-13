class User < ApplicationRecord
    has_many :user_books
    has_many :books, through: :user_books

    def as_detail_json
        json = self.as_json
        json[:user_books] = self.user_books.map{|ub| ub.as_book_json}
        json
    end
end



# as_detail_json จะไปเรียกใช้ user_book.as_book_json เราจึงจะไปเพิ่ม as_book_json ใน UserBook Model
# เป็น Manual Function หนะแหละ คอลฟังชั่นไปและ Map as_book_json หนะ
# ทำแบบนี้เพื่อประหยัด Recourse ช่วยด้าน Performance and Data transfer