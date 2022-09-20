<?php
// Dart Spel
// Darts.php

// Variables
$gameOver = false;
$tries = 0;
$points = 501;

// Function for dart throw
function vraagScore($pijl) {
    echo "Score van pijl #$pijl: ";
    return trim(fgets(STDIN));
}

// Introductie
echo "\n\nWelkom bij het dart spel!\n\n";
sleep (2);
echo "Je begint met 501 punten.\n";
sleep (1);
echo "Je mag 3 pijlen gooien.\n";
sleep (1);
echo "Je moet de punten van de pijlen invullen.\n";
sleep (1);
echo "Je mag niet meer dan 180 punten gooien.\n";
sleep (1);
echo "Je mag niet meer dan 60 punten gooien met 1 pijl.\n";
sleep (1);
echo "De score wordt na het invullen automatisch berekend.\n";
sleep (1);
echo "Als je 0 punten overhoudt, heb je gewonnen!\n";
sleep (1);
echo "Als je onder de 0 punten komt, heb je verloren!\n";
sleep (1);
echo "Veel succes!\n\n";
sleep (1);

// Game loop
// For every turn the user gets 3 darts
// The user has to throw 3 darts
// The user has to enter the score of every dart using the function vraagScore
// Start with 501 points and subtract the score of every dart
// Ask for dubble or triple
// If the user gets 0 points, the user wins

while(!$gameOver) {
    echo "Je hebt $points punten over.\n";
    $pijl = 1;
    while($pijl <= 3) {
        $score = vraagScore($pijl);
        echo "Enkel, dubbel of drievoudig? (1x / 2x / 3x): \n";
        $dubbel = trim(fgets(STDIN));
        if($dubbel == "2x") {
            $score = $score * 2;
        }
        else if($dubbel == "3x") {
            $score = $score * 3;
        }
        else if($dubbel == "1x") {
            $score = $score * 1;
        }
        $points = $points - $score;
        $pijl++;
    }
    if($points == 0) {
        echo "Je hebt gewonnen!\n";
        $gameOver = true;
    }
    else if($points < 0) {
        echo "Je hebt onder 0 gegooid! Je moet opnieuw gooien.\n";
        $points = $points + $score;
    }
}

while(!$gameOver) {
    echo "Je hebt nog $points punten over.\n";
    $pijl1 = vraagScore(1);
    $pijl2 = vraagScore(2);
    $pijl3 = vraagScore(3);
    $points = $points - $pijl1 - $pijl2 - $pijl3;
    if($points == 0) {
        echo "Je hebt gewonnen!\n";
        $gameOver = true;
    }
    else if($points < 0) {
        echo "Je hebt verloren!\n";
        $gameOver = true;
    }
}

?>