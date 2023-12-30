<!DOCTYPE html>

<?php
    session_start();
?>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Poliklinik</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/plugins/fontawesome-free/css/all.min.css">
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="assets/dist/css/adminlte.min.css">
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card">
            <h6 class="bg-primary py-2 px-3 rounded-top">Daftar Poli</h6>
            <div class="card-body login-card-body">

                <form action="pages/daftarPoli/daftarPoli.php" method="post">
                    <div class="form-group mb-3">
                        <label for="no_rm font-weight-bold">No Rekam Medis</label>
                        <input type="text" class="form-control" name="no_rm" value="<?php echo $_SESSION['no_rm'] ?>"
                            readonly required>
                    </div>
                    <div class="form-group">
                        <label for="poli">Pilih Poli</label>
                        <select class="form-control" id="poli" name="poli" required>
                            <?php
                                require 'config/koneksi.php';
                                $query = "SELECT * FROM poli";
                                $result = mysqli_query($mysqli,$query);
                                while ($dataPoli = mysqli_fetch_assoc($result)) {
                            ?>
                            <option value="<?php echo $dataPoli['id'] ?>">
                                <?php echo $dataPoli['nama_poli'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="no_rm font-weight-bold">Pilih Jadwal</label>
                        <select class="form-control" id="jadwal" name="jadwal" required>

                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label for="keluhan">Keluhan</label>
                        <textarea class="form-control" rows="3" id="keluhan" name="keluhan" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-block btn-primary">
                        Daftar
                    </button>
                    <a href="pages/logout/logout.php" class="btn btn-block btn-danger">
                        Logout
                    </a>
                </form>
                <!-- /.social-auth-links -->
            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE App -->
    <script src="assets/dist/js/adminlte.min.js"></script>

    <script>
    $(document).ready(function() {
        $('#poli').on('change', function() {
            var poliId = $(this).val();

            // Mengambil data jadwal berdasarkan poli yang dipilih
            $.ajax({
                type: 'POST',
                url: 'getJadwal.php', // Ganti dengan path file get_jadwal.php sesuai dengan struktur proyek Anda
                data: {
                    poliId: poliId
                },
                success: function(data) {
                    $('#jadwal').html(data);
                }
            });
        });
    });
    </script>
</body>

</html>