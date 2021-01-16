import pickle
import pathlib

todo = []
todo_exists = False

def err():
	print("Todo not found.")
	exit()

if pathlib.Path("todo.bin").exists():
	todo_read = open("todo.bin", "rb")
	todo_list = pickle.load(todo_read)
	todo = todo_list.copy()
	todo_exists = len(todo_list) >= 1
	if todo_list != []:
		print()
	for disp_todo in range(0, len(todo_list)):
		print(f"\t{disp_todo + 1}. {todo_list[disp_todo]}")
	todo_read.close()

print("\n1. Enter a new todo.")
if todo_exists:
	print("2. Edit a todo.")
	print("3. Delete a todo.")

try:
	choice = input("\nMake a choice: ")
	if choice == "1":
		ask_todo = input("Enter a new todo: ")
		todo.append(ask_todo)

	if choice == "2" and todo_exists:
		ask_num = int(input("Enter todo number to edit: "))
		if ask_num - 1 > len(todo_list):
			err()
		ask_new_todo = input("Enter new replacement todo: ")
		todo[ask_num - 1] = ask_new_todo

	if choice == "3" and todo_exists:
		ask_del_num = int(input("Enter todo number to delete: "))
		if ask_del_num - 1 > len(todo_list):
			err()
		del todo[ask_del_num - 1]
except KeyboardInterrupt:
	print()
	exit()

todo_write = open("todo.bin", "wb")
pickle.dump(todo, todo_write)
todo_write.close()
