:- set_prolog_flag(verbose, silent).
:- initialization(main).

main :-
    format('Example script~n'),
    current_prolog_flag(argv, Argv),
    format('Called with ~q~n', [Argv]),
    halt.

main :-
    halt(1).
