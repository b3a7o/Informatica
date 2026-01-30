<?php
session_start();
require_once(__DIR__.'/connect.php');

if (!isset($_SESSION['session_id'])) {
    header('Location: ../login.html');
    exit;
}

$badge = $_SESSION['badge_number'];

$stmtSocio = $conn->prepare("SELECT * FROM members WHERE badge_number = ?");
$stmtSocio->execute([$badge]);
$socio = $stmtSocio->fetch(PDO::FETCH_ASSOC);

if (isset($_POST['join_course'])) {
    $course_code = $_POST['course_code'];
    try {
        $ins = $conn->prepare("INSERT INTO course_attendance (badge_number, course_code, payment_date) VALUES (?, ?, CURDATE())");
        $ins->execute([$badge, $course_code]);
        echo "<script>alert('subscibed succesfully!');</script>";
    } catch (Exception $e) {
        echo "Error: alredy subscibed or max subscription limit reached.";
    }
}

$corsi = $conn->query("SELECT * FROM courses")->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <title>reserved area - <?php echo $socio['name']; ?></title>
</head>
<body>
    
    <h1>Welcome <?php echo $socio['name'] . " " . $socio['surname']; ?></h1>
    <p>type: <strong><?php echo strtoupper($socio['type']); ?></strong> | badge: <?php echo $socio['badge_number']; ?></p>
    
    <hr>
    
    <h2>Available courses</h2>
    <table>
        <tr>
            <th>Code</th>
            <th>Description</th>
            <th>Price</th>
            <th>Days</th>
            <th>Action</th>
        </tr>
        <?php foreach($corsi as $c): ?>
        <tr>
            <td><?php echo $c['course_code']; ?></td>
            <td><?php echo $c['description']; ?></td>
            <td><?php echo $c['price']; ?>€</td>
            <td><?php echo $c['days_of_week']; ?></td>
            <td>
                <form method="post">
                    <input type="hidden" name="course_code" value="<?php echo $c['course_code']; ?>">
                    <button type="submit" name="join_course">Subscibe</button>
                </form>
            </td>
        </tr>
        <?php endforeach; ?>
    </table>

    <br>
    <a href="logout.php">Esci</a>
</body>
</html>