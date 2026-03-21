#include <iostream>
#include <fstream>
#include <vector>
#include <string>

using namespace std;
// readNumbers reads numbers from a file
bool readNumbers(const string& fileName, vector<unsigned char>& numbers) {
    ifstream in(fileName.c_str());
    if (!in.is_open()) {
        return false;
    }

    int value;
    while (in >> value) {
        if (value < 0 || value > 255) {
            in.close();
            return false;
        }
        numbers.push_back(static_cast<unsigned char>(value));
    }

    in.close();
    return true;
}

bool writeNumbers(const string& fileName, const vector<unsigned char>& numbers) {
    ofstream out(fileName.c_str());
    if (!out.is_open()) {
        return false;
    }

    for (size_t i = 0; i < numbers.size(); i++) {
        out << static_cast<int>(numbers[i]);
        if (i + 1 < numbers.size()) {
            out << " ";
        }
    }

    out.close();
    return true;
}

// stableSortBitIndexes vrne indekse elementov po stabilnem sortiranju izbranega bita
vector<int> stableSortBitIndexes(const vector<unsigned char>& a, int bitIndex) {
    size_t n = a.size();

    vector<int> bits(n);
    for (size_t i = 0; i < n; i++) {
        bits[i] = (a[i] >> bitIndex) & 1;
    }

    vector<int> count(2, 0);
    for (size_t i = 0; i < n; i++) {
        count[bits[i]]++;
    }

    // pretvorba stevil pojavitev v koncne pozicije
    count[1] = count[1] + count[0];

    vector<int> sortedIndexes(n);

    for (int i = static_cast<int>(n) - 1; i >= 0; i--) {
        int bit = bits[i];
        sortedIndexes[count[bit] - 1] = i;
        count[bit]--;
    }

    return sortedIndexes;
}

int main(int argc, char* argv[]) {
    if (argc != 2) {
        return 1;
    }

    string inputFile = argv[1];
    vector<unsigned char> numbers;

    if (!readNumbers(inputFile, numbers)) {
        return 1;
    }

    if (!writeNumbers("out.txt", numbers)) {
        return 1;
    }

    return 0;
}