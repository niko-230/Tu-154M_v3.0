# Building stb_stitch

Minimal shared library wrapping stb_image and stb_image_write for LuaJIT FFI usage.
Supports both loading large images into tiles and stitching tiles into large images.

## Prerequisites

- CMake 3.10+
- C compiler (MSVC/Clang/GCC)

## Quick Build (CMake)

```bash
mkdir build && cd build
cmake ..
cmake --build . --config Release
```

The compiled library will be copied to the source directory.

## Manual Build

### Windows (MSVC)

From Developer Command Prompt:
```batch
cl /LD /O2 /Fe:win64.xpl stb_image_write_lib.c
```

### Windows (MinGW-w64)

```batch
gcc -shared -O2 -o win64.xpl stb_image_write_lib.c
```

### Linux

```bash
gcc -shared -fPIC -O2 -o lin64.xpl stb_image_write_lib.c
```

### macOS (Universal Binary)

```bash
clang -shared -fPIC -O2 -arch x86_64 -arch arm64 -o mac.xpl stb_image_write_lib.c
```

## Output Files

| Platform | Filename    |
|----------|-------------|
| Windows  | win64.xpl   |
| Linux    | lin64.xpl   |
| macOS    | mac.xpl     |

## API

### Writing

```c
int stitch_write_png(const char *filename, int w, int h, int comp, const void *data, int stride);
int stitch_write_bmp(const char *filename, int w, int h, int comp, const void *data);
int stitch_write_jpg(const char *filename, int w, int h, int comp, const void *data, int quality);
```

### Loading

```c
unsigned char* stitch_load(const char *filename, int *width, int *height, int *channels, int desired_channels);
void stitch_free(void *data);
const char* stitch_failure_reason(void);
```

### Parameters

- `comp`: number of components (3=RGB, 4=RGBA)
- `stride`: bytes per row (usually `w * comp` for PNG)
- `quality`: JPEG quality 1-100
- `desired_channels`: force output channels (0=same as file, 4=RGBA)

## License

stb_image.h and stb_image_write.h are public domain / MIT licensed.
See: https://github.com/nothings/stb
