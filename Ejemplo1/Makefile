CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -O2

TARGET = Ejemplo1
SRC = $(wildcard src/*.cpp)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -Iinclude -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)
