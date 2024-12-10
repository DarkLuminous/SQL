<?php
require 'config.php';

$search = $_GET['search'] ?? '';
$sql = "SELECT * FROM papers WHERE status='approved' AND (title LIKE '%$search%' OR author LIKE '%$search%')";
$result = $conn->query($sql);

while ($row = $result->fetch_assoc()) {
    echo "<h3>" . $row['title'] . "</h3>";
    echo "<p>Author: " . $row['author'] . "</p>";
    echo "<a href='" . $row['file_path'] . "' download>Download</a>";
}
?>
<form method="GET">
    <input type="text" name="search" placeholder="Search papers">
    <button type="submit">Search</button>
</form>
