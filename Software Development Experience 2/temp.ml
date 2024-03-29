#use "sde2.caml";;

print_endline "Test Case: first_duplicate function...";;

first_duplicate [6;5;53;39;65;61;40;30;47;14;64;58;59;63;51;42;29;50;8;32;4;17];;
first_duplicate [55;33;51;118;79;30;20;8;12;27;34;2;36;67;11;54;103;92;62;16;57;57;58;68;0;18;0;109;36;87;28;75;49;24;32;116;39;11;83;54];;

print_endline "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-";;
print_endline "Test Case: first_nonrepeating function...";;

first_nonrepeating [50;42;12;72;13;5;55;77;32;41;34;15;33;48;17;16;13;50;48;7;68;38;71;70;26;30;55];;
first_nonrepeating [19;48;69;8;1;62;43;11;62;69;31;55;91;47;12;52;10;52;15;86;81;52;29;97;3;26;46;4;57;55;71;79;63];;

print_endline "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-";;
print_endline "Test Case: sumOfTwo function...";;

sumOfTwo([36;46;15;41;18;21;51;14;34;58;12;33;56;26;43;46;60;47;48;12;20],[48;6;53;39;45;16;40;49;48;22;36;62;34;35;5;1;30;4;25;0;57],125);;
sumOfTwo([49;20;64;9;51;21;16;42;56;62;6;35;54;35;25;62;24;63;65;26;12;33],[44;12;42;54;55;54;2;53;17;12;40;5;35;54;3;43;52;48;32;58;26;29],87);;

print_endline "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-";;
print_endline "Test Case: cyk_sublists function...";;

cyk_sublists(11);;
cyk_sublists(14);;