/*
 * tetrisProlog
 * Laboratorio 2 Paradigmas de programación (2 - 2018).
 * Fecha de entrega: 7 de Diciembre.
 *
 * Requerimientos Mínimos:
 * - createBoard -> Listo
 * - checkBoard -> Falta contar las piezas
 * - nextPiece -> Listo
 * - play -> No lo he empezado
 * - checkHorizontalLines -> No lo he empezado
 * - boardToString -> No lo he empezado
 */
% Dominios


% Predicados


% Metas


% Clausulas de Horn

% -_-_-_-_-_-_-_TDA Pieza_-_-_-_-_-_-_-
% Piezas iniciales sin ningún giro:
%   1) 11  2) 2   3)  3    4)  44   5)  5   6)  6   7)  77
%      11     2      333      44        5       6      77
%             22                        5      66
%                                       5

% Hechos
pieza(1, 0, [[1, 0], [0, 0], [0, 1], [1, 0], [1, 1]]).

pieza(2, 0, [[2, 0], [0, 0], [0, 1], [1, 0], [2, 0]]).
pieza(2, 1, [[2, 1], [0, 0], [0, 1], [0, 2], [1, 2]]).
pieza(2, 2, [[2, 2], [0, 1], [1, 1], [2, 0], [2, 1]]).
pieza(2, 3, [[2, 3], [0, 0], [1, 0], [1, 1], [1, 2]]).

pieza(3, 0, [[3, 0], [0, 0], [0, 1], [0, 2], [1, 1]]).
pieza(3, 1, [[3, 1], [0, 1], [1, 0], [1, 1], [2, 1]]).
pieza(3, 2, [[3, 2], [0, 1], [1, 0], [1, 1], [1, 2]]).
pieza(3, 3, [[3, 3], [0, 0], [1, 0], [1, 1], [2, 0]]).

pieza(4, 0, [[4, 0], [0, 0], [0, 1], [1, 1], [1, 2]]).
pieza(4, 1, [[4, 1], [0, 1], [1, 0], [1, 1], [2, 0]]).

pieza(5, 0, [[5, 0], [0, 0], [1, 0], [2, 0], [3, 0]]).
pieza(5, 1, [[5, 1], [0, 0], [0, 1], [0, 2], [0, 3]]).

pieza(6, 0, [[6, 0], [0, 0], [0, 1], [1, 1], [2, 1]]).
pieza(6, 1, [[6, 1], [0, 2], [1, 0], [1, 1], [1, 2]]).
pieza(6, 2, [[6, 2], [0, 0], [1, 0], [2, 0], [2, 1]]).
pieza(6, 3, [[6, 3], [0, 0], [0, 1], [0, 2], [1, 0]]).

pieza(7, 0, [[7, 0], [0, 1], [0, 2], [1, 0], [1, 1]]).
pieza(7, 1, [[7, 1], [0, 0], [1, 0], [1, 1], [2, 1]]).

% Reglas
% Constructor
crearPieza(IdPieza, Salida):-
    IdPieza >= 1, IdPieza =< 7, pieza(IdPieza, 0, Salida), !.

% Pertenencia
esPieza([[IdPieza, Giros]|_]):-
    IdPieza >= 1, IdPieza =< 5, Giros >= 0, Giros =< 3.

% Selectores
getIdPieza([[IdPieza, _]|_], Salida):-
    Salida is IdPieza.

getCantidadDeGiros([[_, Giros]|_], Salida):-
    Salida is Giros.

% Modificadores
girarPieza([[IdPieza, Giros]|_], Salida):-
    pieza(IdPieza, _, _), IdPieza = 1, pieza(IdPieza, _, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 2, Giros < 3, NuevoGiro is Giros + 1, pieza(IdPieza, NuevoGiro, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 2, Giros = 3, pieza(IdPieza, 0, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 3, Giros < 3, NuevoGiro is Giros + 1, pieza(IdPieza, NuevoGiro, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 3, Giros = 3, pieza(IdPieza, 0, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 4, Giros = 0, pieza(IdPieza, 1, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 4, Giros = 1, pieza(IdPieza, 0, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 5, Giros = 0, pieza(IdPieza, 1, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 5, Giros = 1, pieza(IdPieza, 0, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 6, Giros < 3, NuevoGiro is Giros + 1, pieza(IdPieza, NuevoGiro, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 6, Giros = 3, pieza(IdPieza, 0, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 7, Giros = 0, pieza(IdPieza, 1, Salida), !;
    pieza(IdPieza, _, _), IdPieza = 7, Giros = 1, pieza(IdPieza, 0, Salida), !.

% Operadores
% No Hay

% -_-_-_-_-_-_-_TDA Tablero_-_-_-_-_-_-_-
% Estos son los tableros ya incluidos en la base de conocimientos.
/*
1) Tablero 5x10, 3 piezas: 2, 4 y 5.
|- - - - -|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|5 0 0 0 0|
|5 2 4 0 0|
|5 2 4 4 0|
|5 2 2 4 0|
|- - - - -|

2) Tablero 5x10, 6 piezas: 2, 3, 3, 4, 5 y 6.
|- - - - -|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 2 0|
|0 2 2 2 0|
|5 3 6 6 6|
|5 3 3 4 6|
|5 3 3 4 4|
|5 3 3 3 4|
|- - - - -|

3) Tablero 5x10, 9 piezas: 1, 3, 4 y 5 (Faltan piezas, tablero no valido).
|- - - - -|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 0 0|
|0 0 0 4 0|
|0 0 5 4 4|
|0 3 5 0 4|
|3 3 5 1 1|
|0 3 5 1 1|
|- - - - -|

4) Tablero 10x12, 5 piezas: 1, 1, 3, 4 y 5.
|- - - - - - - - - -|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0|
|0 1 1 4 0 0 0 0 0 0|
|0 1 1 4 4 0 3 0 1 1|
|5 5 5 5 4 3 3 3 1 1|
|- - - - - - - - - -|

5) Tablero 10x12(Tablero no valido, 12x12), 8 piezas:
|- - - - - - - - - - - -|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 7 0 0 0 2 0 0 0|
|5 0 0 0 7 7 0 0 2 0 0 0|
|5 0 0 0 6 7 0 0 2 2 4 0|
|5 1 1 0 6 0 3 0 1 1 4 4|
|5 1 1 6 6 3 3 3 1 1 0 4|
|- - - - - - - - - - - -|

6) Tablero 20x20, 10 piezas:
|- - - - - - - - - - - - - - - - - - - -|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 0 0 6 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 0 0 0 4 4 6 0 0 0 0 0 0 0 0 0 0 0 0 0|
|0 1 1 4 4 6 6 0 2 2 0 5 0 3 0 7 0 5 0 6|
|0 1 1 0 2 2 0 4 4 2 5 5 3 3 3 7 7 5 0 6|
|0 5 5 5 5 2 4 4 0 2 5 5 6 2 2 2 7 5 6 6|
|1 1 0 0 0 2 1 1 0 0 5 5 6 2 7 7 3 5 1 1|
|1 1 0 0 0 0 1 1 0 0 5 6 6 7 7 3 3 3 1 1|
|- - - - - - - - - - - - - - - - - - - -|
*/

% Hechos

% Tablero 1
tablero(5, 10, 3, [5, 10, 3, [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [5, 0, 0, 0, 0],
    [5, 2, 4, 0, 0],
    [5, 2, 4, 4, 0],
    [5, 2, 2, 4, 0]]]).

% Tablero 2
tablero(5, 10, 6, [5, 10, 6, [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 2, 0],
    [0, 2, 2, 2, 0],
    [5, 3, 6, 6, 6],
    [5, 3, 3, 4, 6],
    [5, 3, 3, 4, 4],
    [5, 3, 3, 3, 4]]]).

% Tablero 3
tablero(5, 10, 9, [5, 10, 9, [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 4, 0],
    [0, 0, 5, 4, 4],
    [0, 3, 5, 0, 4],
    [3, 3, 5, 1, 1],
    [0, 3, 5, 1, 1]]]).

% Tablero 4
tablero(10, 12, 5, [10, 12, 5, [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 4, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 4, 4, 0, 3, 0, 1, 1],
    [5, 5, 5, 5, 4, 3, 3, 3, 1, 1]]]).

% Tablero 5
tablero(10, 12, 8, [10, 12, 8, [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 7, 0, 0, 0, 2, 0, 0, 0],
    [5, 0, 0, 0, 7, 7, 0, 0, 2, 0, 0, 0],
    [5, 0, 0, 0, 6, 7, 0, 0, 2, 2, 4, 0],
    [5, 1, 1, 0, 6, 0, 3, 0, 1, 1, 4, 4],
    [5, 1, 1, 6, 6, 3, 3, 3, 1, 1, 0, 4]]]).

%Tablero 6
tablero(20, 20, 10, [20, 20, 10, [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 4, 4, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 1, 4, 4, 6, 6, 0, 2, 2, 0, 5, 0, 3, 0, 7, 0, 5, 0, 6],
    [0, 1, 1, 0, 2, 2, 0, 4, 4, 2, 5, 5, 3, 3, 3, 7, 7, 5, 0, 6],
    [0, 5, 5, 5, 5, 2, 4, 4, 0, 2, 5, 5, 6, 2, 2, 2, 7, 5, 6, 6],
    [1, 1, 0, 0, 0, 2, 1, 1, 0, 0, 5, 5, 6, 2, 7, 7, 3, 5, 1, 1],
    [1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 5, 6, 6, 7, 7, 3, 3, 3, 1, 1]]]).

% Reglas
% Constructor
createBoard(N, M, GamePieces, _, Board):-
    tablero(N, M, GamePieces, _), tablero(N, M, GamePieces, Board), !.

% Pertenencia
checkBoard([Ancho, Alto, _, ListaPiezas]):-
    medirAncho(Ancho, ListaPiezas), medirAlto(Alto, ListaPiezas).

medirAncho(_,[]):- !.
medirAncho(Ancho,[X|Xs]):-
    medir(X, Cantidad), Cantidad is Ancho, medirAncho(Ancho, Xs).

medirAlto(Alto, ListaPiezas):-
    medir(ListaPiezas, Cantidad), Cantidad is Alto.

medir([], 0):- !.
medir([_|Xs], Cantidad):-
    medir(Xs, CantidadAnterior), Cantidad is CantidadAnterior + 1.

agregar([], [Elemento], Elemento).
agregar([X|Xs], [X|Ys], Elemento):- agregar(Xs, Ys, Elemento).

% Selector
getDimensiones([Ancho, Alto | Xs], [Ancho, Alto]):-
    checkBoard([Ancho, Alto | Xs]).

% Modificador
% play

% Operadores
nextPiece(_, Seed, Piece):-
    set_random(seed(Seed)), random(1, 7, IdPieza), pieza(IdPieza, 0, Piece).

%------------------------------%