CXX       ?= g++
CXXFLAGS  ?= -std=c++17 -O2
INCLUDES  ?= -I.


# Source lists.
HARNESS_SRCS := \
  src/harness/main.cpp \
  src/implementations/BinaryHeapInVector/BinaryHeapInVector.cpp \
  src/implementations/BinomialQueues/BinomialQueue.cpp \
  src/implementations/BinomialQueues/BQnode.cpp \
  src/implementations/BinomialQueues/InvertedListDictionary.cpp \
  src/implementations/LinearBaseLine/LinearBaseLine.cpp \
  src/implementations/Oracle/QuadraticOracle.cpp \
  utils/comparator.cpp \
  utils/TraceConfig.cpp

BTD_SRCS := \
  src/trace-generators/batch_then_drain/main.cpp \
  utils/TraceConfig.cpp

BIN_DIR := bin

.PHONY: all clean
all: $(BIN_DIR)/harness $(BIN_DIR)/batch_then_drain_trace

$(BIN_DIR)/harness:
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(HARNESS_SRCS) -o $@ $(FS_FLAG)

$(BIN_DIR)/batch_then_drain_trace:
	@mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(BTD_SRCS) -o $@ $(FS_FLAG)

clean:
	rm -rf $(BIN_DIR)


