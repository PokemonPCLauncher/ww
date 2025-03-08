
Powiedziałeś(-aś):
@echo off
setlocal enabledelayedexpansion
title Pokemon PC Launcher - by iron and Zbyszek


:: Lista stworów
set creatures[0]=Pikachu
set creatures[1]=Bulbasaur 
set creatures[2]=Charmander
set creatures[3]=Squirtle
set creatures[4]=Gengar
set creatures[5]=Psyduck
set creatures[6]=Pichu
set creatures[7]=mewtwo
set creatures[8]=articuno
set creatures[9]=moltres
set creatures[10]=zapdos


:: Pliki do zapisu złapanych i uciekłych pokémonów
set catchFile=%userprofile%\downloads\PokePC\catched_log.txt
set runFile=%userprofile%\downloads\PokePC\escaped_log.txt
set loginFile=%userprofile%\downloads\PokePC\login_log.txt

:: Sprawdzenie czy pliki istnieją, jeśli nie to je stworzyć
if not exist "%catchFile%" echo No Pokemon caught yet. > "%catchFile%"
if not exist "%runFile%" echo No Pokemon ran away yet. > "%runFile%"

:start_game

cls


:: Wyświetlenie dostępnych komend
color 7
echo User started game at %time%, %date%. >>%loginFile%
echo Type "pokedex" to see your caught Pokemon , or press Enter to start.

:: Pytanie o komendę
set /p userInput=Enter command: 

:: Jeśli komenda to "pokedex", wyświetl złapane pokemony
if /i "!userInput!"=="pokedex" (
    echo Pokedex:
    type "%catchFile%"
    pause
    goto start_game
)

:: Losowanie stwora
set /a randomIndex=%random% %% 5
set creature=!creatures[%randomIndex%]!

:: Pytanie o złapanie
echo A wild !creature! has appeared!
set /p response=Do you want to catch it? (yes/no): 

:: Zapisywanie wyników do odpowiednich plików
if /i "!response!"=="yes" (
    echo You caught the !creature! > "%catchFile%"
    echo You caught the !creature!
color 0b
timeout 1 >nul
color 0a
timeout 1 >nul
color 0b
timeout 1 >nul
color 0a
timeout 1 >nul
color 0b
timeout 1 >nul
color 0a
) else (
    echo The !creature! escaped. > "%runFile%"
    echo The !creature! escaped.
color 0c
)

:: Pytanie o kontynuowanie
set /p continueGame=Do you want to continue playing? (yes/no): 
if /i "!continueGame!"=="yes" goto start_game

exit
