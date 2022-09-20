<?php
// Decimaal naar Binair
// DecimaalBinair.php

// Functions
// Function to convert decimal to binary without decbin() function
function decbin2($binair, $decimaal) {
    $binair[7] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[6] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[5] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[4] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[3] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[2] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[1] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    $binair[0] = $decimaal % 2;
    $decimaal = floor($decimaal / 2);
    return $binair;
}

// Array with binary numbers
$binair = array(0,0,0,0,0,0,0,0);

// Ask for decimal number
echo "Geef een decimaal getal in:\n";
$decimaal = trim(fgets(STDIN));

// Convert decimal number to binary without decbin() function
$binair = decbin2($binair, $decimaal);

// Display binary number
echo "Het binair getal is: ";
foreach($binair as $value) {
  echo $value;
}
echo "\n\n";

?>