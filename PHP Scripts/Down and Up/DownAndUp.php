<?php
// PHP Download Bot
// bot.php

// Variables
    $maxcount = 1000;
    $username = "username";
    $password = "password";
    $sleep = 1;
    $count = 1;
    $domain = "http://www.domain.com";
    $file_prefix = "file";

// FTP Server
    // set ftp server details
    $ftp_server = "ip or domain";
    $ftp_user_name = "name";
    $ftp_user_pass = "password";
    $ftp_port = 21;

    // connect to ftp server
    $conn_id = ftp_connect($ftp_server, $ftp_port);

    // test connection
    if ((!$conn_id)) {
        echo "FTP connection has failed!\n";
        echo "Attempted to connect to $ftp_server for user $ftp_user_name\n";
        exit;
    } else {
        echo "Connected to $ftp_server, for user $ftp_user_name\n";
    }

    // login to ftp server
    $login_result = ftp_login($conn_id, $ftp_user_name, $ftp_user_pass);
    ftp_pasv($conn_id, true) or die("Cannot switch to passive mode");

    // test login
    if ((!$login_result)) {
        echo "FTP login has failed!\n";
        echo "Attempted to login to $ftp_server for user $ftp_user_name\n";
        exit;
    } else {
        echo "Logged in to $ftp_server, for user $ftp_user_name\n";
}

// Loop
    // While count is less than maxcount download the file using the url variable and save it as the count variable with .pdf extension. Echo every filename that is downloaded.
    while ($count < $maxcount) {
        $url = 'https://' . $domain . '/gen_invoice_pdf.php?id=' . $count . "&us=" . $username . "&pw=" . $password;
        $file_name = basename($file_prefix.$count.".pdf");
        if (file_put_contents($file_name, file_get_contents($url)))
        {
            echo "File downloaded successfully.\n";
            // echo filename
            echo $file_name . " has been downloaded.\n\n";
        }
        else
        {
            echo "File downloading failed.\n";
            // echo filename
            echo $file_name . " has not been downloaded.\n\n";
        }
        // move file to folder "downloads"
        rename($file_name, "downloads/".$file_name);
        
        // upload file to ftp server using curl and not ftp_put
        $file = "downloads/".$file_name;
        $remote_file = $file_name;
        $ch = curl_init("ftp://".$ftp_server."/".$remote_file);
        curl_setopt($ch, CURLOPT_UPLOAD, 1);
        curl_setopt($ch, CURLOPT_USERPWD, $ftp_user_name.":".$ftp_user_pass);
        curl_setopt($ch, CURLOPT_INFILE, fopen($file, "r"));
        curl_setopt($ch, CURLOPT_INFILESIZE, filesize($file));
        curl_exec ($ch);
        $error_no = curl_errno($ch);

        if ($error_no == 0) {
            echo "File uploaded successfully.\n";
            // echo filename
            echo $file_name . " has been uploaded.\n\n";
        } else {
            echo "File uploading failed.\n";
            // echo filename
            echo $file_name . " has not been uploaded.\n\n";
        }

        // increase count by 1
        $count++;

        // sleep for 1 second
        sleep($sleep);

    }

?>
