<?php
session_start();
if (!isset($_SESSION['user_id'])) {
    header('Location: login.php');
    exit;
}
require 'config.php';

echo "Welcome to your dashboard!";

// File upload handling
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'];
    $author = $_POST['author'];
    $category = $_POST['category'];
    $abstract = $_POST['abstract'];
    $file = $_FILES['file'];

    $targetDir = "uploads/";
    $filePath = $targetDir . basename($file["name"]);

    if (move_uploaded_file($file["tmp_name"], $filePath)) {
        $userId = $_SESSION['user_id'];
        $sql = "INSERT INTO papers (title, author, category, abstract, file_path, uploaded_by) VALUES ('$title', '$author', '$category', '$abstract', '$filePath', '$userId')";
        if ($conn->query($sql) === TRUE) {
            echo "File uploaded successfully.";
        } else {
            echo "Error: " . $conn->error;
        }
    } else {
        echo "File upload failed.";
    }
}
?>

<form method="POST" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="Title" required>
    <input type="text" name="author" placeholder="Author" required>
    <input type="text" name="category" placeholder="Category" required>
    <textarea name="abstract" placeholder="Abstract"></textarea>
    <input type="file" name="file" required>
    <button type="submit">Upload</button>
</form>
