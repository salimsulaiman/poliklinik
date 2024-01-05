-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2024 pada 14.33
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `poli_bk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_poli`
--

CREATE TABLE `daftar_poli` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pasien` int(11) UNSIGNED NOT NULL,
  `id_jadwal` int(11) UNSIGNED NOT NULL,
  `keluhan` text NOT NULL,
  `no_antrian` int(10) UNSIGNED NOT NULL,
  `status_periksa` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar_poli`
--

INSERT INTO `daftar_poli` (`id`, `id_pasien`, `id_jadwal`, `keluhan`, `no_antrian`, `status_periksa`) VALUES
(1, 3, 2, 'Anak saya sudah 2 hari sakit dok', 1, '1'),
(2, 1, 3, 'Kaki saya kemarin cidera dok, sekarang susah buat nendang bola lagi', 2, '1'),
(3, 2, 2, 'Anak saya pilek dok, sudah saya minumin obat herbal masih belum sembuh sembuh', 3, '1'),
(4, 1, 3, 'Pak Dokter, kaki saya cidera gk bisa nendang bola', 4, '1'),
(5, 4, 2, 'Anak saya pusing sudah 5 hari dok', 5, '1'),
(6, 1, 2, 'Badan anak saya panas dok, sudah 1 minggu ini', 6, '0'),
(7, 5, 4, 'Gigi saya sakit dok', 1, '1'),
(8, 5, 3, 'Kaki saya cidera dok', 5, '1'),
(9, 5, 2, 'Anak saya pilek terus dok', 7, '0'),
(10, 5, 1, 'Halo dok, mau periksa', 1, '0'),
(11, 2, 4, 'Gigi saya sakit dok', 2, '0'),
(12, 2, 3, 'Kaki saya sakit dok', 6, '1'),
(13, 6, 4, 'Gusi anak saya sering sakit, dan giginya sedikit berlubang dok', 3, '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_periksa`
--

CREATE TABLE `detail_periksa` (
  `id` int(11) NOT NULL,
  `id_periksa` int(11) NOT NULL,
  `id_obat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detail_periksa`
--

INSERT INTO `detail_periksa` (`id`, `id_periksa`, `id_obat`) VALUES
(1, 1, 10),
(2, 2, 1),
(3, 2, 3),
(4, 2, 4),
(5, 3, 1),
(6, 3, 10),
(7, 4, 4),
(8, 4, 10),
(9, 5, 2),
(10, 6, 10),
(11, 7, 10),
(12, 8, 1),
(13, 8, 2),
(14, 9, 1),
(15, 9, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `id_poli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id`, `nama`, `password`, `alamat`, `no_hp`, `id_poli`) VALUES
(1, 'Salim Sulaiman', '261ec66edc9f53c71e3fdba42c7c8a50', 'Jl. Sadewa 1 No 46', '08765645541', 7),
(2, 'Nurul Ismawati', 'a74a0cef60e7331a2d6bac6a9beed3ff', 'Jl. Puspanjolo Timur', '08776734891', 2),
(4, 'Dinita Kusumasari', '1b7a2e5ba5c1ad804d8d1b0950b91944', 'Puspanjolo Timur', '08777656432', 2),
(5, 'Samy Sulaiman', 'b53d24dc524ec3b086225d2174a90bc4', 'Tegal', '087776571073', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_periksa`
--

CREATE TABLE `jadwal_periksa` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jadwal_periksa`
--

INSERT INTO `jadwal_periksa` (`id`, `id_dokter`, `hari`, `jam_mulai`, `jam_selesai`) VALUES
(1, 4, 'Senin', '14:00:00', '15:00:00'),
(2, 2, 'Senin', '09:30:00', '12:00:00'),
(3, 1, 'Jumat', '14:00:00', '15:00:00'),
(4, 5, 'Jumat', '13:00:00', '16:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id` int(11) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `kemasan` varchar(35) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id`, `nama_obat`, `kemasan`, `harga`) VALUES
(1, 'Albendasol suspensi 200 mg/5 ml', 'Ktk 10 btl @ 10 ml', 6000),
(2, 'Pentoksifilin tablet 400 mg', 'ktk 10 x 10 tablet', 6000),
(3, 'Alprazolam tablet 1 mg', 'ktk 10 x 10 tablet', 118000),
(4, 'Amilorida tablet 5 mg', 'ktk 10 x 10 table', 12000),
(10, 'Asam Askorbat (Vitamin C) tablet 250 mg', 'btl 250 tablet', 42000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `password` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_ktp` varchar(255) NOT NULL,
  `no_hp` varchar(50) NOT NULL,
  `no_rm` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id`, `nama`, `password`, `alamat`, `no_ktp`, `no_hp`, `no_rm`) VALUES
(1, 'Adi', '8b825f407e3a716aaaf245d415d3d18d', 'Balapulang', '332816042002', '087776421089', '202312-001'),
(2, 'Joko', '9b4eb194cde1c2332bed040eb2df0c5a', 'Pati', '332823062002', '087776421078', '202312-002'),
(3, 'Hendra', 'd536468fd4600c5244d0ee734299c743', 'Pekalongan', '332816052002', '08777656424', '202312-003'),
(4, 'Budi', '5894c82cc2aeb6560140a81694f99051', 'Bekasi', '332816072002', '087767892345', '202312-004'),
(5, 'Handoko', '152ea35591613fcf3f4a3faba28dc801', 'Slawi', '332816042001', '087776567894', '202312-005'),
(6, 'Heri', '94c4fd4a8d28a9c37a873c3240e06704', 'Jl. Mangga Balapulang', '332804182002', '087776572865', '202401-006'),
(7, 'Raiyan', '3605f7765a121c6ed41cb32261be2f53', 'Semarang', '332815022001', '087778651767', '202401-007');

-- --------------------------------------------------------

--
-- Struktur dari tabel `periksa`
--

CREATE TABLE `periksa` (
  `id` int(11) NOT NULL,
  `id_daftar_poli` int(11) UNSIGNED NOT NULL,
  `tgl_periksa` datetime NOT NULL,
  `catatan` text NOT NULL,
  `biaya_periksa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `periksa`
--

INSERT INTO `periksa` (`id`, `id_daftar_poli`, `tgl_periksa`, `catatan`, `biaya_periksa`) VALUES
(1, 3, '2023-12-31 12:35:00', 'Yasudah ini saya kasih vitamin saja ya, tolong diminum mas, sampai habis ya', 150000),
(2, 4, '2023-12-30 13:06:00', 'Yasudah, ini saya kasih beberapa obat y, tolong diminum', 150000),
(3, 1, '2023-12-31 06:04:00', 'Tolong diminum 3x sehari ya mas obatnya, harus habis', 150000),
(4, 2, '2023-12-31 10:01:00', 'Tolong diminum obatnya, dan minum air yang bannyak', 150000),
(5, 5, '2024-01-02 08:58:00', 'Tolong diminum obatnya ya mas Budi', 150000),
(6, 8, '2024-01-04 13:23:00', 'Nih saya kasih obat', 150000),
(7, 12, '2024-01-04 13:23:00', 'Yasudah istirahat saja, sama minum vitaminnya', 150000),
(8, 7, '2024-01-05 20:11:00', 'Ini saya kasih beberapa obat, tolong diminum ya', 150000),
(9, 13, '2024-01-05 20:22:00', 'Yasudah tolong ini diminum setiap hari ya', 150000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id` int(11) NOT NULL,
  `nama_poli` varchar(25) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id`, `nama_poli`, `keterangan`) VALUES
(1, 'Akupuntur', 'Klinik akupuntur adalah fasilitas kesehatan yang menyediakan layanan terapi akupuntur. Akupuntur merupakan suatu metode pengobatan tradisional yang berasal dari Tiongkok, di mana jarum-tipis dimasukkan ke dalam titik-titik tertentu pada tubuh untuk merangsang energi vital atau \"qi\" guna memulihkan keseimbangan tubuh dan mengatasi berbagai masalah kesehatan.'),
(2, 'Anak', 'Klinik anak adalah pusat pelayanan kesehatan yang khusus menangani masalah kesehatan anak-anak. Para dokter dan perawat di klinik anak memiliki keahlian dalam merawat dan mengobati berbagai kondisi medis yang biasanya terkait dengan perkembangan dan pertumbuhan anak-anak, mulai dari bayi hingga remaja.'),
(3, 'Bedah', 'Klinik bedah adalah fasilitas medis di mana prosedur bedah dilakukan. Ini bisa mencakup berbagai jenis operasi, mulai dari tindakan minor seperti pengangkatan kista hingga prosedur bedah mayor seperti pembedahan organ internal. Tim medis di klinik bedah terdiri dari ahli bedah, perawat bedah, dan personel pendukung lainnya.'),
(4, 'Bedah Saraf', 'Klinik bedah saraf adalah unit spesialis dalam bidang bedah yang fokus pada sistem saraf. Di sini, dokter bedah saraf menangani berbagai gangguan saraf, seperti tumor otak, cedera saraf tulang belakang, atau gangguan saraf perifer. Pelayanan di klinik ini mencakup diagnosis, pengobatan, dan pemulihan pasien dengan masalah neurologis.'),
(5, 'Gigi', 'Klinik gigi adalah fasilitas pelayanan kesehatan oral yang menyediakan perawatan gigi dan mulut. Dokter gigi di klinik ini menangani berbagai masalah mulai dari pencegahan, perawatan gigi berlubang, hingga prosedur kosmetik seperti pemutihan gigi dan pemasangan kawat gigi. Klinik gigi juga dapat memberikan edukasi mengenai kebersihan gigi dan perawatan rutin.'),
(6, 'Forensik', 'Klinik Forensik adalah fasilitas kesehatan yang khusus menyediakan pelayanan medis terkait dengan bidang forensik atau ilmu hukum. Klinik ini berfokus pada penerapan pengetahuan medis untuk membantu proses penyelidikan hukum dan peradilan. Pelayanan klinik forensik mencakup pemeriksaan medis terhadap korban kejahatan atau orang yang meninggal secara tiba-tiba, penilaian cedera, identifikasi mayat, pengumpulan bukti medis, serta memberikan kesaksian ahli di pengadilan. Klinik forensik berperan penting dalam mendukung sistem peradilan dan menyediakan informasi medis yang kritis untuk penyelidikan hukum.'),
(7, 'Olahraga', 'Klinik Olahraga adalah fasilitas kesehatan yang secara khusus menyediakan pelayanan medis dan rehabilitasi untuk atlet dan individu yang terlibat dalam aktivitas fisik intensif atau olahraga. Klinik ini memiliki tim profesional yang terlatih dalam merawat cedera olahraga, memberikan perawatan fisioterapi, melibatkan program latihan khusus, serta memberikan saran untuk meningkatkan kinerja atlet.'),
(9, 'Saraf', 'Klinik Saraf adalah fasilitas pelayanan kesehatan yang secara khusus fokus pada diagnosis, pengobatan, dan manajemen berbagai gangguan dan penyakit yang berkaitan dengan sistem saraf. ');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_daftarPoli_jadwal` (`id_jadwal`),
  ADD KEY `fk_daftarPoli_pasien` (`id_pasien`);

--
-- Indeks untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detailPeriksa_periksa` (`id_periksa`),
  ADD KEY `fk_detailPeriksa_obat` (`id_obat`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indeks untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jadwal_dokter` (`id_dokter`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_periksa_daftarPoli` (`id_daftar_poli`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `periksa`
--
ALTER TABLE `periksa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar_poli`
--
ALTER TABLE `daftar_poli`
  ADD CONSTRAINT `fk_daftarPoli_jadwal` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_periksa` (`id`),
  ADD CONSTRAINT `fk_daftarPoli_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id`);

--
-- Ketidakleluasaan untuk tabel `detail_periksa`
--
ALTER TABLE `detail_periksa`
  ADD CONSTRAINT `fk_detailPeriksa_obat` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`),
  ADD CONSTRAINT `fk_detailPeriksa_periksa` FOREIGN KEY (`id_periksa`) REFERENCES `periksa` (`id`);

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id`);

--
-- Ketidakleluasaan untuk tabel `jadwal_periksa`
--
ALTER TABLE `jadwal_periksa`
  ADD CONSTRAINT `fk_jadwal_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`);

--
-- Ketidakleluasaan untuk tabel `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `fk_periksa_daftarPoli` FOREIGN KEY (`id_daftar_poli`) REFERENCES `daftar_poli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
