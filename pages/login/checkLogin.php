<?php
    session_start();
    require '../../config/koneksi.php';


    if ($_SERVER['REQUEST_METHOD']== "POST") {
        $username = $_POST['username'];
        $password = md5($_POST['password']);

        if ($username == "Admin" && $password == md5("admin")) {
            $_SESSION['username'] = $username;
            $_SESSION['password'] = $password;

            header("location:../../obat.php");
        }
        else{
            $query = "SELECT * FROM dokter WHERE nama = '$username' && password = '$password'";
            $result = mysqli_query($mysqli,$query);
            if (mysqli_num_rows($result)>0) {
                $data = mysqli_fetch_assoc($result);

                $_SESSION['username'] = $data['nama'];
                $_SESSION['password'] = $data['password'];

                header("location:../../pasien.php");
            }
            else{
                $queryPasien = "SELECT * FROM pasien WHERE nama = '$username' && password = '$password'";
                $results = mysqli_query($mysqli,$queryPasien);
                if (mysqli_num_rows($results)>0) {
                    $_SESSION['username'] = $data['nama'];
                    $_SESSION['password'] = $data['password'];

                    header("location:../../obat.php");
                }
                else{
                    echo '<script>alert("Email atau password salah");location.href="../../login.php";</script>';
                }
            }
        }
    }
?>