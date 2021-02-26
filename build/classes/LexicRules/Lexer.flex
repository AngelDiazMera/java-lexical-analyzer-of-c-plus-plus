package LexicRules;
import static LexicRules.Tokens.*;
%%
%class Lexer
%type Tokens
letter=[a-zA-Z]+
digit=[0-9]+
space=[ ,\t,\r,\n]+
special=[{,},(,),.,:,;,#,$,&,*,/,-,+,%,<,>]
%{
    public String lexeme;
%}
%%
auto | break | case | char | const | continue | default | do | double | else | 
enum | extern | float | for | goto | if | int | long | register | return | 
short | signed | sizeof | static | struct | switch | typedef | union | 
unsigned | void | volatile | while | cout | cin     {lexeme=yytext(); return Keyword;}
{space}   {/*Ignore*/}
"//".*      {/*Ignore*/}
"#include <iostream>;"   {/*Ignore*/}
"#define"{space}+{letter}({letter}|{digit})*{space}+{digit}(";"|{space})*    {/*Ignore*/}

"MAX" {lexeme = Integer.toString(100000); return Number;}


("{"|"}"|"("|")"|"["|"]"|","|"."|";"|":"|"..."|"#") {lexeme=yytext(); return Special;}
("="|"+="|"-="|"*="|"/="|"&="|"<<="|">>="|"^=")     {lexeme=yytext(); return Operator;}
("+"|"-"|"++"|"--"|"*"|"/"|"%"|"<<"|">>"|"&"|"^"|"|")  {lexeme=yytext(); return Operator;}
("&&"|"||"|"!"|"<"|">"|"<="|">="|"=="|"!="|"?"|"::") {lexeme=yytext(); return Operator;}
{letter}({letter}|{digit})*                         {lexeme=yytext(); return Identifier;}
("(-"{digit}+")")|{digit}+"."{digit}+|{digit}+      {lexeme=yytext(); return Number;}
"\""({letter}|{digit}|{space}|{special}|","|"["|"]"})*"\""  {lexeme=yytext(); return Literal;}
 . {return ERROR;}