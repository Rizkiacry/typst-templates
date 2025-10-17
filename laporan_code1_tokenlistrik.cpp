#include <iostream>

using namespace std;

int main() {
    long nominal_pembelian;
    const int biaya_admin = 2500;
    int bonus = 0;
    long total_token;

    cout << "=== PEMBELIAN TOKEN LISTRIK PLN ===" << endl;
    cout << "Masukkan nominal pembelian: Rp ";
    cin >> nominal_pembelian;
    cout << endl;

    // Logika penentuan bonus dan validasi input menggunakan if-else if-else
    if (nominal_pembelian < 20000) {
        cout << "Nominal terlalu kecil! Minimal Rp 20.000" << endl;
    } else if (nominal_pembelian >= 100000) {
        bonus = 5000;
        total_token = nominal_pembelian - biaya_admin + bonus;

        cout << "--- RINCIAN PEMBELIAN ---" << endl;
        cout << "Nominal: Rp " << nominal_pembelian << endl;
        cout << "Biaya Admin: Rp " << biaya_admin << endl;
        cout << "Bonus: Rp " << bonus << endl;
        cout << "Token yang didapat: Rp " << total_token << endl;
    } else if (nominal_pembelian >= 50000) {
        bonus = 2000;
        total_token = nominal_pembelian - biaya_admin + bonus;

        cout << "--- RINCIAN PEMBELIAN ---" << endl;
        cout << "Nominal: Rp " << nominal_pembelian << endl;
        cout << "Biaya Admin: Rp " << biaya_admin << endl;
        cout << "Bonus: Rp " << bonus << endl;
        cout << "Token yang didapat: Rp " << total_token << endl;
    } else { // Kondisi untuk >= 20000 dan < 50000
        bonus = 0;
        total_token = nominal_pembelian - biaya_admin + bonus;

        cout << "--- RINCIAN PEMBELIAN ---" << endl;
        cout << "Nominal: Rp " << nominal_pembelian << endl;
        cout << "Biaya Admin: Rp " << biaya_admin << endl;
        cout << "Bonus: Rp " << bonus << endl;
        cout << "Token yang didapat: Rp " << total_token << endl;
    }

    return 0; // Mengakhiri program
}