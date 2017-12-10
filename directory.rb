def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit the return twice"
  #creating an empty array
  students = []
  name = gets.chomp
  #repeat this while name variable is empty
    while !name.empty? do
      #add the student hash to the array
      students << {name: name, cohort: :november}
      puts "Now we have #{students.count} students"
      #get another name from the user
      name = gets.chomp
    end
    #return the array of students
    students
end

#prints the header of the list of students
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
#prints the list of studnets in the array
def print(students)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]}\
    (#{student[:cohort]} cohort)" if student[:name].chars.first == "B"
  end
end

#prints a footer with the total student count
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
