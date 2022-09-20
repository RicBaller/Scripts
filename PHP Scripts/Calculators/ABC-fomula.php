<?php
// ABC-Formule
// ABC.php

// Variables

// Functions
// Ask for a,b,c and return array
function askABC() {
    $a = readline("Enter a: ");
    $b = readline("Enter b: ");
    $c = readline("Enter c: ");
    return array($a, $b, $c);
}

// Calculate discriminant
function discriminant($a, $b, $c) {
    $d = pow($b, 2) - 4 * $a * $c;
    return $d;
}

// Calculate x1 and x2
function x1x2($a, $b, $d) {
    $x1 = (-$b - sqrt($d)) / (2 * $a);
    $x2 = (-$b + sqrt($d)) / (2 * $a);
    return array($x1, $x2);
}

// Round x1 and x2 to 1 decimal
function roundX($x1, $x2) {
    $x1 = round($x1, 1);
    $x2 = round($x2, 1);
    return array($x1, $x2);
}

// Write original equation
function writeEquation($a, $b, $c) {
    $equation = "Y = $a * x^2 + $b * x + $c";
    return $equation;
}

// Write discriminant and x1,x2 results
function writeResults($d, $x1, $x2) {
    $results = "\nDiscriminant: $d\n";
    $results .= "x1: $x1\n";
    $results .= "x2: $x2\n\n\n";
    return $results;
}

// Main program
// Ask for a,b,c
$abc = askABC();

// Calculate discriminant
$d = discriminant($abc[0], $abc[1], $abc[2]);

// Calculate x1 and x2
$x1x2 = x1x2($abc[0], $abc[1], $d);

// Round x1 and x2 to 1 decimal
$x1x2 = roundX($x1x2[0], $x1x2[1]);

// Show results
// Write original equation
$equation = writeEquation($abc[0], $abc[1], $abc[2]);

// Write discriminant and x1,x2 results
$results = writeResults($d, $x1x2[0], $x1x2[1]);

// Show equation and results
echo "\n\nDit zijn de resultaten:\n";
echo "$equation";
echo "$results";

?>