CC = g++

CFLAGS = -c -Wall -std=c++14 -I/usr/include/libdrm -Iinclude
LIBS = -lglfw -lrt -lm -ldl -lXrandr -lXinerama -lXi -lXcursor -lXrender -lGL -lm -lpthread -pthread -ldl -ldrm -lXdamage -lXfixes -lX11-xcb -lxcb-glx -lxcb-dri2 -lXxf86vm -lXext -lX11 -lpthread -lxcb -lXau -lXdmcp

TARGET = main

$(TARGET): main.o glad.o
	$(CC) -o main main.o glad.o $(LIBS)

main.o: src/main.cpp
	$(CC) $(CFLAGS) src/main.cpp

glad.o: src/glad.c
	$(CC) $(CFLAGS) src/glad.c

run:
	./main

clean:
	rm -rf *.o $(TARGET)

