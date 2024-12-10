<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USTP Journals</title>
    <style>
        /* Existing CSS unchanged */
        :root {
            --primary-color: rgba(64, 29, 24, 1);
            --secondary-color: rgba(26, 13, 73, 1);
            --white: rgba(255, 255, 255, 1);
            --black: rgba(0, 0, 0, 1);
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background-color: var(--primary-color);
        }
        header {
            background-color: #fff;
            display: flex;
            width: 100%;
            flex-direction: column;
            align-items: center;
            padding: 26px 80px 15px;
            font: 700 20px Inter, sans-serif;
        }
        .header-content {
            display: flex;
            width: 520px;
            max-width: 100%;
            flex-direction: column;
        }
        .logo-container {
            display: flex;
            gap: 32px;
            flex-wrap: wrap;
        }
        .university-logo {
            aspect-ratio: 0.94;
            object-fit: contain;
            width: 73px;
        }
        .university-name {
            flex-grow: 1;
            width: 400px;
            margin: auto 0;
        }
        .nav-menu {
            align-self: center;
            display: flex;
            margin-top: 37px;
            width: 382px;
            max-width: 100%;
            gap: 40px 50px;
        }
        .nav-link {
            color: #000;
            flex-grow: 1;
            transition: text-decoration 0.3s;
        }
        .content-section {
            max-width: 1204px;
            width: 90%;
            margin: 4rem auto;
            background-color: var(--secondary-color);
            padding: 2rem;
            border-radius: 4px;
        }
        .journals-table {
            width: 100%;
            border-collapse: collapse;
            color: var(--white);
        }
        .journals-table th,
        .journals-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .journals-table th {
            font-weight: 700;
            background-color: rgba(255, 255, 255, 0.1);
        }
        .journals-table tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }
        @media screen and (max-width: 991px) {
            .header-section {
                padding: 1.5rem;
            }
            .logo-container {
                flex-direction: column;
                text-align: center;
            }
            .content-section {
                margin: 2rem auto;
                padding: 1rem;
            }
        }
        @media screen and (max-width: 968px) {
            .journals-table {
                display: block;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <header class="header-section">
        <div class="logo-container">
            <img
                loading="lazy"
                src="https://cdn.builder.io/api/v1/image/assets/TEMP/30bfbbfda1949cbeee9e50f46f301a5db19f2bdc0af46734538dd53d320c4602?placeholderIfAbsent=true&apiKey=1fe2be62a44b419e80a79b0e6c9afb51"
                class="university-logo"
                alt="USTP University Logo"
            />
            <div class="university-name">
                THE UNIVERSITY OF SCIENCE AND
                <br />
                TECHNOLOGY OF SOUTHERN PHILIPPINES
            </div>
        </div>
        <nav class="nav-menu" role="navigation">
            <a href="index.php" class="nav-link">HOME</a>
            <a href="about US.php" class="nav-link">ABOUT US</a>
            <a href="Journals.php" class="nav-link">JOURNALS</a>
        </nav>
    </header>

    <main class="content-section">
        <table class="journals-table" role="table" aria-label="Journals Information">
            <thead>
                <tr>
                    <th scope="col">Article Title</th>
                    <th scope="col">Authors</th>
                    <th scope="col">Journal Title</th>
                    <th scope="col">Volume</th>
                    <th scope="col">Pages</th>
                    <th scope="col">URL</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
            <?php 
                $db_host = "localhost";
                $db_user = "root";
                $db_pass = "";
                $db_name = "research_office";
                
                $connection = new mysqli($db_host, $db_user, $db_pass, $db_name);

                if ($connection->connect_error) {
                    die("Connection failed: " . $connection->connect_error);
                }

                $sql = "SELECT * FROM website_view";
                $result = $connection->query($sql);

                if (!$result) {
                    die("Invalid query: " . $connection->error);
                }

                while($row = $result->fetch_assoc()) {
                    // Using htmlspecialchars to avoid XSS attacks
                    echo "
                    <tr>
                        <td>" . htmlspecialchars($row["Article Title"]) . "</td>
                        <td>" . htmlspecialchars($row["Authors"]) . "</td>
                        <td>" . htmlspecialchars($row["Journal Title"]) . "</td>
                        <td>" . htmlspecialchars($row["Volume"]) . "</td>
                        <td>" . htmlspecialchars($row["Pages"]) . "</td>
                        <td><a href='" . htmlspecialchars($row["URL"]) . "' target='_blank'>Read More...</a></td>
                    </tr>";
                }
            ?>
            </tbody>
        </table>
    </main>
</body>
</html>
