-- Delete database jika ada database bernama yang sama
DROP DATABASE IF EXISTS tugas;

-- Membuat database
CREATE DATABASE tugas;



-- Soal 1

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS customer CASCADE;

-- Membuat table customer sebagai Parent
CREATE TABLE customer(
    id INT PRIMARY KEY,
    nama_customer VARCHAR(255) NOT NULL,
    umur_customer INT NOT NULL
);

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS detail;

-- Membuat table customer detail sebagai Child
CREATE TABLE detail(
    id INT PRIMARY KEY,
    alamat VARCHAR(255),
    tinggi_badan INT,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customer(id)
        ON DELETE CASCADE
);

-- Insert data customer
INSERT INTO customer(id, nama_customer, umur_customer)
    VALUES(1, 'dika', 22), (2, 'dian', 34), (3, 'rian', 44);

-- Insert data detail
INSERT INTO detail(id, alamat, tinggi_badan, customer_id)
    VALUES(1, 'Bojonggede', 150, 1), (2, 'Depok', 160, 2), (3, 'Cianjur', 170, 3);

-- Read data customer
SELECT * FROM customer;
SELECT nama_customer FROM customer;
SELECT * FROM customer WHERE id = 1;

-- Read data detail
SELECT * FROM detail;
SELECT alamat FROM detail;
SELECT * FROM detail WHERE customer_id = 1;

-- Update data customer
UPDATE customer
    SET umur_customer = 33
    WHERE id = 1;

-- Update data detail
UPDATE detail
    SET tinggi_badan = 177
    WHERE id = 1;

-- Delete data customer 
-- Note, bila customer di delete, maka detail yang mereferensi
-- data tersebut akan hilang juga
DELETE FROM customer
    WHERE id = 1;

-- Delete data detail
DELETE FROM detail
    WHERE id IN (2, 3);



-- Soal 2

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS departemen CASCADE;

-- Membuat table departemen sebagai Parent
CREATE TABLE departemen(
    id INT PRIMARY KEY,
    nama_departemen VARCHAR(255) NOT NULL,
    slogan VARCHAR(255) NOT NULL
);

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS pegawai;

-- Membuat table pegawai sebagai Child
CREATE TYPE gender AS ENUM ('Laki-laki','Perempuan');
CREATE TABLE pegawai(
    id INT PRIMARY KEY,
    nama_pegawai VARCHAR(255),
    jenis_kelamin gender,
    gaji INT,
    departemen_id INT,
    FOREIGN KEY (departemen_id)
        REFERENCES departemen(id)
        ON DELETE CASCADE
);

-- Insert data departemen
INSERT INTO departemen(id, nama_departemen, slogan)
    VALUES(1, 'Keuangan', 'Hemat pangkal kaya'),
    (2, 'Kesehatan', 'Mencegah lebih baik daripada mengobati');

-- Insert data pegawai
INSERT INTO pegawai(id, nama_pegawai, jenis_kelamin, gaji, departemen_id)
    VALUES(1, 'Rahmat', 'Laki-laki', 3000000, 1),
    (2, 'Lisa', 'Perempuan', 3500000, 1),
    (3, 'Jesika', 'Perempuan', 3500000, 2);

-- Read data departemen 
SELECT * FROM departemen;
SELECT nama_departemen FROM departemen;
SELECT * FROM departemen WHERE id = 1;

-- Read data pegawai
SELECT * FROM pegawai;
SELECT jenis_kelamin FROM pegawai;
SELECT * FROM pegawai WHERE departemen_id = 1;

-- Update data departemen 
UPDATE departemen
    SET slogan = 'Selamat tahun baru'
    WHERE id = 1;

-- Update data pegawai
UPDATE pegawai 
    SET gaji = 4000000
    WHERE id = 1;

-- Delete data departemen 
-- Note, bila departmen di delete, maka pegawai yang mereferensi
-- data tersebut akan hilang juga
DELETE FROM departemen 
    WHERE id = 1;

-- Delete data pegawai
DELETE FROM pegawai
    WHERE id = 3;



-- Soal 3

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS pelanggan CASCADE;

-- Membuat table departemen sebagai Parent
CREATE TABLE pelanggan(
    id INT PRIMARY KEY,
    nama_pelanggan VARCHAR(255) NOT NULL,
    umur_pelanggan INT NOT NULL
);


-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS jasa CASCADE;

-- Membuat table departemen sebagai Parent
CREATE TABLE jasa(
    id INT PRIMARY KEY,
    nama_jasa VARCHAR(255) NOT NULL,
    harga_jasa INT NOT NULL
);

-- Delete table jika ada table bernama yang sama
DROP TABLE IF EXISTS langganan;

-- Membuat table departemen sebagai Parent
CREATE TABLE langganan(
    id INT PRIMARY KEY,
    jasa_id INT,
    pelanggan_id INT,
    FOREIGN KEY (jasa_id)
        REFERENCES jasa(id),
    FOREIGN KEY (pelanggan_id)
        REFERENCES pelanggan(id)
);


-- Insert data jasa 
INSERT INTO jasa(id, nama_jasa, harga_jasa)
    VALUES(1, 'Koding', 500000),
    (2, 'Laundry', 20000);

-- Insert data pelanggan 
INSERT INTO pelanggan(id, nama_pelanggan, umur_pelanggan)
    VALUES(1, 'Rudi', 39),
    (2, 'Sifa', 27);

-- Insert data langganan
INSERT INTO langganan(id, jasa_id, pelanggan_id)
    VALUES(1, 1, 1), (2, 2, 1), (3, 2, 2);

-- Read data jasa 
SELECT * FROM jasa;
SELECT nama_jasa FROM jasa;
SELECT * FROM jasa WHERE id = 1;

-- Read data pelanggan
SELECT * FROM pelanggan;
SELECT umur_pelanggan FROM pelanggan;
SELECT * FROM pelanggan WHERE id = 1;

-- Read data langganan
SELECT * FROM langganan;
SELECT pelanggan_id FROM langganan;
SELECT * FROM langganan WHERE jasa_id = 1;

-- Update data jasa 
UPDATE jasa
    SET harga_jasa = 200000
    WHERE id = 1;

-- Update data pelanggan
UPDATE pelanggan 
    SET umur_pelanggan = 55
    WHERE id = 1;

-- Delete data langganan
DELETE FROM langganan 
    WHERE id = 1;