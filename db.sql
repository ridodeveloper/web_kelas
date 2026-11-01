CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nis VARCHAR(20) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    kelas VARCHAR(20) NOT NULL,
    jenis_kelamin ENUM('L','P') NOT NULL,
    alamat VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS jadwal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hari ENUM('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu') NOT NULL,
    jam VARCHAR(30) NOT NULL,
    mapel VARCHAR(80) NOT NULL,
    guru VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS pengumuman (
    id INT AUTO_INCREMENT PRIMARY KEY,
    judul VARCHAR(150) NOT NULL,
    isi TEXT NOT NULL,
    tanggal DATE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Admin default: username "admin", password "admin123"
-- Hash dibuat dengan password_hash('admin123', PASSWORD_DEFAULT)
INSERT INTO users (username, password_hash) VALUES
('admin', '$2y$10$wH8Qz1VqgT7mYq3sZ8K9QeYh1n5c3J0m8xL9pR2tW6uB4vN7dS5aK');

INSERT INTO siswa (nis, nama, kelas, jenis_kelamin, alamat) VALUES
('2401001', 'Ahmad Sofyan', 'XI RPL 1', 'L', 'Jl. Merdeka No. 12, Bandung'),
('2401002', 'Siti Nurhaliza', 'XI RPL 1', 'P', 'Jl. Cendrawasih No. 5, Bandung'),
('2401003', 'Rizky Pratama', 'XI RPL 2', 'L', 'Jl. Asia Afrika No. 88, Bandung'),
('2401004', 'Dewi Lestari', 'XI RPL 2', 'P', 'Jl. Braga No. 21, Bandung'),
('2401005', 'Fajar Nugroho', 'XI TKJ 1', 'L', 'Jl. Soekarno Hatta No. 301, Bandung'),
('2401006', 'Nadia Putri', 'XI TKJ 1', 'P', 'Jl. Dago No. 45, Bandung');

INSERT INTO jadwal (hari, jam, mapel, guru) VALUES
('Senin', '07:00 - 09:00', 'Pemrograman Web', 'Bpk. Hendra'),
('Senin', '09:15 - 11:00', 'Basis Data', 'Ibu Ratna'),
('Selasa', '07:00 - 09:00', 'Pemrograman Berorientasi Objek', 'Bpk. Yudi'),
('Rabu', '07:00 - 09:00', 'Jaringan Komputer', 'Bpk. Agus'),
('Kamis', '07:00 - 09:00', 'Matematika', 'Ibu Sinta'),
('Jumat', '07:00 - 09:00', 'Bahasa Indonesia', 'Ibu Maya');

INSERT INTO pengumuman (judul, isi, tanggal) VALUES
('Ujian Tengah Semester', 'UTS dilaksanakan 15-20 November 2026. Siswa wajib membawa kartu ujian.', '2026-10-28'),
('Kerja Bakti Kelas', 'Sabtu depan pukul 08:00 seluruh siswa wajib hadir untuk kerja bakti.', '2026-10-25'),
('Pengambilan Rapor', 'Rapor semester ganjil dibagikan ke wali murid hari Sabtu pukul 09:00.', '2026-10-20');
