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