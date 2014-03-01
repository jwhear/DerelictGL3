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
module derelict.opengl3.ext;

private {
    import derelict.opengl3.types;
    import derelict.opengl3.constants;
    import derelict.opengl3.internal;
}

enum : uint {
    // GL_EXT_texture_filter_anisotropic
    GL_TEXTURE_MAX_ANISOTROPY_EXT       = 0x84FE,
    GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT   = 0x84FF,

    // GL_EXT_framebuffer_object
    GL_INVALID_FRAMEBUFFER_OPERATION_EXT = 0x0506,
    GL_MAX_RENDERBUFFER_SIZE_EXT        = 0x84E8,
    GL_FRAMEBUFFER_BINDING_EXT          = 0x8CA6,
    GL_RENDERBUFFER_BINDING_EXT         = 0x8CA7,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE_EXT = 0x8CD0,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME_EXT = 0x8CD1,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL_EXT = 0x8CD2,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE_EXT = 0x8CD3,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_3D_ZOFFSET_EXT = 0x8CD4,
    GL_FRAMEBUFFER_COMPLETE_EXT         = 0x8CD5,
    GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT_EXT = 0x8CD6,
    GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT_EXT = 0x8CD7,
    GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS_EXT = 0x8CD9,
    GL_FRAMEBUFFER_INCOMPLETE_FORMATS_EXT = 0x8CDA,
    GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER_EXT = 0x8CDB,
    GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER_EXT = 0x8CDC,
    GL_FRAMEBUFFER_UNSUPPORTED_EXT      = 0x8CDD,
    GL_MAX_COLOR_ATTACHMENTS_EXT        = 0x8CDF,
    GL_COLOR_ATTACHMENT0_EXT            = 0x8CE0,
    GL_COLOR_ATTACHMENT1_EXT            = 0x8CE1,
    GL_COLOR_ATTACHMENT2_EXT            = 0x8CE2,
    GL_COLOR_ATTACHMENT3_EXT            = 0x8CE3,
    GL_COLOR_ATTACHMENT4_EXT            = 0x8CE4,
    GL_COLOR_ATTACHMENT5_EXT            = 0x8CE5,
    GL_COLOR_ATTACHMENT6_EXT            = 0x8CE6,
    GL_COLOR_ATTACHMENT7_EXT            = 0x8CE7,
    GL_COLOR_ATTACHMENT8_EXT            = 0x8CE8,
    GL_COLOR_ATTACHMENT9_EXT            = 0x8CE9,
    GL_COLOR_ATTACHMENT10_EXT           = 0x8CEA,
    GL_COLOR_ATTACHMENT11_EXT           = 0x8CEB,
    GL_COLOR_ATTACHMENT12_EXT           = 0x8CEC,
    GL_COLOR_ATTACHMENT13_EXT           = 0x8CED,
    GL_COLOR_ATTACHMENT14_EXT           = 0x8CEE,
    GL_COLOR_ATTACHMENT15_EXT           = 0x8CEF,
    GL_DEPTH_ATTACHMENT_EXT             = 0x8D00,
    GL_STENCIL_ATTACHMENT_EXT           = 0x8D20,
    GL_FRAMEBUFFER_EXT                  = 0x8D40,
    GL_RENDERBUFFER_EXT                 = 0x8D41,
    GL_RENDERBUFFER_WIDTH_EXT           = 0x8D42,
    GL_RENDERBUFFER_HEIGHT_EXT          = 0x8D43,
    GL_RENDERBUFFER_INTERNAL_FORMAT_EXT = 0x8D44,
    GL_STENCIL_INDEX1_EXT               = 0x8D46,
    GL_STENCIL_INDEX4_EXT               = 0x8D47,
    GL_STENCIL_INDEX8_EXT               = 0x8D48,
    GL_STENCIL_INDEX16_EXT              = 0x8D49,
    GL_RENDERBUFFER_RED_SIZE_EXT        = 0x8D50,
    GL_RENDERBUFFER_GREEN_SIZE_EXT      = 0x8D51,
    GL_RENDERBUFFER_BLUE_SIZE_EXT       = 0x8D52,
    GL_RENDERBUFFER_ALPHA_SIZE_EXT      = 0x8D53,
    GL_RENDERBUFFER_DEPTH_SIZE_EXT      = 0x8D54,
    GL_RENDERBUFFER_STENCIL_SIZE_EXT    = 0x8D55,
}

// GL_EXT_texture_filter_anisotropic
private __gshared bool _EXT_texture_filter_anisotropic;
bool EXT_texture_filter_anisotropic() @property { return _EXT_texture_filter_anisotropic; }

// GL_EXT_framebuffer_object
extern(  System  ) nothrow {
    alias da_glIsRenderbufferEXT = GLboolean function( GLuint );
    alias da_glBindRenderbufferEXT = void function( GLenum, GLuint );
    alias da_glDeleteRenderbuffersEXT = void function( GLsizei, in GLuint* );
    alias da_glGenRenderbuffersEXT = void function( GLsizei, GLuint* );
    alias da_glRenderbufferStorageEXT = void function( GLenum, GLenum, GLsizei, GLsizei );
    alias da_glGetRenderbufferParameterivEXT = void function( GLenum, GLenum, GLint* );
    alias da_glIsFramebufferEXT = GLboolean function( GLuint );
    alias da_glBindFramebufferEXT = void function( GLenum, GLuint );
    alias da_glDeleteFramebuffersEXT = void function( GLsizei, in GLuint* );
    alias da_glGenFramebuffersEXT = void function( GLsizei, GLuint* );
    alias da_glCheckFramebufferStatusEXT = GLenum function( GLenum );
    alias da_glFramebufferTexture1DEXT = void function( GLenum, GLenum, GLenum, GLuint, GLint );
    alias da_glFramebufferTexture2DEXT = void function( GLenum, GLenum, GLenum, GLuint, GLint );
    alias da_glFramebufferTexture3DEXT = void function( GLenum, GLenum, GLenum, GLuint, GLint, GLint );
    alias da_glFramebufferRenderbufferEXT = void function( GLenum, GLenum, GLenum, GLuint );
    alias da_glGetFramebufferAttachmentParameterivEXT = void function( GLenum, GLenum, GLenum, GLint* );
    alias da_glGenerateMipmapEXT = void function( GLenum );
}

__gshared {
    da_glIsRenderbufferEXT glIsRenderbufferEXT;
    da_glBindRenderbufferEXT glBindRenderbufferEXT;
    da_glDeleteRenderbuffersEXT glDeleteRenderbuffersEXT;
    da_glGenRenderbuffersEXT glGenRenderbuffersEXT;
    da_glRenderbufferStorageEXT glRenderbufferStorageEXT;
    da_glGetRenderbufferParameterivEXT glGetRenderbufferParameterivEXT;
    da_glIsFramebufferEXT glIsFramebufferEXT;
    da_glBindFramebufferEXT glBindFramebufferEXT;
    da_glDeleteFramebuffersEXT glDeleteFramebuffersEXT;
    da_glGenFramebuffersEXT glGenFramebuffersEXT;
    da_glCheckFramebufferStatusEXT glCheckFramebufferStatusEXT;
    da_glFramebufferTexture1DEXT glFramebufferTexture1DEXT;
    da_glFramebufferTexture2DEXT glFramebufferTexture2DEXT;
    da_glFramebufferTexture3DEXT glFramebufferTexture3DEXT;
    da_glFramebufferRenderbufferEXT glFramebufferRenderbufferEXT;
    da_glGetFramebufferAttachmentParameterivEXT glGetFramebufferAttachmentParameterivEXT;
    da_glGenerateMipmapEXT glGenerateMipmapEXT;
}

private __gshared bool _EXT_framebuffer_object;
bool EXT_framebuffer_object() @property { return _EXT_framebuffer_object; }
private void load_EXT_framebuffer_object() {
    try {
        bindGLFunc( cast( void** )&glIsRenderbufferEXT, "glIsRenderbufferEXT" );
        bindGLFunc( cast( void** )&glBindRenderbufferEXT, "glBindRenderbufferEXT" );
        bindGLFunc( cast( void** )&glDeleteRenderbuffersEXT, "glDeleteRenderbuffersEXT" );
        bindGLFunc( cast( void** )&glGenRenderbuffersEXT, "glGenRenderbuffersEXT" );
        bindGLFunc( cast( void** )&glRenderbufferStorageEXT, "glRenderbufferStorageEXT" );
        bindGLFunc( cast( void** )&glGetRenderbufferParameterivEXT, "glGetRenderbufferParameterivEXT" );
        bindGLFunc( cast( void** )&glIsFramebufferEXT, "glIsFramebufferEXT" );
        bindGLFunc( cast( void** )&glBindFramebufferEXT, "glBindFramebufferEXT" );
        bindGLFunc( cast( void** )&glDeleteFramebuffersEXT, "glDeleteFramebuffersEXT" );
        bindGLFunc( cast( void** )&glGenFramebuffersEXT, "glGenFramebuffersEXT" );
        bindGLFunc( cast( void** )&glCheckFramebufferStatusEXT, "glCheckFramebufferStatusEXT" );
        bindGLFunc( cast( void** )&glFramebufferTexture1DEXT, "glFramebufferTexture1DEXT" );
        bindGLFunc( cast( void** )&glFramebufferTexture2DEXT, "glFramebufferTexture2DEXT" );
        bindGLFunc( cast( void** )&glFramebufferTexture3DEXT, "glFramebufferTexture3DEXT" );
        bindGLFunc( cast( void** )&glFramebufferRenderbufferEXT, "glFramebufferRenderbufferEXT" );
        bindGLFunc( cast( void** )&glGetFramebufferAttachmentParameterivEXT, "glGetFramebufferAttachmentParameterivEXT" );
        bindGLFunc( cast( void** )&glGenerateMipmapEXT, "glGenerateMipmapEXT" );
        _EXT_framebuffer_object = true;
    } catch( Exception e ) {
        _EXT_framebuffer_object = false;
    }
}

package void loadEXT(alias container)( GLVersion glversion ) {
    _EXT_texture_filter_anisotropic = isExtSupported!container( glversion, "GL_EXT_texture_filter_anisotropic" );
    _EXT_framebuffer_object = isExtSupported!container( glversion, "GL_EXT_framebuffer_object" );
    if( _EXT_framebuffer_object ) load_EXT_framebuffer_object();
}