CXX      := g++
CXXFLAGS := -O3 -march=native -std=c++20 -Wall -Wextra -Isrc

BIN_DIR  := bin
TRACES   := traces
CSVS     := csvs

HARNESS_SRCS := \
  src/harness/main.cpp \
  utils/comparator.cpp src/utils/TraceConfig.hpp \
  $(wildcard src/implementations/BinaryHeapInVector/*.cpp) \
  $(wildcard src/implementations/BinomialQueues/*.cpp) \
  $(wildcard src/implementations/LinearBaseLine/*.cpp) \
  $(wildcard src/implementations/Oracle/*.cpp)

HUFGEN_SRCS := src/trace-generators/huffman_coding/main.cpp
BTDGEN_SRCS := src/trace-generators/batch_then_drain/main.cpp

.PHONY: all clean run-harness gen-huffman gen-btd

all: $(BIN_DIR)/harness $(BIN_DIR)/huffman_trace $(BIN_DIR)/batch_then_drain

$(BIN_DIR)/harness: $(HARNESS_SRCS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BIN_DIR)/huffman_trace: $(HUFGEN_SRCS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

$(BIN_DIR)/batch_then_drain: $(BTDGEN_SRCS)
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $^ -o $@

run-harness: $(BIN_DIR)/harness
	@mkdir -p $(CSVS)
	./$(BIN_DIR)/harness > $(CSVS)/batch_then_drain.csv

gen-huffman: $(BIN_DIR)/huffman_trace
	@mkdir -p $(TRACES)/huffman_coding
	./$(BIN_DIR)/huffman_trace

gen-btd: $(BIN_DIR)/batch_then_drain
	@mkdir -p $(TRACES)/batch_then_drain
	./$(BIN_DIR)/batch_then_drain

clean:
	rm -rf $(BIN_DIR)