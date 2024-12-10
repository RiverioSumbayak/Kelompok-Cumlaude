program ShowroomMobil;
uses crt;

type
  // Definisi record untuk mobil
    Mobil = record
        merk: string;
        harga: real;
    end;

  // Array untuk menyimpan data mobil berdasarkan jenisnya
    JenisMobil = record
        namaJenis: string;
        daftarMobil: array[1..3] of Mobil;
    end;

var
    showroom: array[1..4] of JenisMobil; // 4 jenis mobil
    pilihanJenis, pilihanMerk: integer;
    skemaPembayaran: string;
    lamaCicilan: integer;
    cicilan : real;
    pilihan: string;
    lagi: string;

begin
    write('Welcome To Our Showroom')
end.
