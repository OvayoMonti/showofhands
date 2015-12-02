<?

    require_once('recaptchalib.php');
    $privatekey = "6Le-pMcSAAAAALx5HdTrPMPUHJi7OxXS-p-G9CZ4";

    $resp = recaptcha_check_answer (
        $privatekey,
        $_POST["remoteAddr"],
        $_POST["challenge"],
        $_POST["response"]
    );

    if (!$resp->is_valid) {
        echo "Fail";
    } else {
        echo "Pass";
    }
?>