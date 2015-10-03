# LibSys
CSC 517 Ruby on Rails LibSys Project

LibSys is a simple library inventory management application written with Ruby On Rails.

### Checkout History
Our implementation follows a hard-delete for a Library Member's history when an Admin removes a book from the system.  When a book is removed, a Library Member will no longer see any records related to the book in their checkout history.

Our implementation follows a hard-delete for a Book's history when an Admin removes a Library Member from the system.  When a Library Member is removed, a book will no longer see any records related to the library member in their checkout history.  If the Library Member who is removed has any checked out books, these books will become available again.

### Default Admin Credentials
Email: admin@ncsu.edu
Password: 2015_N0rthCar0l1na
User type: Admin

### Testing
As per the project requirements, we have throughly tested both a model and a controller from our project.  Please see our [books_controller_test.rb](test/controllers/books_controller_test.rb) and our [book_test.rb](test/models/book_test.rb) tests.
