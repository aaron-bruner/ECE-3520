/**
 * 
 * SDE1 Spring 2022 Prolog
 * 
 * Flower bed rules: 
 *
 * 1) Beds are in a straight line, so each bed has two adjacent beds.  Beds are
 *    numbered 1 .. N, N is at least 4 and should be even. Bed i is adjacent to
 *    beds i-1 and i+1 (except beds 1 and N, of course).
 *
 * 2) Only one bed can have a given type of flower - available flowers are listed
 *    in the flower predicate.
 *
 * 3) Flowers have Name, Size, Wet/Dry, Color.
 *
 * 4) No two adjacent beds can have the same color flower.
 *
 * 5) No two adjacent beds can have flowers whose size is more than one size
 *    difference.  Sizes are small, med and tall so small next to small is fine,
 *    small next to medium is fine, but small next to tall is not.
 *
 * 6) the two outermost beds (1 and N) are dry, the two innermost are wet, the
 *    ones in between (if there are any) can take either.  For example, if there
 *    were 8 beds the layout would be D E E W W E E D where D is dry, E is either,
 *    and W is wet.
 * 
 * Turn in results:
 * - Code (this file)
 * - log file (protocol command in swipl)
 **/

flower(daisies, med, wet, yellow).
flower(roses, med, dry, red).
flower(petunias, med, wet, pink).
flower(daffodils, med, wet, yellow).
flower(begonias, tall, wet, white).
flower(snapdragons, tall, dry, red).
flower(marigolds, short, wet, yellow).
flower(gardenias, med, wet, red).
flower(gladiolas, tall, wet, red).
flower(bird_of_paradise, tall, wet, white).
flower(lilies, short, dry, white).
flower(azalea, med, dry, pink).
flower(buttercup, short, dry, yellow).
flower(poppy, med, dry, red).
flower(crocus, med, dry, orange).
flower(carnation, med, wet, white).
flower(tulip, short, wet, red).
flower(orchid, short, wet, white).
flower(chrysanthemum, tall, dry, pink).
flower(dahlia, med, wet, purple).
flower(geranium, short, dry, red).
flower(lavender, short, dry, purple).
flower(iris, tall, dry, purple).
flower(peonies, short, dry, pink).
flower(periwinkle, med, wet, purple).
flower(sunflower, tall, dry, yellow).
flower(violet, short, dry, purple).
flower(zinnia, short, wet, yellow).

/* 
You must write the bedplan() predicate - it binds each argument (which represent
beds) to one of the flowers listed above.  You will almost certainly want to
write a few helper predicates to make the code less redundant and easier to read.
You must have some write goals at the end to show each assigned flower AND its attributes - this will make debugging (and grading) easier.
You are to do this in stages:
1) implement the predicate to simply assign different flowers to the beds.
2) add the color criteria so no adjacent beds have the same color.
3) add the wet criteria - beds 1 and 4 are dry, 2 and 3 are wet.
4) finally add the size criteria.
5) increase to 6 beds.
You should show each of these steps including the code, and the results.  If
there are multiple answers, show this (you don't have to show all if there are
a lot).  In the last step modify the code for a 6 bed layout and demonstrate
that works as well.
*/

% STAGE 1: Simply assign different flowers to the beds
/* bedplan(F1,F2,F3,F4) :- 
     F1 = tulip,
     F2 = iris,
     F3 = sunflower,
     F4 = periwinkle.*/

% STAGE 2: Add the color criteria
/* different(C1, C2) :- C1 \== C2.

 bedplan(F1, F2, F3, F4) :-

%     % The assigned flowers and their properties
     flower(F1, S1, W1, C1),
     flower(F2, S2, W2, C2),
     flower(F3, S3, W3, C3),
     flower(F4, S4, W4, C4),

     % Enfoce that color must be different
     different(C1, C2),
     different(C2, C3),
     different(C3, C4).*/

% STAGE 3: Enforce the wet/dry requirements
/* different(C1, C2) :- C1 \== C2.

 bedplan(F1, F2, F3, F4) :-

     % The assigned flowers and their properties
     flower(F1, S1, dry, C1),
     flower(F2, S2, wet, C2),
     flower(F3, S3, wet, C3),
     flower(F4, S4, dry, C4),

     % Enfoce that color must be different
     different(C1, C2),
     different(C2, C3),
     different(C3, C4).*/

% STAGE 4: Add the size constraints
/*different(C1, C2) :- C1 \== C2.

% Set size adjacency
adj(short, med).
adj(med, tall).

adjacent(A, B) :- adj(A, B).
adjacent(A, B) :- adj(B, A).

bedplan(F1, F2, F3, F4) :-

    % The assigned flowers and their properties
    flower(F1, S1, W1, C1),
    flower(F2, S2, W2, C2),
    flower(F3, S3, W3, C3),
    flower(F4, S4, W4, C4),

    % Enforce wet/dry expectations
    W1 == dry,
    W2 == wet,
    W3 == wet,
    W4 == dry,

    % Enforce that color must be different
    different(C1, C2),
    different(C2, C3),
    different(C3, C4),

    % Enforce size adjacency
    adjacent(S1, S2),
    adjacent(S2, S3),
    adjacent(S3, S4),

    % print out matching
    write("Bedplan: \n"),
    write(F1), write("\t"), write(S1), write("\t"), write(W1), write("\t"), write(C1), write("\n"),
    write(F2), write("\t"), write(S2), write("\t"), write(W2), write("\t"), write(C2), write("\n"),
    write(F3), write("\t"), write(S3), write("\t"), write(W3), write("\t"), write(C3), write("\n"),
    write(F4), write("\t"), write(S4), write("\t"), write(W4), write("\t"), write(C4), write("\n").*/



% STAGE 5: Increase bed size to 6
different(C1, C2) :- C1 \== C2.
differentTwo(M1, U2, U3, U4, U5, U6) :- M1 \== U2, M1 \== U3, M1 \== U4, M1 \== U5, M1 \== U6.
%wetDry(W2) :- W2 = wet; W2 = dry.

% Set size adjacency
adj(short, med).
adj(med, tall).

adjacent(A, B) :- adj(A, B).
adjacent(A, B) :- adj(B, A).

bedplan(F1, F2, F3, F4, F5, F6) :-

    % The assigned flowers and their properties
    flower(F1, S1, W1, C1),
    flower(F2, S2, W2, C2),
    flower(F3, S3, W3, C3),
    flower(F4, S4, W4, C4),
    flower(F5, S5, W5, C5),
    flower(F6, S6, W6, C6),

    % Enforce wet/dry expectations
    W1 == dry,
    %W2 == wetDry(W2), %wet or dry
    W3 == wet,
    W4 == wet,
    %W5 == wetDry(W5), %wet or dry
    W6 == dry,

    % Enforce that color must be different
    different(C1, C2),
    different(C2, C3),
    different(C3, C4),
    different(C4, C5),
    different(C5, C6),

    % Enforce different flower rule
    differentTwo(F1, F2, F3, F4, F5, F6),
    differentTwo(F2, F1, F3, F4, F5, F6),
    differentTwo(F3, F2, F1, F4, F5, F6),
    differentTwo(F4, F2, F3, F1, F5, F6),
    differentTwo(F5, F2, F3, F4, F1, F6),
    differentTwo(F6, F2, F3, F4, F5, F1),

    % Enforce size adjacency
    adjacent(S1, S2),
    adjacent(S2, S3),
    adjacent(S3, S4),
    adjacent(S4, S5),
    adjacent(S5, S6),

    % print out matching
    write("Bedplan: \n"),
    write(F1), write("\t"), write(S1), write("\t"), write(W1), write("\t"), write(C1), write("\n"),
    write(F2), write("\t"), write(S2), write("\t"), write(W2), write("\t"), write(C2), write("\n"),
    write(F3), write("\t"), write(S3), write("\t"), write(W3), write("\t"), write(C3), write("\n"),
    write(F4), write("\t"), write(S4), write("\t"), write(W4), write("\t"), write(C4), write("\n"),
    write(F5), write("\t"), write(S5), write("\t"), write(W5), write("\t"), write(C5), write("\n"),
    write(F6), write("\t"), write(S6), write("\t"), write(W6), write("\t"), write(C6), write("\n").