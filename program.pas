program ShowroomMobil;
uses crt;

type

    Mobil = record
        merk: string;
        harga: longint;
    end;


    JenisMobil = record
        namaJenis: string;
        daftarMobil: array[1..3] of Mobil;
    end;

var
    showroom: array[1..4] of JenisMobil; 
    pilihanJenis, pilihanMerk: integer;
    skemaPembayaran: string;
    lamaCicilan: integer;
    cicilan : real;
    pilihan: string;
    lagi: string;

procedure TampilkanJenisMobil;
begin
    writeln('Selamat Datang di Showroom Sukses Bersama');
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
    writeln('Pilih merk mobil (1-3):');
    for i := 1 to 3 do
        writeln(i, '. ', showroom[jenis].daftarMobil[i].merk);
end;

function HitungCicilan(harga: real; lamaCicilan: integer): real;
begin
    HitungCicilan := harga / (lamaCicilan * 12);
end;

procedure PilihSkemaPembayaran;
begin
  writeln('Pilih skema pembayaran:');
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
end;

procedure TampilkanHargaDanPembayaran(jenis, merk: integer);
begin
  writeln('Anda memilih mobil: ', showroom[jenis].daftarMobil[merk].merk);
  writeln('Harga mobil: Rp ', showroom[jenis].daftarMobil[merk].harga:0:0);
  if skemaPembayaran = 'Cicilan' then
  begin
    writeln('Masukkan lama cicilan (dalam tahun): ');
    readln(lamaCicilan);
    cicilan := HitungCicilan(showroom[jenis].daftarMobil[merk].harga, lamaCicilan);
    writeln('Cicilan per bulan: Rp ', cicilan:0:0);
  end
  else if skemaPembayaran = 'Cash' then
  begin
    writeln('Total pembayaran (cash): Rp ', showroom[jenis].daftarMobil[merk].harga:0:0);
  end;
end;


begin
    write('Welcome To Our Showroom')
end.
