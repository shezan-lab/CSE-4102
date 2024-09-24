input = input.txt
output = output.txt

main:
	bison -d cal2.y
	flex cal2.l
	gcc cal2.tab.c lex.yy.c
	./a <$(input)>$(output)
	
#	a  $(input) > $(output)
#	./a  
#< $(input) > $(output)
