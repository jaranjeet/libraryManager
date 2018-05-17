module StudentsManager
	class Student
		attr_reader :roll_no, :name, :class_, :phone, :email

		def getData()
			puts "Enter roll number"
			@roll_no = gets.chomp
			puts "Enter name"
			@name = gets.chomp
			puts "Enter class of student"
			@class_ = gets.chomp
			puts "Enter phone number"
			@phone = gets.chomp
			puts "Enter email"
			@email = gets.chomp
		end
		
		def getStudentRollNo()
			puts "Enter your roll no"
			@roll_no = gets.chomp
		end
	end
end
