'''membuat tabel dengan nama dummy'''
Create table dummy (
	Times date,
	User_full_name VARCHAR(100),
	Event_context VARCHAR(1000),
	Component VARCHAR(100),
	Event_name VARCHAR(1000),
	Description VARCHAR(1000),
	Origin VARCHAR(100)
);

'''untuk mengubah file csv ke dalam bentuk database'''
COPY dummy(Times,User_full_name,Event_context,Component,Event_name,Description,Origin)
FROM 'yourfile.csv'
DELIMITER ','
CSV HEADER


'''untuk menghitung jumlah tiap mahasiswa mengerjakan latihan, mengerjakan tugas, membuka url pembelajaran dan materi pembelajaran'''
'''pemilihan data yang dipakai disesuaikan dengan tujuan pembuatan model dan studi literatur penelitian sebelumnya'''
select
(select count(event_name) from dummy where user_full_name = 'nama mahasiswa'
and event_name = 'Quiz attempt started') as latihan,
(select count(event_name) from dummy where user_full_name = 'nama mahasiswa'
and event_name = 'A file has been uploaded.') as tugas,
(select count(component) from dummy where user_full_name = 'nama mahasiswa'
and component = 'URL') as URL,
(select count(component) from dummy where user_full_name = 'nama mahasiswa'
and component = 'File') as materi
