<?php
session_start();
require 'config.php';

if ($_SESSION['role'] !== 'admin') {
    echo "Access denied.";
    exit;
}

$sql = "SELECT * FROM papers WHERE status='pending'";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    echo "<h3>" . $row['title'] . "</h3>";
    echo "<p>Author: " . $row['author'] . "</p>";
    echo "<form method='POST'>
        <input type='hidden' name='paper_id' value='" . $row['id'] . "'>
        <button name='approve'>Approve</button>
        <button name='reject'>Reject</button>
    </form>";
}

if (isset($_POST['approve'])) {
    $paperId = $_POST['paper_id'];
    $conn->query("UPDATE papers SET status='approved' WHERE id='$paperId'");
    header('Location: admin.php');
}

if (isset($_POST['reject'])) {
    $paperId = $_POST['paper_id'];
    $conn->query("UPDATE papers SET status='rejected' WHERE id='$paperId'");
    header('Location: admin.php');
}
?>
