module BooksManager
	class Book
		attr_reader :id, :name, :author, :pages, :price, :subject

		def getData()
			puts "In BooksManager::Book::getData()"
			puts "Enter id of the book"
			@id = gets.chomp
			puts "Enter Name of the book"
			@name = gets.chomp
			puts "Enter Name of Author the book"
			@author = gets.chomp
			puts "Enter number of pages"
			@pages = gets.chomp
			puts "Enter Price the book"
			@price = gets.chomp
			puts "Enter Subject"
			@subject = gets.chomp

		end

		def getBookId()
			puts "Enter id of the book"
			@id = gets.chomp
		end
	end
end
