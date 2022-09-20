<?php
// Binair naar Decimaal
// BinairDecimaal.php

// Functions
// Function to convert binary to decimal
function bindec2($decimaal, $binair) {
    $decimaal = $binair[7] * 1;
    $decimaal = $decimaal + $binair[6] * 2;
    $decimaal = $decimaal + $binair[5] * 4;
    $decimaal = $decimaal + $binair[4] * 8;
    $decimaal = $decimaal + $binair[3] * 16;
    $decimaal = $decimaal + $binair[2] * 32;
    $decimaal = $decimaal + $binair[1] * 64;
    $decimaal = $decimaal + $binair[0] * 128;
    return $decimaal;
}

// Array with binary numbers
$binair = array(0,0,0,0,0,0,0,0);

// Ask for binary number and convert to array
echo "Geef een binair getal in:\n";
$binair = str_split(trim(fgets(STDIN)));

// Convert binary number to decimal
$decimaal = bindec2($decimaal, $binair);

// Display decimal number
echo "Het decimaal getal is: $decimaal";
echo "\n\n";

?>