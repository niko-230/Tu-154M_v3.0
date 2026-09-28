/*
 * stb_image wrapper for LuaJIT FFI
 * Used by PA-3 moving map to stitch/split tiles
 *
 * Build instructions in BUILD.md
 */

#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION
#define STBI_WINDOWS_UTF8   /* UTF-8 path support on Windows */
#define STBIW_WINDOWS_UTF8

#ifdef _WIN32
    #define EXPORT __declspec(dllexport)
#else
    #define EXPORT __attribute__((visibility("default")))
#endif

#include "stb_image.h"
#include "stb_image_write.h"

/* Writing functions */
EXPORT int stitch_write_png(const char *filename, int w, int h, int comp, const void *data, int stride) {
    return stbi_write_png(filename, w, h, comp, data, stride);
}

EXPORT int stitch_write_bmp(const char *filename, int w, int h, int comp, const void *data) {
    return stbi_write_bmp(filename, w, h, comp, data);
}

EXPORT int stitch_write_jpg(const char *filename, int w, int h, int comp, const void *data, int quality) {
    return stbi_write_jpg(filename, w, h, comp, data, quality);
}

/* Loading functions */
EXPORT unsigned char* stitch_load(const char *filename, int *width, int *height, int *channels, int desired_channels) {
    return stbi_load(filename, width, height, channels, desired_channels);
}

EXPORT void stitch_free(void *data) {
    stbi_image_free(data);
}

EXPORT const char* stitch_failure_reason(void) {
    return stbi_failure_reason();
}
