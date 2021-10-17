# Performs find n-th fibonacci number and binary search.
# It was created on October 17, 2021.

# Written by Orhan Ozan Yildiz.
import numpy as np


def Fibonacci(order):
	# The fibonacci sequence begins from the first term so it can't be 0.
	if order <= 0:
		print("Please enter a valid number.")
	# The first fibonacci term is 0.
	elif order == 1:
		return 0
	# The second fibonacci term is 1.
	elif order == 2:
		return 1
	else:
		# The Fibonacci sequence is a series of numbers where a number is the addition of
		# the last two numbers.
		return Fibonacci(order - 1) + Fibonacci(order - 2)


# Binary_Search(A, n) is
# L := 0
# mid := (L + H) / 2
# T := A[mid]
# R := n − 1
# while L ≤ R do
#     m := floor((L + R) / 2)
#     if A[m] < T then
#         L := m + 1
#     else if A[m] > T then
#         R := m − 1
#     else:
#         return m
# return unsuccessful
def BinarySearch(numbersList, keyValue):
	index_num = 0
	iteration_number = 0
	low = 0
	# Specify high is the number of elements minus 1.
	high = len(numbersList) - 1
	# Firstly we specify found equal to 'False'.
	is_found = False
	# Binary search algorithm is working while low <= high and not Found.
	# start_time = time.time()
	while low <= high and not is_found:
		iteration_number += 1
		mid = (low + high) // 2
		# If key equals to mid value,'Found' becomes True.
		if keyValue == numbersList[mid]:
			index_num = mid
			is_found = True
		# If key bigger than mid value,low value equals to mid value plus one.
		elif keyValue > numbersList[mid]:
			low = mid + 1
		# Otherwise high value equals to mid value minus one.
		else:
			high = mid - 1
	# end_time = time.time()
	# If Found equal to True,we print 'Found'.
	if is_found:
		# processes_time = end_time - start_time
		print("Found.")
		print(f"Found on the {iteration_number}th search. ")
		# print(f"Finding the number took {processes_time} seconds. ")
		print("Index Number:", index_num + 1)
	# If Found equal to not True,we print 'NOT Found'.
	else:
		print("The number you are looking for was not found in the list.")


def check_option_input():
	while True:
		reader = input()
		if reader == '1' or reader == '2' or reader == '3':
			break
		else:
			print("The entered value is not valid. Please select 1, 2 or 3 values.")
	return reader


# Press 3 to exit.
repeat_main = True
while repeat_main:
	# User menu screen.
	print("""
Please choose one:
Press 1 Fibonacci,
Press 2 Binary search, or
Press 3 Exit.
""")
	choice = check_option_input()

	# If user choose 0,the button becomes 0 so algorithm stops.
	if choice == '3':
		print("Program terminated ")
		repeat_main = False

	# If user choose 1,the fibonacci algorithm is working.
	elif choice == '1':
		try:
			# The user enters the number they want to be found and this value is printed on the screen.
			nth = int(input("What order of fibonacci number do you want:  "))
			print(f"{nth}th fibonacci number is {Fibonacci(nth)}")

			# A file is created on your computer for the print result. The Fibonacci value is printed to the generated file.
			file_txt = open("fibonacci.txt", "w")
			print(f"{nth}th fibonacci number:", Fibonacci(nth), file=file_txt)
			file_txt.close()
		# If you enter invalid character,it gives alert.
		except ValueError:
			print("You entered the undefined character.\nPlease, enter a valid number.")
	# If user choose 2,the binary search algorithm is working.
	elif choice == '2':
		try:
			# Showing options for the user to choose.
			print("""
Please choose which action you want to perform: 
press 1, you will enter random, 
press 2, you will enter manually, or 
press 3, the program will end. 
			""")

			option = check_option_input()

			# If user choose 1,the binary search algorithm work with random array.
			if option == '1':
				minimum_value = int(input("minimum value:"))
				maximum_value = int(input("maximum value :"))
				array_size = int(input("array size :"))

				# Create random list.
				numberList = np.random.randint(minimum_value, maximum_value, size=array_size)

				print("Unsorted List: \n", numberList)
				numberList.sort()
				print("Sorted List: \n", numberList)

				# Determine the key value for binary search.
				key = int(input("Enter the key: "))
				# Call BinarySearch() function.
				BinarySearch(numberList, key)

			# If user choose 2,the binary search algorithm work with by the numbers we choose.
			elif option == '2':
				# Create empty list.
				numberList = list()
				# Determine the size of array.
				size = int(input("Please decide what size the array will be:"))

				# Generate array.
				index = 0
				for k in range(0, size):
					index += 1
					# Users enter the numbers for the list.
					number = int(input(f"Number {index}:"))
					numberList.append(number)
					numberList.sort()
					# Print sorted list.
					print("Sorted list:", numberList)
				# Determine key for binary search.
				key = int(input("Enter the key: "))

				# Call BinarySearch() function.
				BinarySearch(numberList, key)
		# If you enter invalid character,it gives alert.
		except ValueError:
			print("You entered the undefined character.\nPlease, enter a valid number.")
	# If user choose except of 0,1 or 2,the algorithm is NOT working and it gives alert.
	else:
		print("Please select 1(Fibonacci), 2(BinarySearch) or 3(Exit). ")
