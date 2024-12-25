nasm -f elf64 file.asm -o file.o
gcc file.obj -static -g -o file
./file
