@students = []  #an empty array accessible to all methods

def input_students
  puts 'Please enter the names of the students'
  puts 'To finish just hit the return twice'
  name = gets.strip

  unless name.empty?

    puts 'Please enter student cohort'
    cohort = gets.strip
    cohort = 'November' if cohort.empty?

  end
  # repeat this while name variable is empty
  # creating an empty array
  until name.empty?
    # add the student hash to the array
    @students << { name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    puts 'Enter name'
    name = gets.strip

    next if name.empty?
    puts 'Enter cohort'
    cohort = gets.strip
    cohort = 'November' if cohort.empty?
  end
  # return the array of students
  @students
end

# prints the header of the list of students
def print_header
  puts 'The students of Villains Academy'
  puts '-------------'
end

# prints the list of students in the array sorted into cohorts
def print_students_list
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
def print_footer
  puts "Overall, we have #{@students.count} great student" if @students.count == 1
  puts "Overall, we have #{@students.count} great students" if @students.count > 1
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
    loop do
      print_menu
      process(gets.chomp)
    end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort}
  end
  file.close
end

interactive_menu
