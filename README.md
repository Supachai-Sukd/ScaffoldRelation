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


คำอธิบาย Ruby mail
<%=  %> Run Ruby code และนำสิ่งที่ Return ออกมา Render
<% %> Run Ruby code แต่ไม่ Render

gem install ffi



//
อีกไฟล์ที่ต้องสนใจเวลาส่งเมลล์คือไฟล์ mailer.text.erb ใน views>layouts
การ yield จะเป็นการนำทุกๆอย่างที่ถูก render จาก template มาใส่ที่นี่

Test mail
ser_id: 1 เป็น params ที่ถูกนำไปใช้ใน welcome_email ส่วน .deliver_now เป็นคำสั่งสำหรับ delay job
ซึ่ง delay job เกิดมาเพื่อสั่งให้ทำอะไรบางอย่าง เมื่อไหร่ก็ได้ตามที่เราต้องการ แต่เนื่องจากเรายังไม่ได้ตั้งค่า delay job
เราจึงใช้ deliver_now ซึ่งแปลว่าส่งเลยไม่ต้องรอ
```
UserMailer.with(user_id: 1).welcome_email.deliver_now
```

Update column เพื่อเทสส่งเมล
```
rails g migration AddEmailToUser mail:text
```

และไปเพิ่ม model user ด้วย
```
def send_welcome_email
        UserMailer.with(user_id: self.id).welcome_email.deliver_now
end
```
