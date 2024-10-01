import 'pegawai.dart';

void main(List<String> arguments) {
  List<Staff> dataPegawai = genData(dummyData());

  for (final pegawai in dataPegawai) {
    print(pegawai.deskripsi());
  }

  dataPegawai[2].absenMasuk(DateTime.parse('2023-08-01 09:00:08'));
}

List<Staff> genData(var listData) {
  List<Staff> data = [];

  for (var pegawai in listData) {
    dynamic staff;
    if (pegawai.containsKey('jabatan')) {
      staff = Pejabat(pegawai['npp'], pegawai['nama'], pegawai['jabatan']);
    } else {
      staff = Karyawan(pegawai['npp'], pegawai['nama']);
    }

    if (pegawai.containsKey('thn_masuk')) {
      staff.thnMasuk = pegawai['thn_masuk'];
    }

    if (pegawai.containsKey('alamat')) {
      staff.alamat = pegawai['alamat'];
    }

    data.add(staff);
  }

  return data;
}

List<Map<String, dynamic>> dummyData() {
  List<Map<String, dynamic>> data = [
    {
      "npp": "A123",
      "nama": "Lars Bak",
      "thn_masuk": 2017,
      "jabatan": TipeJabatan.direktur,
      "alamat": "Semarang Indonesia"
    },
    {
      "npp": "A345",
      "nama": "Kasper Lund",
      "thn_masuk": 2018,
      "jabatan": TipeJabatan.manajer,
      "alamat": "Semarang Indonesia"
    },
    {"npp": "B231", "nama": "Guido Van Rossum", "alamat": "California Amerika"},
    {
      "npp": "B355",
      "nama": "Rasmus Lerdorf",
      "thn_masuk": 2015,
      "alamat": "Bandung Indonesia"
    },
    {
      "npp": "B355",
      "nama": "Dennis MacAlistair Ritchie",
      "jabatan": TipeJabatan.kabag,
      "alamat": "Bandung Indonesia"
    },
  ];

  return data;
}

//tambahkan di pubspec.yaml, dependencies
//intl: ^0.19.0