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
module derelict.opengl3.internal.wglplatform;

version( Windows ) {
    private {
        import derelict.opengl3.internal.types;
        import derelict.opengl3.internal.common;
    }


    private bool isWGLExtSupported( alias ctx )( string name ) {
        return findEXT( ctx.wglGetExtensionsStringARB(ctx.wglGetCurrentDC()), name );
    }


    void* loadGLFunc( alias ctx )( string symName ) {
        import std.string;
        return cast( void* )ctx.wglGetProcAddress( symName.toStringz() );
    }

    bool hasValidContext( alias ctx )() {
        if( ctx.wglGetCurrentContext && ctx.wglGetCurrentContext() )
            return true;
        return false;
    }

    void loadPlatformGL( alias ctx )( void delegate( void**, string, bool doThrow ) bindFunc ) {
        bindFunc( cast( void** )&ctx.wglCopyContext, "wglCopyContext", true );
        bindFunc( cast( void** )&ctx.wglCreateContext, "wglCreateContext", true );
        bindFunc( cast( void** )&ctx.wglCreateLayerContext, "wglCreateLayerContext", true );
        bindFunc( cast( void** )&ctx.wglDeleteContext, "wglDeleteContext", true );
        bindFunc( cast( void** )&ctx.wglDescribeLayerPlane, "wglDescribeLayerPlane", true );
        bindFunc( cast( void** )&ctx.wglGetCurrentContext, "wglGetCurrentContext", true );
        bindFunc( cast( void** )&ctx.wglGetCurrentDC, "wglGetCurrentDC", true );
        bindFunc( cast( void** )&ctx.wglGetLayerPaletteEntries, "wglGetLayerPaletteEntries", true );
        bindFunc( cast( void** )&ctx.wglGetProcAddress, "wglGetProcAddress", true );
        bindFunc( cast( void** )&ctx.wglMakeCurrent, "wglMakeCurrent", true );
        bindFunc( cast( void** )&ctx.wglRealizeLayerPalette, "wglRealizeLayerPalette", true );
        bindFunc( cast( void** )&ctx.wglSetLayerPaletteEntries, "wglSetLayerPaletteEntries", true );
        bindFunc( cast( void** )&ctx.wglShareLists, "wglShareLists", true );
        bindFunc( cast( void** )&ctx.wglSwapLayerBuffers, "wglSwapLayerBuffers", true );
        bindFunc( cast( void** )&ctx.wglUseFontBitmaps, "wglUseFontBitmapsW", true );
        bindFunc( cast( void** )&ctx.wglUseFontOutlines, "wglUseFontOutlinesW", true );
    }

    void loadPlatformEXT( alias ctx )( GLVersion glver ) {
        import derelict.opengl3.internal.wglfunctions;

        // This needs to be loaded first. If it fails to load, just abort.
        ctx.wglGetExtensionsStringARB = cast( da_wglGetExtensionsStringARB ) loadGLFunc!( ctx )( "wglGetExtensionsStringARB" );
        if( !ctx.wglGetExtensionsStringARB ) return;

        if( isWGLExtSupported!ctx( "WGL_ARB_buffer_region" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglCreateBufferRegionARB, "wglCreateBufferRegionARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglDeleteBufferRegionARB, "wglDeleteBufferRegionARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglSaveBufferRegionARB, "wglSaveBufferRegionARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglRestoreBufferRegionARB, "wglRestoreBufferRegionARB" );
                ctx.WGL_ARB_buffer_region = true;
            } catch( Exception e ) { ctx.WGL_ARB_buffer_region = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_ARB_create_context" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglCreateContextAttribsARB, "wglCreateContextAttribsARB" );
                ctx.WGL_ARB_create_context = true;
            } catch( Exception e ) { ctx.WGL_ARB_create_context = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_ARB_make_current_read" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglMakeContextCurrentARB, "wglMakeContextCurrentARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglGetCurrentReadDCARB, "wglGetCurrentReadDCARB" );
                ctx.WGL_ARB_make_current_read = true;
            } catch( Exception e ) { ctx.WGL_ARB_make_current_read = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_ARB_pbuffer" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglCreatePbufferARB, "wglCreatePbufferARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglGetPbufferDCARB, "wglGetPbufferDCARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglReleasePbufferDCARB, "wglReleasePbufferDCARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglDestroyPbufferARB, "wglDestroyPbufferARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglQueryPbufferARB, "wglQueryPbufferARB" );
                ctx.WGL_ARB_pbuffer = true;
            } catch( Exception e ) { ctx.WGL_ARB_pbuffer = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_ARB_pixel_format" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglGetPixelFormatAttribivARB, "wglGetPixelFormatAttribivARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglGetPixelFormatAttribfvARB, "wglGetPixelFormatAttribfvARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglChoosePixelFormatARB, "wglChoosePixelFormatARB" );
                ctx.WGL_ARB_pixel_format = true;
            } catch( Exception e ) { ctx.WGL_ARB_pixel_format = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_ARB_render_texture" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglBindTexImageARB, "wglBindTexImageARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglReleaseTexImageARB, "wglReleaseTexImageARB" );
                bindGLFunc!ctx( cast(void**)&ctx.wglSetPbufferAttribARB, "wglSetPbufferAttribARB" );
                ctx.WGL_ARB_render_texture = true;
            } catch( Exception e ) { ctx.WGL_ARB_render_texture = false; }
        }
        if( isWGLExtSupported!ctx( "WGL_EXT_swap_control" )) {
            try {
                bindGLFunc!ctx( cast(void**)&ctx.wglSwapIntervalEXT, "wglSwapIntervalEXT" );
                bindGLFunc!ctx( cast(void**)&ctx.wglGetSwapIntervalEXT, "wglGetSwapIntervalEXT" );
                ctx.WGL_EXT_swap_control = true;
            } catch( Exception e ) { ctx.WGL_EXT_swap_control = false; }
        }

        ctx.WGL_ARB_create_context_profile = isWGLExtSupported!ctx( "WGL_ARB_create_context_profile" );
        ctx.WGL_ARB_create_context_robustness = isWGLExtSupported!ctx( "WGL_ARB_create_context_robustness" );
        ctx.WGL_ARB_framebuffer_sRGB = isWGLExtSupported!ctx( "WGL_ARB_framebuffer_sRGB" );
        ctx.WGL_ARB_multisample = isWGLExtSupported!ctx( "WGL_ARB_multisample" );
        ctx.WGL_ARB_pixel_format_float = isWGLExtSupported!ctx( "WGL_ARB_pixel_format_float" );
        ctx.WGL_ARB_robustness_application_isolation = isWGLExtSupported!ctx( "WGL_ARB_robustness_application_isolation" );
        ctx.WGL_ARB_robustness_share_group_isolation = isWGLExtSupported!ctx( "WGL_ARB_robustness_share_group_isolation" );
    }
}