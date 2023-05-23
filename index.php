<?php
include 'imap_retrieve.php';

$inbox = imap_open($imapPath, $username, $password) or die('Cannot connect to Outlook.com: ' . imap_last_error());

// Get all emails in the inbox
$emails = imap_search($inbox, 'ALL');

// Include the database connection code
include 'db_connection.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Email Inbox</title>
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>

<body>
  <main class="container">
    <a href="send_email.html">
      <button>Email Sender</button>
    </a>
    <br>
    <h1>Email Inbox</h1>
    <table>
      <thead>
        <tr>
          <th>Sender</th>
          <th>Subject</th>
          <th>Body</th>
        </tr>
      </thead>
      <tbody>
        <?php
        // Loop through each email and store the desired data in the MySQL database
        foreach ($emails as $emailId) {
          $emailData = imap_fetch_overview($inbox, $emailId, 0);

          $subject = $emailData[0]->subject;
          $from = $emailData[0]->from;
          $body = imap_fetchbody($inbox, $emailId, 1);

          // Check if the email already exists in the database
          $checkQuery = "SELECT * FROM emails WHERE subject = ? AND sender = ?";
          $checkStmt = $conn->prepare($checkQuery);
          $checkStmt->bind_param("ss", $subject, $from);
          $checkStmt->execute();
          $checkResult = $checkStmt->get_result();

          if ($checkResult->num_rows === 0) {
            // Insert the email data into the MySQL database
            $insertQuery = "INSERT INTO emails (subject, sender, body) VALUES (?, ?, ?)";
            $insertStmt = $conn->prepare($insertQuery);
            $insertStmt->bind_param("sss", $subject, $from, $body);

            if ($insertStmt->execute()) {
              // echo "Email inserted successfully.";
            } else {
              // echo "Error: " . $insertStmt->error;
            }
          } else {
            // echo "Email already exists in the database.";
          }
        }

        // Retrieve emails from the MySQL database
        $sql = "SELECT * FROM emails ORDER BY id DESC";
        $result = $conn->query($sql);

        if ($result) {
          // Check if any emails were found
          if ($result->num_rows > 0) {
            // Output data of each unique email
            while ($row = $result->fetch_assoc()) {
              echo "<tr>";
              echo "<td>" . $row["sender"] . "</td>";
              echo "<td>" . $row["subject"] . "</td>";
              echo "<td>" . html_entity_decode($row["body"]) . "</td>";
              echo "</tr>";
            }
          } else {
            echo "No emails found.";
          }
        } else {
          echo "Error executing the query: " . $conn->error;
        }
        ?>

      </tbody>
    </table>
  </main>
</body>

<?php
// Close the result set
$result->close();

// Close the connection
$conn->close();

// Close the IMAP connection
imap_close($inbox);
?>

</html>