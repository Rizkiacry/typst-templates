#include <iostream>
using namespace std;

int main() {
  int nominal;
  int bonus = 0;
  const int ADMIN_FEE = 2500;

  cout << "=== PEMBELIAN TOKEN LISTRIK PLN ===" << endl;
  cout << "Masukkan nominal pembelian: Rp ";
  cin >> nominal;

  if (nominal < 20000) {
    cout << "\nNominal terlalu kecil! Minimal Rp 20.000" << endl;
    return 0;
  }

  if (nominal >= 100000) {
    bonus = 5000;
  } else if (nominal >= 50000) {
    bonus = 2000;
  } else {
    bonus = 0;
  }

  int totalToken = nominal - ADMIN_FEE + bonus;

  cout << "\n--- RINCIAN PEMBELIAN ---" << endl;
  cout << "Nominal: Rp " << nominal << endl;
  cout << "Biaya Admin: Rp " << ADMIN_FEE << endl;
  cout << "Bonus: Rp " << bonus << endl;
  cout << "Token yang didapat: Rp " << totalToken << endl;

  return 0;
}
