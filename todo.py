#todo list ruby
# Define a function to display the menu options to the user
def display_menu():
    print("Welcome to the To-Do List!")
    print("1. Add task(s)")
    print("2. View tasks")
    print("3. Mark tasks as completed")
    print("4. Exit")
    return input("Enter your choice: ")

# Initialize an empty list to store tasks
tasks = []

# Start an infinite loop to keep the program running until the user chooses to exit
while True:
    # Call the function to display the menu and get the user's choice
    choice = display_menu()

    # Use if-elif-else statements to handle different choices
    if choice == '1':
        # Option to add tasks
        input_tasks = input("Enter the task(s) you'd like to add, separated by commas: ")
        # Split the input string by commas, remove any extra spaces, and add each task to the tasks list
        tasks_to_add = [task.strip() for task in input_tasks.split(',')]
        for task in tasks_to_add:
            tasks.append(task)
            print(f"{task} added.")
    elif choice == '2':
        # Option to view tasks
        if not tasks:
            print("Your to-do list is empty.")
        else:
            print("\nYour tasks:\n")
            for index, task in enumerate(tasks, start=1):
                print(f"{index}. {task}")
            print()
    elif choice == '3':
        # Option to mark tasks as completed
        if not tasks:
            print("Your to-do list is empty.")
        else:
            print("Enter the numbers of the tasks you have completed, separated by spaces (e.g., 1 3):")
            for index, task in enumerate(tasks, start=1):
                print(f"{index}. {task}")
            completed_tasks = input().split()
            completed_tasks = sorted([int(num) for num in completed_tasks], reverse=True)
            for task_number in completed_tasks:
                if 1 <= task_number <= len(tasks):
                    tasks.pop(task_number - 1)
                    print(f"Task {task_number} has been marked as completed and removed from the list.")
                else:
                    print(f"Invalid task number: {task_number}. No such task.")
    elif choice == '4':
        # Option to exit the program
        print("Exiting...")
        break
    else:
        # Handle invalid choices
        print("Invalid choice. Please enter a number between 1 and 4.")
