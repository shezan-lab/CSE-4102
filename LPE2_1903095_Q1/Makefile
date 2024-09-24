input = input.txt
output = output.txt

main: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c
	a <$(input)> $(output)

assembler:
	D:\masm32\bin\ml /c /coff /Cp Q1.asm && D:\masm32\bin\link -entry:main /subsystem:console Q1.obj .&& \Q1.exe
