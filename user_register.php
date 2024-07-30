<?php
require('connection.inc.php');
require('function.inc.php');
$name = get_safe_value($con, $_POST['name']);
$password = get_safe_value($con, $_POST['password']);
$email = get_safe_value($con, $_POST['email']);
$mobile = get_safe_value($con, $_POST['mobile']);
$added_on=date('Y-m-d H:i:s');
$check_user=mysqli_num_rows(mysqli_query($con, "select * from users where email='$email'"));
if ($check_user>0) {
    echo "Email already exists";
}
else {
    $sql="insert into users(name,password,email,mobile,added_on) values('$name','$password','$email','$mobile','$added_on')";
    mysqli_query($con, $sql);
    echo "Thanks for Registration";
}
?>