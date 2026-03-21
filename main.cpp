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