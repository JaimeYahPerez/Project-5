
CXX      := g++
CXXFLAGS := -std=c++20 -O2 -Wall -Wextra -I.
LDFLAGS  :=

BIN_DIR := bin
OBJ_DIR := obj

# ---- Source lists (keep explicit & readable) ----
# Harness (priority-queue runner)
HARNESS_SRCS := \
  src/harness/main.cpp \
  src/implementations/BinaryHeapInVector/BinaryHeapInVector.cpp \
  src/implementations/BinomialQueues/BinomialQueue.cpp \
  src/implementations/BinomialQueues/BQnode.cpp \
  src/implementations/LinearBaseLine/LinearBaseLine.cpp \
  src/implementations/Oracle/QuadraticOracle.cpp \
  utils/comparator.cpp

# Huffman trace generator
HUFFTRACE_SRCS := \
  src/trace-generators/huffman_coding/main.cpp

# Batch-then-drain trace generator
BTDTRACE_SRCS := \
  src/trace-generators/batch_then_drain/main.cpp \
  
# ---- Targets ----
HARNESS_BIN    := $(BIN_DIR)/harness
HUFFTRACE_BIN  := $(BIN_DIR)/huffman_trace
BTDTRACE_BIN   := $(BIN_DIR)/batch_then_drain_trace
TOP_BIN        := $(BIN_DIR)/top_level_main

HARNESS_OBJS    := $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(HARNESS_SRCS))
HUFFTRACE_OBJS  := $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(HUFFTRACE_SRCS))
BTDTRACE_OBJS   := $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(BTDTRACE_SRCS))
TOP_OBJS        := $(patsubst %.cpp,$(OBJ_DIR)/%.o,$(TOP_SRCS))

.PHONY: all clean dirs
all: dirs $(HARNESS_BIN) $(HUFFTRACE_BIN) $(BTDTRACE_BIN)

dirs:
	@mkdir -p $(BIN_DIR) $(OBJ_DIR)
	@mkdir -p $(dir $(HARNESS_OBJS)) $(dir $(HUFFTRACE_OBJS)) $(dir $(BTDTRACE_OBJS)) $(dir $(TOP_OBJS))

# Pattern rule to build any .o under obj/ from a matching .cpp at project root
$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link rules
$(HARNESS_BIN): $(HARNESS_OBJS) | dirs
	$(CXX) $(LDFLAGS) $^ -o $@

$(HUFFTRACE_BIN): $(HUFFTRACE_OBJS) | dirs
	$(CXX) $(LDFLAGS) $^ -o $@

$(BTDTRACE_BIN): $(BTDTRACE_OBJS) | dirs
	$(CXX) $(LDFLAGS) $^ -o $@

.PHONY: harness huffman_trace batch_then_drain_trace all clean dirs

harness:            $(HARNESS_BIN)
huffman_trace:      $(HUFFTRACE_BIN)
batch_then_drain_trace: $(BTDTRACE_BIN)

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)