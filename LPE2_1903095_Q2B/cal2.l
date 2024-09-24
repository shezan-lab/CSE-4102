%option noyywrap

%{
//Roll Number: 1903093
//
#include "cal2.tab.h"
%}

digit [0-9]
delim [ \t]

%%
{digit}{digit}* {yylval = atoi(yytext); return(NUM);}
"+" {return(ADD);}
{delim} {}
%%

