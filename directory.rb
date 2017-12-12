@students = []

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish just hit the return twice'
  name = gets.strip

  unless name.empty?

    puts 'Please enter student cohort'
    cohort = gets.strip
    cohort = 'November' if cohort.empty?

    puts 'Please enter students hobby'
    hobby = gets.strip

    puts 'Please enter students place of birth'
    birth_place = gets.strip

    puts 'Please enter students height'
    height = gets.strip
end
  # repeat this while name variable is empty
  # creating an empty array
  #students = []
  until name.empty?
    # add the student hash to the array
    @students << { name: name, cohort: cohort, hobby: hobby,
                  birth_place: birth_place, height: height }
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts 'Enter name'
    name = gets.strip

    next if name.empty?
    puts 'Enter cohort'
    cohort = gets.strip
    cohort = 'November' if cohort.empty?

    puts 'Enter hobby'
    hobby = gets.strip

    puts 'Enter place of birth'
    birth_place = gets.strip

    puts 'Enter height'
    height = gets.strip

  end
  # return the array of students
  @students
end

# prints the header of the list of students
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# prints the list of students in the array
def print(students)
  cohort_sorted = {}

  @students.map do |student|
    name = student[:name]
    cohort = student[:cohort]

    if cohort_sorted[cohort].nil?
      cohort_sorted[cohort] = [name]
    else
      cohort_sorted[cohort].push(name)
    end
  end

  cohort_sorted.each do |cohort|

    cohort.each do |student|
    puts student
    end

  end

end

# prints a footer with the total student count
def print_footer(names)
  puts "Overall, we have #{names.count} great student" if names.count == 1
  puts "Overall, we have #{names.count} great students" if names.count > 1
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

def interactive_menu
  #students = []
    loop do
      print_menu
      selection = gets.chomp

      case selection
      when "1"
        students = input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
      end

    end
end

interactive_menu
