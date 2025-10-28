-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Okt 2025 pada 01.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `artikel`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel`
--

CREATE TABLE `artikel` (
  `id` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `penulis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artikel`
--

INSERT INTO `artikel` (`id`, `judul`, `konten`, `gambar`, `tanggal`, `penulis`) VALUES
(1, 'Kupetik Bintang', 'aku mencintaimu lebih dari yang kau tahu', '../uploads/1761604447_download.jpeg', '2025-10-28 00:00:00', 'Sir Alex Ferguson');

-- --------------------------------------------------------

--
-- Struktur dari tabel `artikel_likes`
--

CREATE TABLE `artikel_likes` (
  `id` int(11) NOT NULL,
  `artikel_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `artikel_likes`
--

INSERT INTO `artikel_likes` (`id`, `artikel_id`, `email`) VALUES
(3, 1, 'anjay@gmail.com'),
(5, 1, 'ragil@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `email` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`email`, `username`, `password`, `role`) VALUES
('admin123@admin.com', 'admin', '$2y$10$BK/9PUkgZ.jS.c6NlFDqm.fCxJZSYEo//4rNW1om3F/ln1HKm7eWy', 'admin'),
('anjay@gmail.com', 'dimas', '$2y$10$ifMF3G9w6qsiA8PYXPoJgeIlagEThUMMcZcXm17ThNoghJv/iMZ0W', 'user'),
('dimasragil471@gmail.', 'dimas', '$2y$10$83YebIJE4icAaqG/g2eVt.gFlzkvzGD5YnBMMskCTYB7xk4Bymtx6', 'user'),
('ragil@gmail.com', 'ragil', '$2y$10$MCKqt050nFB0vmypeFUgxutcJyCJv6fB8xmNL/GEyhi2mCZDlWVA6', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `artikel_likes`
--
ALTER TABLE `artikel_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `artikel_id` (`artikel_id`,`email`),
  ADD KEY `fk_artikel_likes_user` (`email`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `artikel_likes`
--
ALTER TABLE `artikel_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `artikel_likes`
--
ALTER TABLE `artikel_likes`
  ADD CONSTRAINT `fk_artikel_likes_user` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
