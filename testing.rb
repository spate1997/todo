def display_menu
    puts "Welcome to the To-Do List!"
    puts "1. Add task(s)"
    puts "2. View tasks"
    puts "3. Mark tasks as completed"
    puts "4. Exit"
    print "Enter your choice: "
  end
  
  tasks = []
  
  loop do
    display_menu
    choice = gets.chomp.to_i
  
    case choice
    when 1
      print "Enter the task(s) you'd like to add, separated by commas: "
      input = gets.chomp
      tasks_to_add = input.split(",").map(&:strip)
      tasks_to_add.each do |task|
        tasks << task
        puts "#{task} added."
      end
    when 2
      if tasks.empty?
        puts "Your to-do list is empty."
      else
        puts "\nYour tasks:\n\n"
        tasks.each_with_index do |task, index|
          puts "#{index + 1}. #{task}\n"
        end
      end
    when 3
      if tasks.empty?
        puts "Your to-do list is empty."
      else
        puts "Enter the numbers of the tasks you have completed, separated by spaces (e.g., 1 3):"
        tasks.each_with_index { |task, index| puts "#{index + 1}. #{task}" }
        completed_tasks = gets.chomp.split.map(&:to_i).sort.reverse
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
      puts "Exiting..."
      break
    else
      puts "Invalid choice. Please enter a number between 1 and 4."
    end
  end
  