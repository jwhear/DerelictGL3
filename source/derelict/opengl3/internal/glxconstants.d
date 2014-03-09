/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.opengl3.internal.glxconstants;

private import derelict.util.system;

static if( Derelict_OS_Posix && !Derelict_OS_Mac ) {
    import derelict.util.xtypes;

    // GLX
    enum {
        GLX_USE_GL = 1,
        GLX_BUFFER_SIZE = 2,
        GLX_LEVEL = 3,
        GLX_RGBA = 4,
        GLX_DOUBLEBUFFER = 5,
        GLX_STEREO = 6,
        GLX_AUX_BUFFERS = 7,
        GLX_RED_SIZE = 8,
        GLX_GREEN_SIZE = 9,
        GLX_BLUE_SIZE = 10,
        GLX_ALPHA_SIZE = 11,
        GLX_DEPTH_SIZE = 12,
        GLX_STENCIL_SIZE = 13,
        GLX_ACCUM_RED_SIZE = 14,
        GLX_ACCUM_GREEN_SIZE = 15,
        GLX_ACCUM_BLUE_SIZE = 16,
        GLX_ACCUM_ALPHA_SIZE = 17,
        GLX_BAD_SCREEN = 1,
        GLX_BAD_ATTRIBUTE = 2,
        GLX_NO_EXTENSION = 3,
        GLX_BAD_VISUAL = 4,
        GLX_BAD_CONTEXT = 5,
        GLX_BAD_VALUE = 6,
        GLX_BAD_ENUM = 7,
        GLX_CONFIG_CAVEAT = 0x20,
        GLX_DONT_CARE = 0xFFFFFFFF,
        GLX_X_VISUAL_TYPE = 0x22,
        GLX_TRANSPARENT_TYPE = 0x23,
        GLX_TRANSPARENT_INDEX_VALUE = 0x24,
        GLX_TRANSPARENT_RED_VALUE = 0x25,
        GLX_TRANSPARENT_GREEN_VALUE = 0x26,
        GLX_TRANSPARENT_BLUE_VALUE = 0x27,
        GLX_TRANSPARENT_ALPHA_VALUE = 0x28,
        GLX_WINDOW_BIT = 0x00000001,
        GLX_PIXMAP_BIT = 0x00000002,
        GLX_PBUFFER_BIT = 0x00000004,
        GLX_AUX_BUFFERS_BIT = 0x00000010,
        GLX_FRONT_LEFT_BUFFER_BIT = 0x00000001,
        GLX_FRONT_RIGHT_BUFFER_BIT = 0x00000002,
        GLX_BACK_LEFT_BUFFER_BIT = 0x00000004,
        GLX_BACK_RIGHT_BUFFER_BIT = 0x00000008,
        GLX_DEPTH_BUFFER_BIT = 0x00000020,
        GLX_STENCIL_BUFFER_BIT = 0x00000040,
        GLX_ACCUM_BUFFER_BIT = 0x00000080,
        GLX_NONE = 0x8000,
        GLX_SLOW_CONFIG = 0x8001,
        GLX_TRUE_COLOR = 0x8002,
        GLX_DIRECT_COLOR = 0x8003,
        GLX_PSEUDO_COLOR = 0x8004,
        GLX_STATIC_COLOR = 0x8005,
        GLX_GRAY_SCALE = 0x8006,
        GLX_STATIC_GRAY = 0x8007,
        GLX_TRANSPARENT_RGB = 0x8008,
        GLX_TRANSPARENT_INDEX = 0x8009,
        GLX_VISUAL_ID = 0x800B,
        GLX_SCREEN = 0x800C,
        GLX_NON_CONFORMANT_CONFIG = 0x800D,
        GLX_DRAWABLE_TYPE = 0x8010,
        GLX_RENDER_TYPE = 0x8011,
        GLX_X_RENDERABLE = 0x8012,
        GLX_FBCONFIG_ID = 0x8013,
        GLX_RGBA_TYPE = 0x8014,
        GLX_COLOR_INDEX_TYPE = 0x8015,
        GLX_MAX_PBUFFER_WIDTH = 0x8016,
        GLX_MAX_PBUFFER_HEIGHT = 0x8017,
        GLX_MAX_PBUFFER_PIXELS = 0x8018,
        GLX_PRESERVED_CONTENTS = 0x801B,
        GLX_LARGEST_PBUFFER = 0x801C,
        GLX_WIDTH = 0x801D,
        GLX_HEIGHT = 0x801E,
        GLX_EVENT_MASK = 0x801F,
        GLX_DAMAGED = 0x8020,
        GLX_SAVED = 0x8021,
        GLX_WINDOW = 0x8022,
        GLX_PBUFFER = 0x8023,
        GLX_PBUFFER_HEIGHT = 0x8040,
        GLX_PBUFFER_WIDTH = 0x8041,
        GLX_RGBA_BIT = 0x00000001,
        GLX_COLOR_INDEX_BIT = 0x00000002,
        GLX_PBUFFER_CLOBBER_MASK = 0x08000000,
        GLX_SAMPLE_BUFFERS = 0x186a0,
        GLX_SAMPLES = 0x186a1,
    }

    struct __GLXcontextRec;
    struct __GLXFBConfigRec;

    alias GLXContentID = uint;
    alias GLXPixmap = uint;
    alias GLXDrawable = uint;
    alias GLXPbuffer = uint;
    alias GLXWindow = uint;
    alias GLXFBConfigID = uint;

    alias GLXContext = __GLXcontextRec*;
    alias GLXFBConfig = __GLXFBConfigRec*;

    struct GLXPbufferClobberEvent {
        int         event_type;
        int         draw_type;
        uint        serial;
        Bool        send_event;
        Display*    display;
        GLXDrawable drawable;
        uint        buffer_mask;
        uint        aux_buffer;
        int         x, y;
        int         width, height;
        int         count;
    }

    union GLXEvent {
        GLXPbufferClobberEvent glxpbufferclobber;
        int pad[24];
    }

    alias GLXContextID = XID;
    alias GLXVideoCaptureDeviceNV = XID;
    alias GLXPbufferSGIX = XID;
    alias GLXVideoDeviceNV = uint;
    alias GLXFBConfigSGIX = __GLXFBConfigRec*;

    // GLXARB
    enum : uint {
        GLX_CONTEXT_DEBUG_BIT_ARB = 0x00000001,
        GLX_CONTEXT_FORWARD_COMPATIBLE_BIT_ARB = 0x00000002,
        GLX_CONTEXT_MAJOR_VERSION_ARB = 0x2091,
        GLX_CONTEXT_MINOR_VERSION_ARB = 0x2092,
        GLX_CONTEXT_FLAGS_ARB = 0x2094,
        GLX_CONTEXT_CORE_PROFILE_BIT_ARB = 0x00000001,
        GLX_CONTEXT_COMPATIBILITY_PROFILE_BIT_ARB = 0x00000002,
        GLX_CONTEXT_PROFILE_MASK_ARB = 0x9126,
        GLX_CONTEXT_ROBUST_ACCESS_BIT_ARB = 0x00000004,
        GLX_LOSE_CONTEXT_ON_RESET_ARB = 0x8252,
        GLX_CONTEXT_RESET_NOTIFICATION_STRATEGY_ARB = 0x8256,
        GLX_NO_RESET_NOTIFICATION_ARB = 0x8261,
        GLX_RGBA_FLOAT_TYPE_ARB = 0x20B9,
        GLX_RGBA_FLOAT_BIT_ARB = 0x00000004,
        GLX_FRAMEBUFFER_SRGB_CAPABLE_ARB  = 0x20B2,
        GLX_SAMPLE_BUFFERS_ARB = 100000,
        GLX_SAMPLES_ARB = 100001,
        GLX_CONTEXT_RESET_ISOLATION_BIT_ARB = 0x00000008,
        GLX_SAMPLE_BUFFERS_3DFX = 0x8050,
        GLX_SAMPLES_3DFX = 0x8051,
        GLX_GPU_VENDOR_AMD = 0x1F00,
        GLX_GPU_RENDERER_STRING_AMD = 0x1F01,
        GLX_GPU_OPENGL_VERSION_STRING_AMD = 0x1F02,
        GLX_GPU_FASTEST_TARGET_GPUS_AMD = 0x21A2,
        GLX_GPU_RAM_AMD = 0x21A3,
        GLX_GPU_CLOCK_AMD = 0x21A4,
        GLX_GPU_NUM_PIPES_AMD = 0x21A5,
        GLX_GPU_NUM_SIMD_AMD = 0x21A6,
        GLX_GPU_NUM_RB_AMD = 0x21A7,
        GLX_GPU_NUM_SPI_AMD = 0x21A8,
        GLX_BACK_BUFFER_AGE_EXT = 0x20F4,
        GLX_CONTEXT_ES2_PROFILE_BIT_EXT = 0x00000004,
        GLX_CONTEXT_ES_PROFILE_BIT_EXT = 0x00000004,
        GLX_RGBA_UNSIGNED_FLOAT_TYPE_EXT = 0x20B1,
        GLX_RGBA_UNSIGNED_FLOAT_BIT_EXT = 0x00000008,
        GLX_FRAMEBUFFER_SRGB_CAPABLE_EXT = 0x20B2,
        GLX_SHARE_CONTEXT_EXT = 0x800A,
        GLX_VISUAL_ID_EXT = 0x800B,
        GLX_SCREEN_EXT = 0x800C,
        GLX_SWAP_INTERVAL_EXT = 0x20F1,
        GLX_MAX_SWAP_INTERVAL_EXT = 0x20F2,
        GLX_LATE_SWAPS_TEAR_EXT = 0x20F3,
        GLX_TEXTURE_1D_BIT_EXT = 0x00000001,
        GLX_TEXTURE_2D_BIT_EXT = 0x00000002,
        GLX_TEXTURE_RECTANGLE_BIT_EXT = 0x00000004,
        GLX_BIND_TO_TEXTURE_RGB_EXT = 0x20D0,
        GLX_BIND_TO_TEXTURE_RGBA_EXT = 0x20D1,
        GLX_BIND_TO_MIPMAP_TEXTURE_EXT = 0x20D2,
        GLX_BIND_TO_TEXTURE_TARGETS_EXT = 0x20D3,
        GLX_Y_INVERTED_EXT = 0x20D4,
        GLX_TEXTURE_FORMAT_EXT = 0x20D5,
        GLX_TEXTURE_TARGET_EXT = 0x20D6,
        GLX_MIPMAP_TEXTURE_EXT = 0x20D7,
        GLX_TEXTURE_FORMAT_NONE_EXT = 0x20D8,
        GLX_TEXTURE_FORMAT_RGB_EXT = 0x20D9,
        GLX_TEXTURE_FORMAT_RGBA_EXT = 0x20DA,
        GLX_TEXTURE_1D_EXT = 0x20DB,
        GLX_TEXTURE_2D_EXT = 0x20DC,
        GLX_TEXTURE_RECTANGLE_EXT = 0x20DD,
        GLX_FRONT_LEFT_EXT = 0x20DE,
        GLX_FRONT_RIGHT_EXT = 0x20DF,
        GLX_BACK_LEFT_EXT = 0x20E0,
        GLX_BACK_RIGHT_EXT = 0x20E1,
        GLX_FRONT_EXT = 0x20DE,
        GLX_BACK_EXT = 0x20E0,
        GLX_AUX0_EXT = 0x20E2,
        GLX_AUX1_EXT = 0x20E3,
        GLX_AUX2_EXT = 0x20E4,
        GLX_AUX3_EXT = 0x20E5,
        GLX_AUX4_EXT = 0x20E6,
        GLX_AUX5_EXT = 0x20E7,
        GLX_AUX6_EXT = 0x20E8,
        GLX_AUX7_EXT = 0x20E9,
        GLX_AUX8_EXT = 0x20EA,
        GLX_AUX9_EXT = 0x20EB,
        GLX_X_VISUAL_TYPE_EXT = 0x22,
        GLX_TRANSPARENT_TYPE_EXT = 0x23,
        GLX_TRANSPARENT_INDEX_VALUE_EXT = 0x24,
        GLX_TRANSPARENT_RED_VALUE_EXT = 0x25,
        GLX_TRANSPARENT_GREEN_VALUE_EXT = 0x26,
        GLX_TRANSPARENT_BLUE_VALUE_EXT = 0x27,
        GLX_TRANSPARENT_ALPHA_VALUE_EXT = 0x28,
        GLX_NONE_EXT = 0x8000,
        GLX_TRUE_COLOR_EXT = 0x8002,
        GLX_DIRECT_COLOR_EXT = 0x8003,
        GLX_PSEUDO_COLOR_EXT = 0x8004,
        GLX_STATIC_COLOR_EXT = 0x8005,
        GLX_GRAY_SCALE_EXT = 0x8006,
        GLX_STATIC_GRAY_EXT = 0x8007,
        GLX_TRANSPARENT_RGB_EXT = 0x8008,
        GLX_TRANSPARENT_INDEX_EXT = 0x8009,
        GLX_VISUAL_CAVEAT_EXT = 0x20,
        GLX_SLOW_VISUAL_EXT = 0x8001,
        GLX_NON_CONFORMANT_VISUAL_EXT = 0x800D,
        GLX_BUFFER_SWAP_COMPLETE_INTEL_MASK = 0x04000000,
        GLX_EXCHANGE_COMPLETE_INTEL = 0x8180,
        GLX_COPY_COMPLETE_INTEL = 0x8181,
        GLX_FLIP_COMPLETE_INTEL = 0x8182,
        GLX_3DFX_WINDOW_MODE_MESA = 0x1,
        GLX_3DFX_FULLSCREEN_MODE_MESA = 0x2,
        GLX_FLOAT_COMPONENTS_NV = 0x20B0,
        GLX_COVERAGE_SAMPLES_NV = 100001,
        GLX_COLOR_SAMPLES_NV = 0x20B3,
        GLX_DEVICE_ID_NV = 0x20CD,
        GLX_UNIQUE_ID_NV = 0x20CE,
        GLX_NUM_VIDEO_CAPTURE_SLOTS_NV = 0x20CF,
        GLX_VIDEO_OUT_COLOR_NV = 0x20C3,
        GLX_VIDEO_OUT_ALPHA_NV = 0x20C4,
        GLX_VIDEO_OUT_DEPTH_NV = 0x20C5,
        GLX_VIDEO_OUT_COLOR_AND_ALPHA_NV = 0x20C6,
        GLX_VIDEO_OUT_COLOR_AND_DEPTH_NV = 0x20C7,
        GLX_VIDEO_OUT_FRAME_NV = 0x20C8,
        GLX_VIDEO_OUT_FIELD_1_NV = 0x20C9,
        GLX_VIDEO_OUT_FIELD_2_NV = 0x20CA,
        GLX_VIDEO_OUT_STACKED_FIELDS_1_2_NV = 0x20CB,
        GLX_VIDEO_OUT_STACKED_FIELDS_2_1_NV = 0x20CC,
        GLX_SWAP_METHOD_OML = 0x8060,
        GLX_SWAP_EXCHANGE_OML = 0x8061,
        GLX_SWAP_COPY_OML = 0x8062,
        GLX_SWAP_UNDEFINED_OML = 0x8063,
        GLX_BLENDED_RGBA_SGIS = 0x8025,
        GLX_SAMPLE_BUFFERS_SGIS = 100000,
        GLX_SAMPLES_SGIS = 100001,
        GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS = 0x8026,
        GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS = 0x8027,
        GLX_WINDOW_BIT_SGIX = 0x00000001,
        GLX_PIXMAP_BIT_SGIX = 0x00000002,
        GLX_RGBA_BIT_SGIX = 0x00000001,
        GLX_COLOR_INDEX_BIT_SGIX = 0x00000002,
        GLX_DRAWABLE_TYPE_SGIX = 0x8010,
        GLX_RENDER_TYPE_SGIX = 0x8011,
        GLX_X_RENDERABLE_SGIX = 0x8012,
        GLX_FBCONFIG_ID_SGIX = 0x8013,
        GLX_RGBA_TYPE_SGIX                = 0x8014,
        GLX_COLOR_INDEX_TYPE_SGIX         = 0x8015,
        GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX = 80,
        GLX_BAD_HYPERPIPE_CONFIG_SGIX     = 91,
        GLX_BAD_HYPERPIPE_SGIX            = 92,
        GLX_HYPERPIPE_DISPLAY_PIPE_SGIX   = 0x00000001,
        GLX_HYPERPIPE_RENDER_PIPE_SGIX    = 0x00000002,
        GLX_PIPE_RECT_SGIX                = 0x00000001,
        GLX_PIPE_RECT_LIMITS_SGIX         = 0x00000002,
        GLX_HYPERPIPE_STEREO_SGIX         = 0x00000003,
        GLX_HYPERPIPE_PIXEL_AVERAGE_SGIX  = 0x00000004,
        GLX_HYPERPIPE_ID_SGIX             = 0x8030,
        GLX_PBUFFER_BIT_SGIX              = 0x00000004,
        GLX_BUFFER_CLOBBER_MASK_SGIX      = 0x08000000,
        GLX_FRONT_LEFT_BUFFER_BIT_SGIX    = 0x00000001,
        GLX_FRONT_RIGHT_BUFFER_BIT_SGIX   = 0x00000002,
        GLX_BACK_LEFT_BUFFER_BIT_SGIX     = 0x00000004,
        GLX_BACK_RIGHT_BUFFER_BIT_SGIX    = 0x00000008,
        GLX_AUX_BUFFERS_BIT_SGIX          = 0x00000010,
        GLX_DEPTH_BUFFER_BIT_SGIX         = 0x00000020,
        GLX_STENCIL_BUFFER_BIT_SGIX       = 0x00000040,
        GLX_ACCUM_BUFFER_BIT_SGIX         = 0x00000080,
        GLX_SAMPLE_BUFFERS_BIT_SGIX       = 0x00000100,
        GLX_MAX_PBUFFER_WIDTH_SGIX        = 0x8016,
        GLX_MAX_PBUFFER_HEIGHT_SGIX       = 0x8017,
        GLX_MAX_PBUFFER_PIXELS_SGIX       = 0x8018,
        GLX_OPTIMAL_PBUFFER_WIDTH_SGIX    = 0x8019,
        GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX   = 0x801A,
        GLX_PRESERVED_CONTENTS_SGIX       = 0x801B,
        GLX_LARGEST_PBUFFER_SGIX          = 0x801C,
        GLX_WIDTH_SGIX                    = 0x801D,
        GLX_HEIGHT_SGIX                   = 0x801E,
        GLX_EVENT_MASK_SGIX               = 0x801F,
        GLX_DAMAGED_SGIX                  = 0x8020,
        GLX_SAVED_SGIX                    = 0x8021,
        GLX_WINDOW_SGIX                   = 0x8022,
        GLX_PBUFFER_SGIX                  = 0x8023,
        GLX_SYNC_FRAME_SGIX               = 0x00000000,
        GLX_SYNC_SWAP_SGIX                = 0x00000001,
        GLX_VISUAL_SELECT_GROUP_SGIX      = 0x8028,
    }

    struct GLXHyperpipeNetworkSGIX {
        char    pipeName[80]; /* Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX] */
        int     networkId;
    }

    struct GLXHyperpipeConfigSGIX {
        char    pipeName[80]; /* Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX] */
        int     chann;
        uint participationType;
        int     timeSlice;
    }

    struct GLXPipeRect {
        char pipeName[80]; /* Should be [GLX_HYPERPIPE_PIPE_NAME NGTH_SGIX] */
        int srcXOrigin, srcYOrigin, srcWidth, srcHeight;
        int destXOrigin, destYOrigin, destWidth, destHeight;
    }

    struct GLXPipeRectLimits {
        char pipeNa[80]; /* Should be [GLX_HYPERPIPE_PIPE_NAME_LENGTH_SGIX] */
        int XOrigin, YOrigin, maxHeight, maxWidth;
    }
}