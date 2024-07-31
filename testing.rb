#testing ruby
# Define a method to display the menu options to the user
def display_menu
  puts "Welcome to the To-Do List!"
  puts "1. Add task(s)"
  puts "2. View tasks"
  puts "3. Mark tasks as completed"
  puts "4. Exit"
  print "Enter your choice: "
end

# Initialize an empty array to store tasks
tasks = []

# Start an infinite loop to keep the program running until the user chooses to exit
loop do
  # Call the method to display the menu
  display_menu
  # Get the user's choice and convert it to an integer
  choice = gets.chomp.to_i

  # Use a case statement to handle different choices
  case choice
  when 1
    # Option to add tasks
    print "Enter the task(s) you'd like to add, separated by commas: "
    input = gets.chomp
    # Split the input string by commas, remove any extra spaces, and add each task to the tasks array
    tasks_to_add = input.split(",").map(&:strip)
    tasks_to_add.each do |task|
      tasks << task
      puts "#{task} added."
    end
  when 2
    # Option to view tasks
    if tasks.empty?
      puts "Your to-do list is empty."
    else
      puts "\nYour tasks:\n\n"
      tasks.each_with_index do |task, index|
        puts "#{index + 1}. #{task}\n"
      end
    end
  when 3
    # Option to mark tasks as completed
    if tasks.empty?
      puts "Your to-do list is empty."
    else
      puts "Enter the numbers of the tasks you have completed, separated by spaces (e.g., 1 3):"
      tasks.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
      # Get the completed tasks' numbers, convert them to integers, and sort them in reverse order
      completed_tasks = gets.chomp.split.map(&:to_i).sort.reverse
      # Iterate over the completed task numbers and remove them from the tasks array
      completed_tasks.each do |task_number|
        if task_number.between?(1, tasks.length)
          tasks.delete_at(task_number - 1)
          puts "Task #{task_number} has been marked as completed and removed from the list."
        else
          puts "Invalid task number: #{task_number}. No such task."
        end
      end
    end
  when 4
    # Option to exit the program
    puts "Exiting..."
    break
  else
    # Handle invalid choices
    puts "Invalid choice. Please enter a number between 1 and 4."
  end
end

  
