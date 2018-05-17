# encoding: utf-8
require './studentsManager.rb'
require './booksManager.rb'
require 'mysql2'
module LibraryManager
	class Library

		def initialize()
			@@client = Mysql2::Client.new(:host => "localhost", :username => "ran", :password =>"123", :database=>"library")	
		end

		def askForChoice()
			puts "Enter your choice\n1. Manage Books\n2. Manage Students\n3. Issue Books\n4. Return Books"
			choice_1 = gets.chomp.to_i
			book = BooksManager::Book.new
			student = StudentsManager::Student.new
			case choice_1
				when 1
					#Manage Books
					puts "Enter your choice\n1. Show Books \n2. Add Books\n3. Update Books\n4. Delete Books"
					choice_2 = gets.chomp.to_i
					case choice_2

						when 1
							#Show Books
							str = "SELECT * FROM books"
							result = @@client.query(str)
							puts "+--------+---------------------------+----------+-------+-------+--------+"
							puts "|Book Id |Book Name\t\t     |Author\t|Pages\t|Price\t|Subject"
							puts "+--------+---------------------------+----------+-------+-------+--------+"
							for row in result
								#print "| "
								#printf("%-7d", row["book_id"])
								#print "| "
								#printf("%s7", row["name"]) 
								#print "| " + row["author"].to_s
								print "| #{row["book_id"]}      | #{row["name"].chomp}     | #{row["author"].chomp} |   #{row["pages"]} | #{row["price"]} | #{row["subject"]} |"
							        puts
							end
							puts "+--------+---------------------------+----------+-------+-------+--------+"
							exit

						when 2
		        				#Add Books
							book.getData()
                                                        str = "INSERT INTO books (book_id, name, author, pages, price, subject, is_issued) VALUES (#{book.id},  '#{book.name}', '#{book.author}', '#{book.pages}', '#{book.price}', '#{book.subject}', 1 )"
							@@client.query(str) 
							puts str
							puts "Book added successfully"
							exit
						when 3
			        			#Update Books
							book.getData()
							str ="UPDATE books SET name='#{book.name}', author='#{book.author}',pages='#{book.pages }', price='#{book.price}', subject='#{book.subject}' WHERE book_id='#{book.id}'"
							@@client.query(str);
							puts "Book details updated successfully"
							puts str
        		   				exit
						when 4
							#Delete Students
							book.getBookId()
							str = "DELETE FROM books WHERE book_id=#{book.id}"
							@@client.query(str)
							puts str
							puts "Book deleted successfully"
						   	exit
						else
							puts "Invalid input"
							exit

					end
					exit
				when 2
					#Manage Students
					puts "Enter your choice\n1. Add Students\n2. Update Students\n3. Delete Students"
					choice_2 = gets.chomp.to_i
					
					case choice_2
						when 1
							#Add Students
							student.getData()
							str = "INSERT INTO students (roll_no, name, class, phone, email) VALUES ('#{student.roll_no}', '#{student.name}','#{student.class_}', '#{student.phone}', '#{student.email}')"
							@@client.query(str)
						        puts str 
							puts "Student added successfully"
							exit 
   	
						when 2
							#Update Students
							student.getData()
							str ="UPDATE students SET name='#{student.name}', class='#{student.class_}', phone=' #{student.phone}', email='#{student.email}' WHERE roll_no='#{student.roll_no}'"
							@@client.query(str)
							puts str
							puts "Student details updated successfully"
						   	exit
						when 3
							#Delete Students
							student.getStudentRollNo()
							str ="DELETE FROM students WHERE roll_no='#{student.roll_no}'"
							@@client.query(str)
							puts str
						   	exit

						else
							puts "Invalid input"
							exit
					end
				when 3
					#Issue Books
					book.getBookId()
					str = "SELECT * FROM book_issue WHERE book_id = '#{book.id}' AND is_returned = 0"
					result = @@client.query(str)
					if result.size()>0
						puts "Book with this id is already issued. Please enter another id"
						exit
					end

					student.getStudentRollNo()
					str = "INSERT INTO book_issue (student_roll_no, book_id, is_returned) VALUES ('#{student.roll_no}', '#{book.id}', 0)"
					puts str
					@@client.query(str)
					exit
				when 4
					#Return Books
					book.getBookId()
					str = "UPDATE book_issue SET is_returned = 1 WHERE book_id = #{book.id}"
					@@client.query(str)
					puts str
					puts "Book returned successfully"
					exit
				else
					puts "Invalid input"
					exit
			end 		
		end
		
	end

end

lib = LibraryManager::Library.new
lib.askForChoice()
#book = BooksManager::Book.new
#book.getData()


