CXX       ?= g++
CXXFLAGS  ?= -std=c++17 -O2
INCLUDES  ?= -I.


# Source lists.
IMPL_SRCS      := $(shell find src/implementations -type f -name '*.cpp' 2>/dev/null)
HARNESS_SRCS   := $(wildcard src/harness/*.cpp) $(IMPL_SRCS) $(wildcard utils/*.cpp)
BTD_SRCS       := $(wildcard src/trace-generators/batch_then_drain/*.cpp) $(wildcard utils/*.cpp)

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
