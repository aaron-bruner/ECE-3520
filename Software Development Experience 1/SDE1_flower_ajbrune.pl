/*  ECE-3520 : Programming Systems
    SDE1     : Spring 2022
    ajbrune
    C16480080
 */

% All avaliable flowers -> NAME, SIZE, WET/DRY, COLOR
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

%       -- Used globally --
different(D1, D2) :- D1 \== D2.        % D1 != D2       |       We can reuse this
differentTwo(M1, U2, U3, U4, U5, U6) :- M1 \== U2, M1 \== U3, M1 \== U4, M1 \== U5, M1 \== U6.
% Enforce rule 5 (No two adjacent beds can have flowers whose size is more than one size difference)
adj(short, med).
adj(med, tall).
adjacent(A, B) :- adj(A, B).
adjacent(A, B) :- adj(B, A).

% Stage 1 - Implement the predicate to simply assign different flowers to the beds
/*
    % Assign flowers with whatever attributes
    bedplan(F1, F2, F3, F4) :- 
     write('Stage 1 Bedplan:'),
     F1 = daisies,  
     F2 = petunias,
     F3 = chrysanthemum,
     F4 = zinnia.
*/
% Stage 2 - Add the color criteria so no adjacent beds have the same color
/*
    bedplan(F1, F2, F3, F4) :-
        write("Stage 2 Bedplan(s):"),nl,
        % Assign flowers and their attributes
        flower(F1, _, _, C1),
        flower(F2, _, _, C2),   %   Singleton Variables are replaced with underscores
        flower(F3, _, _, C3),
        flower(F4, _, _, C4),

        % Enforce rule 4 (No same colors)
        different(C1, C2),
        different(C2, C3),
        different(C3, C4),

        format('~w~5| ~t',C1),
        format('~w~5| ~t',C2),
        format('~w~5| ~t',C3),
        format('~w~5| ~t',C4).
*/
% Stage 3 - Add the wet criteria - beds 1 and 4 are dry, 2 and 3 are wet
/*
    bedplan(F1, F2, F3, F4) :-
        write("Stage 3 Bedplan(s):"),nl,
        % Ensure that F1, F2, F3, and F4 are DRY, WET, WET, and DRY in that order.
        flower(F1, _, WD1, C1),
        flower(F2, _, WD2, C2),
        flower(F3, _, WD3, C3),
        flower(F4, _, WD4, C4),

        WD1 == dry,
        WD2 == wet,
        WD3 == wet,
        WD4 == dry,

        % Enforce rule 4 (No same colors)
        different(C1, C2),
        different(C2, C3),
        different(C3, C4),

        format('~w~3| ~t',WD1),
        format('~w~3| ~t',WD2),
        format('~w~3| ~t',WD3),
        format('~w~3| ~t',WD4).
*/
% Stage 4 - Add the size criteria
/*
    bedplan(F1, F2, F3, F4) :-
        write("Stage 4 Bedplan(s):"),nl,
        % Assign flowers and their attributes
        flower(F1, S1, dry, C1),
        flower(F2, S2, wet, C2),
        flower(F3, S3, wet, C3),
        flower(F4, S4, dry, C4),

        % Enforce rule 4 (No same colors)
        different(C1, C2),
        different(C2, C3),
        different(C3, C4),

        % Enforce rule 5 (No two adjacent beds can have flowers whose size is more than one size difference)
        adjacent(S1, S2),
        adjacent(S2, S3),
        adjacent(S3, S4),

        format('~w~4| ~t',S1),
        format('~w~4| ~t',S2),
        format('~w~4| ~t',S3),
        format('~w~4| ~t',S4).
*/
% Stage 5 - Increase bed size to 6

    bedplan(F1, F2, F3, F4, F5, F6) :-
        write("Stage 5 Bedplan(s):"),nl,
        % The assigned flowers and their properties
        flower(F1, S1, WD1, C1),
        flower(F2, S2, WD2, C2),
        flower(F3, S3, WD3, C3),
        flower(F4, S4, WD4, C4),
        flower(F5, S5, WD5, C5),
        flower(F6, S6, WD6, C6),

        WD1 == dry,
        WD2 == wet,
        %WD3 can be anything
        %WD4 can be anything
        WD5 == wet,
        WD6 == dry,

        % Enforce rule 4 (No same colors)
        different(C1, C2),
        different(C2, C3),
        different(C3, C4),
        different(C4, C5),
        different(C5, C6),

        % Ensure that there are no overalpping flowers
        differentTwo(F1, F2, F3, F4, F5, F6),
        differentTwo(F2, F1, F3, F4, F5, F6),
        differentTwo(F3, F2, F1, F4, F5, F6),
        differentTwo(F4, F2, F3, F1, F5, F6),
        differentTwo(F5, F2, F3, F4, F1, F6),
        differentTwo(F6, F2, F3, F4, F5, F1),

        % Enforce rule 5 (No two adjacent beds can have flowers whose size is more than one size difference)
        adjacent(S1, S2),
        adjacent(S2, S3),
        adjacent(S3, S4),
        adjacent(S4, S5),
        adjacent(S5, S6),

    format('~w~5| ~t',S1), format('~w~5| ~t',WD1), format('~w~5| ~t',C1), nl,
    format('~w~5| ~t',S2), format('~w~5| ~t',WD2), format('~w~5| ~t',C2), nl,
    format('~w~5| ~t',S3), format('~w~5| ~t',WD3), format('~w~5| ~t',C3), nl,
    format('~w~5| ~t',S4), format('~w~5| ~t',WD4), format('~w~5| ~t',C4), nl,
    format('~w~5| ~t',S5), format('~w~5| ~t',WD5), format('~w~5| ~t',C5), nl,
    format('~w~5| ~t',S6), format('~w~5| ~t',WD6), format('~w~5| ~t',C6), nl.

/*%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 * Flower bed rules: 
 * 1) Beds are in a straight line, so each bed has two adjacent beds.  Beds are
 *    numbered 1 .. N, N is at least 4 and should be even. Bed i is adjacent to
 *    beds i-1 and i+1 (except beds 1 and N, of course).
 * 2) Only one bed can have a given type of flower - available flowers are listed
 *    in the flower predicate.
 * 3) Flowers have Name, Size, Wet/Dry, Color.
 * 4) No two adjacent beds can have the same color flower.
 * 5) No two adjacent beds can have flowers whose size is more than one size
 *    difference.  Sizes are small, med and tall so small next to small is fine,
 *    small next to medium is fine, but small next to tall is not.
 * 6) the two outermost beds (1 and N) are dry, the two innermost are wet, the
 *    ones in between (if there are any) can take either.  For example, if there
 *    were 8 beds the layout would be D E E W W E E D where D is dry, E is either,
 *    and W is wet.
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/