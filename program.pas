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
    lagi: string;  // Untuk menanyakan apakah ingin memilih lagi

procedure TampilkanJenisMobil;
begin
    writeln('===============================');
    writeln('   SELAMAT DATANG DI SHOWROOM   ');
    writeln('===============================');
    writeln('Pilih jenis mobil:');
    writeln('1. Sedan');
    writeln('2. LCGC');
    writeln('3. MPV');
    writeln('4. SUV');
end;

procedure TampilkanMerkMobil(jenis: integer);
var
    i: integer;
begin
    writeln('===============================');
    writeln('Pilih merk mobil (1-3):');
    for i := 1 to 3 do
        writeln(i, '. ', showroom[jenis].daftarMobil[i].merk);
    writeln('===============================');
end;

function HitungCicilan(harga: real; lamaCicilan: integer): real;
begin
    // Menghitung cicilan per bulan
    HitungCicilan := harga / (lamaCicilan * 12);
end;

procedure PilihSkemaPembayaran;
begin
    writeln('===============================');
    writeln('   PILIH SKEMA PEMBAYARAN    ');
    writeln('===============================');
    writeln('1. Cicilan');
    writeln('2. Cash');
    write('Masukkan pilihan (1 atau 2): ');
    readln(pilihan);
    if pilihan = '1' then
        skemaPembayaran := 'Cicilan'
    else if pilihan = '2' then
        skemaPembayaran := 'Cash'
    else
        writeln('Pilihan tidak valid.');
    writeln('===============================');
end;

procedure TampilkanHargaDanPembayaran(jenis, merk: integer);
begin
    clrscr;
    writeln('===============================');
    writeln('         STRUK PEMBELIAN       ');
    writeln('===============================');
    writeln('Jenis Mobil     : ', showroom[jenis].namaJenis);
    writeln('Merk Mobil      : ', showroom[jenis].daftarMobil[merk].merk);
    writeln('Harga Mobil     : Rp ', showroom[jenis].daftarMobil[merk].harga:0:0);
    
    if skemaPembayaran = 'Cicilan' then
    begin
        write('Masukkan lama cicilan (dalam tahun): ');
        readln(lamaCicilan);
        cicilan := HitungCicilan(showroom[jenis].daftarMobil[merk].harga, lamaCicilan);
        writeln('Skema Pembayaran: Cicilan');
        writeln('Lama Cicilan    : ', lamaCicilan, ' tahun');
        writeln('Cicilan per bulan: Rp ', cicilan:0:0);
    end
    else if skemaPembayaran = 'Cash' then
    begin
        writeln('Skema Pembayaran: Cash');
        writeln('Total Pembayaran (cash): Rp ', showroom[jenis].daftarMobil[merk].harga:0:0);
    end;

    writeln('===============================');
    writeln('Terima kasih telah berbelanja!');
    writeln('===============================');
end;

begin
    // Data harga mobil berdasarkan jenis dan merk
    showroom[1].namaJenis := 'Sedan';
    showroom[1].daftarMobil[1].merk := 'Toyota Camry'; showroom[1].daftarMobil[1].harga := 500000000;
    showroom[1].daftarMobil[2].merk := 'Honda Accord'; showroom[1].daftarMobil[2].harga := 450000000;
    showroom[1].daftarMobil[3].merk := 'BMW 3 Series'; showroom[1].daftarMobil[3].harga := 900000000;

    showroom[2].namaJenis := 'LCGC';
    showroom[2].daftarMobil[1].merk := 'Toyota Agya'; showroom[2].daftarMobil[1].harga := 150000000;
    showroom[2].daftarMobil[2].merk := 'Honda Brio'; showroom[2].daftarMobil[2].harga := 160000000;
    showroom[2].daftarMobil[3].merk := 'Datsun Go'; showroom[2].daftarMobil[3].harga := 140000000;

    showroom[3].namaJenis := 'MPV';
    showroom[3].daftarMobil[1].merk := 'Toyota Innova'; showroom[3].daftarMobil[1].harga := 400000000;
    showroom[3].daftarMobil[2].merk := 'Honda Mobilio'; showroom[3].daftarMobil[2].harga := 350000000;
    showroom[3].daftarMobil[3].merk := 'Mitsubishi Xpander'; showroom[3].daftarMobil[3].harga := 375000000;

    showroom[4].namaJenis := 'SUV';
    showroom[4].daftarMobil[1].merk := 'Toyota Fortuner'; showroom[4].daftarMobil[1].harga := 650000000;
    showroom[4].daftarMobil[2].merk := 'Honda CR-V'; showroom[4].daftarMobil[2].harga := 600000000;
    showroom[4].daftarMobil[3].merk := 'Mitsubishi Pajero'; showroom[4].daftarMobil[3].harga := 700000000;

    repeat
        clrscr;
        // Menampilkan pilihan jenis mobil
        TampilkanJenisMobil;
        write('Masukkan pilihan jenis mobil (1-4): ');
        readln(pilihanJenis);

        // Memeriksa apakah pilihan jenis mobil valid
        if (pilihanJenis < 1) or (pilihanJenis > 4) then
        begin
            writeln('Pilihan jenis mobil tidak valid!');
            halt;
        end;

        // Menampilkan merk-merk mobil dari jenis yang dipilih
        TampilkanMerkMobil(pilihanJenis);
        write('Masukkan pilihan merk mobil (1-3): ');
        readln(pilihanMerk);

        // Memeriksa apakah pilihan merk mobil valid
        if (pilihanMerk < 1) or (pilihanMerk > 3) then
        begin
            writeln('Pilihan merk mobil tidak valid!');
            halt;
        end;

        // Memilih skema pembayaran
        PilihSkemaPembayaran;

        // Menampilkan harga dan rincian pembayaran
        TampilkanHargaDanPembayaran(pilihanJenis, pilihanMerk);

        writeln;
        write('Apakah Anda ingin memilih mobil lagi? (ya/tidak): ');
        readln(lagi);
    until (lagi = 'tidak') or (lagi = 'Tidak');

    writeln('Terima kasih telah berbelanja di showroom kami!');
end.
