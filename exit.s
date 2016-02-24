#PURPOSE:	Simple program that exits and returns a status code to the kernel

#INPUT:		none

#OUTPUT:	return a status code. This can be viewed by typing echo $? 
#		after running the program.

#VARIABLES:	
#		%eax always holds the system call number
#		(this is always the case)

#		%ebx holds the retun status

.section .data

.section .text

.globl _start

_start:
movl $010, %eax	# this is the linux kernel command number for exiting the program

movl $10, %ebx	# this is the status code that we would return
		# to the operating system. Change this around to return different
		# different things to echo $?

int $0x80	# this wakes up the kernel to run the exit command


