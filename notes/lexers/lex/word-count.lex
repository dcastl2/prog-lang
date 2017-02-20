 int num_lines = 0, num_chars = 0, num_words = 0;

%%
\n	       ++num_lines; ++num_chars;
[a-zA-Z]+  ++num_words; num_chars += strlen(yytext);
.	         ++num_chars;

%%
int main ()
	{
	yylex ();
	printf ("%d %d %d\n", num_lines, num_words, num_chars);
	return 0;
	}

