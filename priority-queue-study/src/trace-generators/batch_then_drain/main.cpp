#include <iostream>
#include <fstream>

#include "../../../utils/TraceConfig.hpp"
#include<random>
#include<iomanip>


void generateTrace(const unsigned seed,
    const std::size_t n,
    TraceConfig& config,
    std::uniform_int_distribution<int>& dist,
    std::mt19937& gen) {

    // create and open the output file name
    auto outputFileName = config.makeTraceFileName(seed, n);
    std::cout << "File name: " << outputFileName << std::endl;
    std::ofstream out(outputFileName.c_str());
    if (!out.is_open()) {
        std::cerr << "Failed to open file " << outputFileName << std::endl;
        exit(1);
    }
    out << config.profileName << " " << n << " " << seed << std::endl;

    // Generate N inserts.
    int spaceBeforeNumber = 10;
    for (unsigned id = 0; id < n; ++id) {
        out << "I " << std::setw(spaceBeforeNumber) << dist(gen) << std::setw(spaceBeforeNumber) << id << "\n";
    }

    // Generate N extract-mins (drain)
    for (unsigned i = 0; i < n; ++i) {
        out << "E\n";
    }
    out.close();
}


int main() {

    // TraceConfig provides pre-configured values such as N and seed
    TraceConfig config(std::string("batch_then_drain"));
    for (auto seed : config.seeds) {  // currently, we are using one seed only.
        std::mt19937 rng(seed);   // create a random-number generator using "seed"

        for (auto n : config.Ns) {
            // We need to limit the range of values that get generated.
            // To model the Huffman tree behavior, we want to generate a lot of
            // duplicates. So, we use choose_key_upper_bound to increase
            // the upperbound according to the size of the trace.
            const int key_min = 1;
            const int key_max = static_cast<int>(1 << 20); // or an even larger fixed bound
            std::uniform_int_distribution<int> dist(key_min, key_max);

            generateTrace(seed, n, config, dist, rng);
        }

    }

    return 0;
}