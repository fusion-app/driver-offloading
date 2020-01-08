### how to build

#### libevdev

```bash
cd libevdev-1.5.8
./configure CFLAGS=-fPIC LDFLAGS=-fPIC 
make
```

#### main

```bash
gcc -I./libevdev-1.5.8/libevdev -static input.c -o get_input ./libevdev-1.5.8/libevdev/libevdev.o
```
