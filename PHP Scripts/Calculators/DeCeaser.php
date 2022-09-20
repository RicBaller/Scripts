<?php
// Ceasar rotation
// Ceasar.php

// Steps
// 1. Ask for a string
// 2. Every letter to UpperCase
// 3. Digits and special characters stay the same
// 4. Convert every letter to ASCII
// 5. Add 3 to every letter
// 6. Convert every letter back to letter
// 7. Print result

// Variables
$rotated = "";

// Functions
// Ask for a message in a string
function askMessage() {
    $message = readline("Enter a message: ");
    return $message;
}

// Convert every letter to UpperCase
function toUpperCase($message) {
    $message = strtoupper($message);
    return $message;
}

// Convert every character to ASCII, return $converted_ASCII
function toASCII($message) {
    $converted_ASCII = "";
    for($i = 0; $i < strlen($message); $i++) {
        $converted_ASCII .= ord($message[$i]);
    }
    return $converted_ASCII;
}

// Split every 2 numbers in separate strings, return $splitted_ASCII
function split2($converted_ASCII) {
    $splitted_ASCII = "";
    for($i = 0; $i < strlen($converted_ASCII); $i++) {
        if(ctype_digit($converted_ASCII[$i])) {
            $splitted_ASCII .= $converted_ASCII[$i];
            if(ctype_digit($converted_ASCII[$i + 1])) {
                $splitted_ASCII .= $converted_ASCII[$i + 1];
                $splitted_ASCII .= " ";
                $i++;
            }
        }
        else {
            $splitted_ASCII .= $converted_ASCII[$i];
        }
    }
    return $splitted_ASCII;
}

// Substract 3 from every splitted ASCII number, return $encrypted_ASCII
function add3($splitted_ASCII) {
    $encrypted_ASCII = "";
    $splitted_ASCII = explode(" ", $splitted_ASCII);
    for($i = 0; $i < count($splitted_ASCII); $i++) {
        if(ctype_digit($splitted_ASCII[$i])) {
            $encrypted_ASCII .= $splitted_ASCII[$i] - 3;
            $encrypted_ASCII .= " ";
        }
        else {
            $encrypted_ASCII .= $splitted_ASCII[$i];
        }
    }
    return $encrypted_ASCII;
}

// Convert every value back to letter, return $rotated_scrambled
function toLetter($encrypted_ASCII) {
    $rotated_scrambled = "";
    $encrypted_ASCII = explode(" ", $encrypted_ASCII);
    for($i = 0; $i < count($encrypted_ASCII); $i++) {
        if(ctype_digit($encrypted_ASCII[$i])) {
            $rotated_scrambled .= chr($encrypted_ASCII[$i]);
        }
        else {
            $rotated_scrambled .= $encrypted_ASCII[$i];
        }
    }
    return $rotated_scrambled;
}

// Merge all characters in one string, return $rotated
function merge($rotated_scrambled) {
    $rotated = "";
    for($i = 0; $i < strlen($rotated_scrambled); $i++) {
        $rotated .= $rotated_scrambled[$i];
    }
    return $rotated;
}


// Main program
$message = askMessage();
$message = toUpperCase($message);
$converted_ASCII = toASCII($message);
$splitted_ASCII = split2($converted_ASCII);
$encrypted_ASCII = add3($splitted_ASCII);
$rotated_scrambled = toLetter($encrypted_ASCII);
$rotated = merge($rotated_scrambled);

// Print result
echo "Your message is: $rotated \n\n";

?>