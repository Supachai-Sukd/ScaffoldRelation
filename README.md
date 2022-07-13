# README


* Relation Example
เริ่มทำแบบ Scaffold
สร้าง User Model
```
rails g scaffold User title:text first_name:text last_name:text
```

สร้าง Book Model
```
rails g scaffold Book name:text description:text pages:integer
```

สร้าง Join Table UserBook Model โดยให้ Reference ไปยัง User และ Book
```
rails g scaffold UserBook user:references book:references
```

หลังจากนั้น Migrate ดู ถ้ามีปัญหาให้ดูว่าพิมพ์อะไรผิดหรือไม่
```
rails db:migrate
```

มีแก้ Model ด้วยไปดูใน Model

มา Create user กัน
```
u1 = User.create(title: 'Mr', first_name: 'Supachai', last_name: 'Sukduang')
u2 = User.create(title: 'Mrs', first_name: 'Usanee', last_name: 'Sukduang')
```

มาสร้าง Book
```
b1 = Book.create(name: 'Learn Ruby', description: 'Learn Ruby for God', pages: 999)
b2 = Book.create(name: 'Learn Ruby on Rails', description: 'Learn Ruby on Rails  for God', pages: 999)
```

เช็คจำนวนหนังสือ
```
u1.user_books.count # 0
u1.books.count # 0 ดูได้จากใน Model ไอ้ books and user_books มัน has_many ไว้
```

เพิ่มหนังสือ b1 b2 ให้ u1
```
u1b1 = UserBook.create(user_id: u1.id, book_id: b1.id)
u1b2 = UserBook.create(user_id: u1.id, book_id: b2.id)
```

ให้ u2
```
u2b2 = UserBook.create(user_id: u2.id, book_id: b2.id)
```

หลังจากนี้เช็คจะได้ผลอีกอย่างละ
```
u1.books.count # 2
u1.user_books.count # 2
u2.user_books.count
u2.books.count # 1
```


Mail
หลังจากเพิ่ม gem "mailgun_rails" ใน Gemfile ให้ไปเพิ่ม Config ด้วย
ใน env
```
config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: 'mail gun api key',
    domain: 'mailgun domain'
  }
```


คำสั่งสร้าง Email 
rails g mailer คือคำสั่งสร้าง mailer ชื่อว่า UserMailer โดยจะสร้าง action ชื่อว่า welcome_email ด้วย
```
rails g mailer UserMailer welcome_email
```


gem install ffi --platform=ruby

gem install ffi