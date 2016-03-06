#PURPOSE:	Find the max number in a list

#VARIALBES:
#		$edi - Holds the index of data being examined
#		%ebx - Larest fdata item found
#		%eax - Current data item

# The following memory location are used
#		data_items - contains the data item. A 0 is used to
#		termimate data.

.section .data

#data_items:	# These are the data items.
.globl data_items

data_items: .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text

.globl _start

_start:
movl $0, %edi				#move 0 into index register
movl $0, %ecx
movl data_items(,%edi,4), %eax		#load the forst byte of data
movl %eax, %ebx				#since this is the first item, 
					#%eax is the biggest

start_loop:
cmpl $14, %ecx				#check to see if we have hit the end
jge loop_exit
incl %edi
incl %ecx				#increment edi by 1
movl data_items(,%edi, 4),%eax		#load the next value
cmpl %ebx, %eax				#jump to loop start if the value is
jle start_loop				#eax is less or equal
movl %eax,%ebx
jmp start_loop				#jump to loop start

loop_exit:
movl $1, %eax				#$1 for exit call, since %ebx already has the result
int $0x80
