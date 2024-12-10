<?php
// Include the database connection file
include('db_connection.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Research Office</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
</head>
<body>
    <header>
        <h1>Welcome to the Research Office</h1>
        <nav>
            <ul>
                <li><a href="home.php">Home</a></li>
                <li><a href="about.php">About Us</a></li>
                <li><a href="research_journals.php">Research Journals</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section>
            <h2>Latest Research Publications</h2>
            <!-- You can dynamically display publications here by querying the database -->
            <?php
            $query = "SELECT title, author, year FROM publications ORDER BY year DESC LIMIT 5";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) > 0) {
                echo "<ul>";
                while ($row = mysqli_fetch_assoc($result)) {
                    echo "<li><strong>{$row['title']}</strong> by {$row['author']} ({$row['year']})</li>";
                }
                echo "</ul>";
            } else {
                echo "<p>No publications available at the moment.</p>";
            }
            ?>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Research Office. All rights reserved.</p>
    </footer>
</body>
</html>
