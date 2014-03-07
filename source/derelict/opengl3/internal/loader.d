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
module derelict.opengl3.internal.loader;

private {
    import derelict.opengl3.internal.arbload;
    import derelict.opengl3.internal.common;
    import derelict.opengl3.internal.extload;
    import derelict.opengl3.internal.globalctx;
    import derelict.opengl3.internal.types;
}

GLVersion loadContext( alias ctx)( GLVersion glversion ) {
    auto ret = loadCore!ctx( glversion );
    loadARB!ctx( glversion );

    static if( ctx.EXTEnabled ) loadEXT!ctx( glversion );
    return ret;
}

private {
    GLVersion loadCore( alias ctx )( GLVersion glversion ) {
        GLVersion glver = GLVersion.GL11;

        if( glversion >= GLVersion.GL12 ) {
            bindGLFunc( cast( void** )&ctx.glBlendColor, "glBlendColor" );
            bindGLFunc( cast( void** )&ctx.glBlendEquation, "glBlendEquation" );
            bindGLFunc( cast( void** )&ctx.glDrawRangeElements, "glDrawRangeElements" );
            bindGLFunc( cast( void** )&ctx.glTexImage3D, "glTexImage3D" );
            bindGLFunc( cast( void** )&ctx.glTexSubImage3D, "glTexSubImage3D" );
            bindGLFunc( cast( void** )&ctx.glCopyTexSubImage3D, "glCopyTexSubImage3D" );
            glver = GLVersion.GL12;
        }
        if( glversion >= GLVersion.GL13 ) {
            bindGLFunc( cast( void** )&ctx.glActiveTexture, "glActiveTexture" );
            bindGLFunc( cast( void** )&ctx.glSampleCoverage, "glSampleCoverage" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexImage3D, "glCompressedTexImage3D" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexImage2D, "glCompressedTexImage2D" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexImage1D, "glCompressedTexImage1D" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexSubImage3D, "glCompressedTexSubImage3D" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexSubImage2D, "glCompressedTexSubImage2D" );
            bindGLFunc( cast( void** )&ctx.glCompressedTexSubImage1D, "glCompressedTexSubImage1D" );
            bindGLFunc( cast( void** )&ctx.glGetCompressedTexImage, "glGetCompressedTexImage" );
            glver = GLVersion.GL13;
        }
        if( glversion >= GLVersion.GL14 ) {
            bindGLFunc( cast( void** )&ctx.glBlendFuncSeparate, "glBlendFuncSeparate" );
            bindGLFunc( cast( void** )&ctx.glMultiDrawArrays, "glMultiDrawArrays" );
            bindGLFunc( cast( void** )&ctx.glMultiDrawElements, "glMultiDrawElements" );
            bindGLFunc( cast( void** )&ctx.glPointParameterf, "glPointParameterf" );
            bindGLFunc( cast( void** )&ctx.glPointParameterfv, "glPointParameterfv" );
            bindGLFunc( cast( void** )&ctx.glPointParameteri, "glPointParameteri" );
            bindGLFunc( cast( void** )&ctx.glPointParameteriv, "glPointParameteriv" );
            glver = GLVersion.GL14;
        }
        if( glversion >= GLVersion.GL15 ) {
            bindGLFunc( cast( void** )&ctx.glGenQueries, "glGenQueries" );
            bindGLFunc( cast( void** )&ctx.glDeleteQueries, "glDeleteQueries" );
            bindGLFunc( cast( void** )&ctx.glIsQuery, "glIsQuery" );
            bindGLFunc( cast( void** )&ctx.glBeginQuery, "glBeginQuery" );
            bindGLFunc( cast( void** )&ctx.glEndQuery, "glEndQuery" );
            bindGLFunc( cast( void** )&ctx.glGetQueryiv, "glGetQueryiv" );
            bindGLFunc( cast( void** )&ctx.glGetQueryObjectiv, "glGetQueryObjectiv" );
            bindGLFunc( cast( void** )&ctx.glGetQueryObjectuiv, "glGetQueryObjectuiv" );
            bindGLFunc( cast( void** )&ctx.glBindBuffer, "glBindBuffer" );
            bindGLFunc( cast( void** )&ctx.glDeleteBuffers, "glDeleteBuffers" );
            bindGLFunc( cast( void** )&ctx.glGenBuffers, "glGenBuffers" );
            bindGLFunc( cast( void** )&ctx.glIsBuffer, "glIsBuffer" );
            bindGLFunc( cast( void** )&ctx.glBufferData, "glBufferData" );
            bindGLFunc( cast( void** )&ctx.glBufferSubData, "glBufferSubData" );
            bindGLFunc( cast( void** )&ctx.glGetBufferSubData, "glGetBufferSubData" );
            bindGLFunc( cast( void** )&ctx.glMapBuffer, "glMapBuffer" );
            bindGLFunc( cast( void** )&ctx.glUnmapBuffer, "glUnmapBuffer" );
            bindGLFunc( cast( void** )&ctx.glGetBufferParameteriv, "glGetBufferParameteriv" );
            bindGLFunc( cast( void** )&ctx.glGetBufferPointerv, "glGetBufferPointerv" );
            glver = GLVersion.GL15;
        }
        if( glversion >= GLVersion.GL20 ) {
            bindGLFunc( cast( void** )&ctx.glBlendEquationSeparate, "glBlendEquationSeparate" );
            bindGLFunc( cast( void** )&ctx.glDrawBuffers, "glDrawBuffers" );
            bindGLFunc( cast( void** )&ctx.glStencilOpSeparate, "glStencilOpSeparate" );
            bindGLFunc( cast( void** )&ctx.glStencilFuncSeparate, "glStencilFuncSeparate" );
            bindGLFunc( cast( void** )&ctx.glStencilMaskSeparate, "glStencilMaskSeparate" );
            bindGLFunc( cast( void** )&ctx.glAttachShader, "glAttachShader" );
            bindGLFunc( cast( void** )&ctx.glBindAttribLocation, "glBindAttribLocation" );
            bindGLFunc( cast( void** )&ctx.glCompileShader, "glCompileShader" );
            bindGLFunc( cast( void** )&ctx.glCreateProgram, "glCreateProgram" );
            bindGLFunc( cast( void** )&ctx.glCreateShader, "glCreateShader" );
            bindGLFunc( cast( void** )&ctx.glDeleteProgram, "glDeleteProgram" );
            bindGLFunc( cast( void** )&ctx.glDeleteShader, "glDeleteShader" );
            bindGLFunc( cast( void** )&ctx.glDetachShader, "glDetachShader" );
            bindGLFunc( cast( void** )&ctx.glDisableVertexAttribArray, "glDisableVertexAttribArray" );
            bindGLFunc( cast( void** )&ctx.glEnableVertexAttribArray, "glEnableVertexAttribArray" );
            bindGLFunc( cast( void** )&ctx.glGetActiveAttrib, "glGetActiveAttrib" );
            bindGLFunc( cast( void** )&ctx.glGetActiveUniform, "glGetActiveUniform" );
            bindGLFunc( cast( void** )&ctx.glGetAttachedShaders, "glGetAttachedShaders" );
            bindGLFunc( cast( void** )&ctx.glGetAttribLocation, "glGetAttribLocation" );
            bindGLFunc( cast( void** )&ctx.glGetProgramiv, "glGetProgramiv" );
            bindGLFunc( cast( void** )&ctx.glGetProgramInfoLog, "glGetProgramInfoLog" );
            bindGLFunc( cast( void** )&ctx.glGetShaderiv, "glGetShaderiv" );
            bindGLFunc( cast( void** )&ctx.glGetShaderInfoLog, "glGetShaderInfoLog" );
            bindGLFunc( cast( void** )&ctx.glGetShaderSource, "glGetShaderSource" );
            bindGLFunc( cast( void** )&ctx.glGetUniformLocation, "glGetUniformLocation" );
            bindGLFunc( cast( void** )&ctx.glGetUniformfv, "glGetUniformfv" );
            bindGLFunc( cast( void** )&ctx.glGetUniformiv, "glGetUniformiv" );
            bindGLFunc( cast( void** )&ctx.glGetVertexAttribdv, "glGetVertexAttribdv" );
            bindGLFunc( cast( void** )&ctx.glGetVertexAttribfv, "glGetVertexAttribfv" );
            bindGLFunc( cast( void** )&ctx.glGetVertexAttribiv, "glGetVertexAttribiv" );
            bindGLFunc( cast( void** )&ctx.glGetVertexAttribPointerv, "glGetVertexAttribPointerv" );
            bindGLFunc( cast( void** )&ctx.glIsProgram, "glIsProgram" );
            bindGLFunc( cast( void** )&ctx.glIsShader, "glIsShader" );
            bindGLFunc( cast( void** )&ctx.glLinkProgram, "glLinkProgram" );
            bindGLFunc( cast( void** )&ctx.glShaderSource, "glShaderSource" );
            bindGLFunc( cast( void** )&ctx.glUseProgram, "glUseProgram" );
            bindGLFunc( cast( void** )&ctx.glUniform1f, "glUniform1f" );
            bindGLFunc( cast( void** )&ctx.glUniform2f, "glUniform2f" );
            bindGLFunc( cast( void** )&ctx.glUniform3f, "glUniform3f" );
            bindGLFunc( cast( void** )&ctx.glUniform4f, "glUniform4f" );
            bindGLFunc( cast( void** )&ctx.glUniform1i, "glUniform1i" );
            bindGLFunc( cast( void** )&ctx.glUniform2i, "glUniform2i" );
            bindGLFunc( cast( void** )&ctx.glUniform4i, "glUniform4i" );
            bindGLFunc( cast( void** )&ctx.glUniform1fv, "glUniform1fv" );
            bindGLFunc( cast( void** )&ctx.glUniform2fv, "glUniform2fv" );
            bindGLFunc( cast( void** )&ctx.glUniform3fv, "glUniform3fv" );
            bindGLFunc( cast( void** )&ctx.glUniform4fv, "glUniform4fv" );
            bindGLFunc( cast( void** )&ctx.glUniform1iv, "glUniform1iv" );
            bindGLFunc( cast( void** )&ctx.glUniform2iv, "glUniform2iv" );
            bindGLFunc( cast( void** )&ctx.glUniform3iv, "glUniform3iv" );
            bindGLFunc( cast( void** )&ctx.glUniform4iv, "glUniform4iv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix2fv, "glUniformMatrix2fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix3fv, "glUniformMatrix3fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix4fv, "glUniformMatrix4fv" );
            bindGLFunc( cast( void** )&ctx.glValidateProgram, "glValidateProgram" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1d, "glVertexAttrib1d" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1dv, "glVertexAttrib1dv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1f, "glVertexAttrib1f" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1fv, "glVertexAttrib1fv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1s, "glVertexAttrib1s" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib1sv, "glVertexAttrib1sv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2d, "glVertexAttrib2d" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2dv, "glVertexAttrib2dv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2f, "glVertexAttrib2f" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2fv, "glVertexAttrib2fv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2s, "glVertexAttrib2s" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib2sv, "glVertexAttrib2sv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3d, "glVertexAttrib3d" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3dv, "glVertexAttrib3dv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3f, "glVertexAttrib3f" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3fv, "glVertexAttrib3fv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3s, "glVertexAttrib3s" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib3sv, "glVertexAttrib3sv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nbv, "glVertexAttrib4Nbv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Niv, "glVertexAttrib4Niv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nsv, "glVertexAttrib4Nsv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nub, "glVertexAttrib4Nub" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nubv, "glVertexAttrib4Nubv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nuiv, "glVertexAttrib4Nuiv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4Nusv, "glVertexAttrib4Nusv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4bv, "glVertexAttrib4bv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4d, "glVertexAttrib4d" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4dv, "glVertexAttrib4dv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4f, "glVertexAttrib4f" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4fv, "glVertexAttrib4fv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4iv, "glVertexAttrib4iv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4s, "glVertexAttrib4s" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4sv, "glVertexAttrib4sv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4ubv, "glVertexAttrib4ubv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4uiv, "glVertexAttrib4uiv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttrib4usv, "glVertexAttrib4usv" );
            bindGLFunc( cast( void** )&ctx.glVertexAttribPointer, "glVertexAttribPointer" );
            glver = GLVersion.GL20;
        }
        if( glversion >= GLVersion.GL21 ) {
            bindGLFunc( cast( void** )&ctx.glUniformMatrix2x3fv, "glUniformMatrix2x3fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix3x2fv, "glUniformMatrix3x2fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix2x4fv, "glUniformMatrix2x4fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix4x2fv, "glUniformMatrix4x2fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix3x4fv, "glUniformMatrix3x4fv" );
            bindGLFunc( cast( void** )&ctx.glUniformMatrix4x3fv, "glUniformMatrix4x3fv" );
            glver = GLVersion.GL21;
        }
        if( glversion >= GLVersion.GL30 ) {
                load_ARB_framebuffer_object!ctx( true );
                load_ARB_map_buffer_range!ctx( true );
                load_ARB_vertex_array_object!ctx( true );

                bindGLFunc( cast( void** )&ctx.glColorMaski, "glColorMaski" );
                bindGLFunc( cast( void** )&ctx.glGetBooleani_v, "glGetBooleani_v" );
                bindGLFunc( cast( void** )&ctx.glGetIntegeri_v, "glGetIntegeri_v" );
                bindGLFunc( cast( void** )&ctx.glEnablei, "glEnablei" );
                bindGLFunc( cast( void** )&ctx.glDisablei, "glDisablei" );
                bindGLFunc( cast( void** )&ctx.glIsEnabledi, "glIsEnabledi" );
                bindGLFunc( cast( void** )&ctx.glBeginTransformFeedback, "glBeginTransformFeedback" );
                bindGLFunc( cast( void** )&ctx.glEndTransformFeedback, "glEndTransformFeedback" );
                bindGLFunc( cast( void** )&ctx.glBindBufferRange, "glBindBufferRange" );
                bindGLFunc( cast( void** )&ctx.glBindBufferBase, "glBindBufferBase" );
                bindGLFunc( cast( void** )&ctx.glTransformFeedbackVaryings, "glTransformFeedbackVaryings" );
                bindGLFunc( cast( void** )&ctx.glGetTransformFeedbackVarying, "glGetTransformFeedbackVarying" );
                bindGLFunc( cast( void** )&ctx.glClampColor, "glClampColor" );
                bindGLFunc( cast( void** )&ctx.glBeginConditionalRender, "glBeginConditionalRender" );
                bindGLFunc( cast( void** )&ctx.glEndConditionalRender, "glEndConditionalRender" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribIPointer, "glVertexAttribIPointer" );
                bindGLFunc( cast( void** )&ctx.glGetVertexAttribIiv, "glGetVertexAttribIiv" );
                bindGLFunc( cast( void** )&ctx.glGetVertexAttribIuiv, "glGetVertexAttribIuiv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI1i, "glVertexAttribI1i" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI2i, "glVertexAttribI2i" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI3i, "glVertexAttribI3i" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4i, "glVertexAttribI4i" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI1ui, "glVertexAttribI1ui" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI2ui, "glVertexAttribI2ui" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI3ui, "glVertexAttribI3ui" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4ui, "glVertexAttribI4ui" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI1iv, "glVertexAttribI1iv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI2iv, "glVertexAttribI2iv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI3iv, "glVertexAttribI3iv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4iv, "glVertexAttribI4iv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI1uiv, "glVertexAttribI1uiv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI2uiv, "glVertexAttribI2uiv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI3uiv, "glVertexAttribI3uiv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4uiv, "glVertexAttribI4uiv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4bv, "glVertexAttribI4bv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4sv, "glVertexAttribI4sv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4ubv, "glVertexAttribI4ubv" );
                bindGLFunc( cast( void** )&ctx.glVertexAttribI4usv, "glVertexAttribI4usv" );
                bindGLFunc( cast( void** )&ctx.glGetUniformuiv, "glGetUniformuiv" );
                bindGLFunc( cast( void** )&ctx.glBindFragDataLocation, "glBindFragDataLocation" );
                bindGLFunc( cast( void** )&ctx.glGetFragDataLocation, "glGetFragDataLocation" );
                bindGLFunc( cast( void** )&ctx.glUniform1ui, "glUniform1ui" );
                bindGLFunc( cast( void** )&ctx.glUniform2ui, "glUniform2ui" );
                bindGLFunc( cast( void** )&ctx.glUniform3ui, "glUniform3ui" );
                bindGLFunc( cast( void** )&ctx.glUniform4ui, "glUniform4ui" );
                bindGLFunc( cast( void** )&ctx.glUniform1uiv, "glUniform1uiv" );
                bindGLFunc( cast( void** )&ctx.glUniform2uiv, "glUniform2uiv" );
                bindGLFunc( cast( void** )&ctx.glUniform3uiv, "glUniform3uiv" );
                bindGLFunc( cast( void** )&ctx.glUniform4uiv, "glUniform4uiv" );
                bindGLFunc( cast( void** )&ctx.glTexParameterIiv, "glTexParameterIiv" );
                bindGLFunc( cast( void** )&ctx.glTexParameterIuiv, "glTexParameterIuiv" );
                bindGLFunc( cast( void** )&ctx.glGetTexParameterIiv, "glGetTexParameterIiv" );
                bindGLFunc( cast( void** )&ctx.glGetTexParameterIuiv, "glGetTexParameterIuiv" );
                bindGLFunc( cast( void** )&ctx.glClearBufferiv, "glClearBufferiv" );
                bindGLFunc( cast( void** )&ctx.glClearBufferuiv, "glClearBufferuiv" );
                bindGLFunc( cast( void** )&ctx.glClearBufferfv, "glClearBufferfv" );
                bindGLFunc( cast( void** )&ctx.glClearBufferfi, "glClearBufferfi" );
                bindGLFunc( cast( void** )&ctx.glGetStringi, "glGetStringi" );
                glver = GLVersion.GL30;
            }
            if( glversion >= GLVersion.GL31 ) {
                load_ARB_copy_buffer!ctx( true );
                load_ARB_uniform_buffer_object!ctx( true );

                bindGLFunc( cast( void** )&ctx.glDrawArraysInstanced, "glDrawArraysInstanced" );
                bindGLFunc( cast( void** )&ctx.glDrawElementsInstanced, "glDrawElementsInstanced" );
                bindGLFunc( cast( void** )&ctx.glTexBuffer, "glTexBuffer" );
                bindGLFunc( cast( void** )&ctx.glPrimitiveRestartIndex, "glPrimitiveRestartIndex" );
                glver = GLVersion.GL31;
            }
            if( glversion >= GLVersion.GL32 ) {
                load_ARB_draw_elements_base_vertex!ctx( true );
                load_ARB_provoking_vertex!ctx( true );
                load_ARB_sync!ctx( true );
                load_ARB_texture_multisample!ctx( true );

                bindGLFunc( cast( void** )&ctx.glGetInteger64i_v, "glGetInteger64i_v" );
                bindGLFunc( cast( void** )&ctx.glGetBufferParameteri64v, "glGetBufferParameteri64v" );
                bindGLFunc( cast( void** )&ctx.glFramebufferTexture, "glFramebufferTexture" );
                glver = GLVersion.GL32;
            }
            if( glversion >= GLVersion.GL33 ) {
                load_ARB_blend_func_extended!ctx( true );
                load_ARB_sampler_objects!ctx( true );
                load_ARB_timer_query!ctx( true );
                load_ARB_vertex_type_2_10_10_10_rev!ctx( true );
                ctx.ARB_explicit_attrib_location = true;
                ctx.ARB_occlusion_query2 = true;
                ctx.ARB_shader_bit_encoding = true;
                ctx.ARB_texture_rgb10_a2ui = true;
                ctx.ARB_texture_swizzle = true;

                bindGLFunc( cast( void** )&ctx.glVertexAttribDivisor, "glVertexAttribDivisor" );
                glver = GLVersion.GL33;
            }
            if( glversion >= GLVersion.GL40 ) {
                load_ARB_draw_indirect!ctx( true );
                load_ARB_gpu_shader_fp64!ctx( true );
                load_ARB_shader_subroutine!ctx( true );
                load_ARB_tessellation_shader!ctx( true );
                load_ARB_transform_feedback2!ctx( true );
                load_ARB_transform_feedback3!ctx( true );
                ctx.ARB_texture_query_lod = true;
                ctx.ARB_gpu_shader5 = true;
                ctx.ARB_texture_buffer_object_rgb32 = true;
                ctx.ARB_texture_cube_map_array = true;
                ctx.ARB_texture_gather = true;

                bindGLFunc( cast( void** )&ctx.glMinSampleShading, "glMinSampleShading" );
                bindGLFunc( cast( void** )&ctx.glBlendEquationi, "glBlendEquationi" );
                bindGLFunc( cast( void** )&ctx.glBlendEquationSeparatei, "glBlendEquationSeparatei" );
                bindGLFunc( cast( void** )&ctx.glBlendFunci, "glBlendFunci" );
                bindGLFunc( cast( void** )&ctx.glBlendFuncSeparatei, "glBlendFuncSeparatei" );
                glver = GLVersion.GL40;
            }
            if( glversion >= GLVersion.GL41 ) {
                load_ARB_ES2_compatibility!ctx( true );
                load_ARB_get_program_binary!ctx( true );
                load_ARB_separate_shader_objects!ctx( true );
                load_ARB_vertex_attrib_64bit!ctx( true );
                load_ARB_viewport_array!ctx( true );
                ctx.ARB_shader_precision = true;
                glver = GLVersion.GL41;
            }
            if( glversion >= GLVersion.GL42 ) {
                load_ARB_base_instance!ctx( true );
                load_ARB_transform_feedback_instanced!ctx( true );
                load_ARB_internalformat_query!ctx( true );
                load_ARB_shader_atomic_counters!ctx( true );
                load_ARB_shader_image_load_store!ctx( true );
                load_ARB_texture_storage!ctx( GLVersion.GL42, true );
                ctx.ARB_shading_language_420pack = true;
                ctx.ARB_compressed_texture_pixel_storage = true;
                ctx.ARB_conservative_depth = true;
                ctx.ARB_map_buffer_alignment = true;
                ctx.ARB_shading_language_packing = true;
                glver = GLVersion.GL42;
            }
            if( glversion >= GLVersion.GL43 ) {
                load_ARB_clear_buffer_object!ctx( true );
                load_ARB_compute_shader!ctx( true );
                load_KHR_debug!ctx( true );
                load_ARB_framebuffer_no_attachments!ctx( GLVersion.GL43, true );
                load_ARB_internalformat_query2!ctx( true );
                load_ARB_invalidate_subdata!ctx( true );
                load_ARB_multi_draw_indirect!ctx( true );
                load_ARB_program_interface_query!ctx( true );
                load_ARB_shader_storage_buffer_object!ctx( true );
                load_ARB_texture_buffer_range!ctx( GLVersion.GL43, true );
                load_ARB_texture_storage_multisample!ctx( GLVersion.GL43, true );
                load_ARB_texture_view!ctx( true );
                load_ARB_vertex_attrib_binding!ctx( GLVersion.GL43, true );
                ctx.ARB_array_of_arrays = true;
                ctx.ARB_fragment_layer_viewport = true;
                ctx.ARB_shader_image_size = true;
                ctx.ARB_ES3_compatibility = true;
                ctx.ARB_copy_image = true;
                ctx.ARB_explicit_uniform_location = true;
                ctx.ARB_robust_buffer_access_behavior = true;
                ctx.ARB_stencil_texturing = true;
                ctx.ARB_texture_query_levels = true;
                glver = GLVersion.GL43;
            }
        return glver;
    }

    void loadARB( alias ctx )( GLVersion glversion ) {
        if( glversion < GLVersion.GL30 ) {
            if( isExtSupported( glversion, "GL_ARB_framebuffer_object" )) load_ARB_framebuffer_object!ctx();
            if( isExtSupported( glversion, "GL_ARB_map_buffer_range" )) load_ARB_map_buffer_range!ctx();
            if( isExtSupported( glversion, "GL_ARB_vertex_array_object" )) load_ARB_vertex_array_object!ctx();
        }
        if( glversion < GLVersion.GL31 ) {
            if( isExtSupported( glversion, "GL_ARB_copy_buffer" )) load_ARB_copy_buffer!ctx();
            if( isExtSupported( glversion, "GL_ARB_uniform_buffer_object" )) load_ARB_uniform_buffer_object!ctx();
        }
        if( glversion < GLVersion.GL32 ) {
            if( isExtSupported( glversion, "GL_ARB_draw_elements_base_vertex" )) load_ARB_draw_elements_base_vertex!ctx();
            if( isExtSupported( glversion, "GL_ARB_provoking_vertex" )) load_ARB_provoking_vertex!ctx();
            if( isExtSupported( glversion, "GL_ARB_sync" )) load_ARB_sync!ctx();
            if( isExtSupported( glversion, "GL_ARB_texture_multisample" )) load_ARB_texture_multisample!ctx();
        }
        if( glversion < GLVersion.GL33 ) {
            if( isExtSupported( glversion, "GL_ARB_blend_func_extended" )) load_ARB_blend_func_extended!ctx();
            if( isExtSupported( glversion, "GL_ARB_sampler_objects" )) load_ARB_sampler_objects!ctx();
            if( isExtSupported( glversion, "GL_ARB_timer_query" )) load_ARB_timer_query!ctx();
            if( isExtSupported( glversion, "GL_ARB_vertex_type_2_10_10_10_rev" )) load_ARB_vertex_type_2_10_10_10_rev!ctx();
            ctx.ARB_explicit_attrib_location = isExtSupported( glversion, "GL_ARB_explicit_attrib_location" );
            ctx.ARB_occlusion_query2 = isExtSupported( glversion, "GL_ARB_occlusion_query2" );
            ctx.ARB_shader_bit_encoding = isExtSupported( glversion, "GL_ARB_shader_bit_encoding" );
            ctx.ARB_texture_rgb10_a2ui = isExtSupported( glversion, "GL_ARB_texture_rgb10_a2ui" );
            ctx.ARB_texture_swizzle = isExtSupported( glversion, "GL_ARB_texture_swizzle" );
        }
        if( glversion < GLVersion.GL40 ) {
            if( isExtSupported( glversion, "GL_ARB_draw_indirect" )) load_ARB_draw_indirect!ctx();
            if( isExtSupported( glversion, "GL_ARB_gpu_shader_fp64" )) load_ARB_gpu_shader_fp64!ctx();
            if( isExtSupported( glversion, "GL_ARB_shader_subroutine" )) load_ARB_shader_subroutine!ctx();
            if( isExtSupported( glversion, "GL_ARB_tessellation_shader" )) load_ARB_tessellation_shader!ctx();
            if( isExtSupported( glversion, "GL_ARB_transform_feedback2" )) load_ARB_transform_feedback2!ctx();
            if( isExtSupported( glversion, "GL_ARB_transform_feedback3" )) load_ARB_transform_feedback3!ctx();
            ctx.ARB_texture_query_lod = isExtSupported( glversion, "GL_ARB_texture_query_lod" );
            ctx.ARB_gpu_shader5 = isExtSupported( glversion, "GL_ARB_gpu_shader5" );
            ctx.ARB_texture_buffer_object_rgb32 = isExtSupported( glversion, "GL_ARB_texture_buffer_object_rgb32" );
            ctx.ARB_texture_cube_map_array = isExtSupported( glversion, "GL_ARB_texture_cube_map_array" );
            ctx.ARB_texture_gather = isExtSupported( glversion, "GL_ARB_texture_gather" );
        }
        if( glversion < GLVersion.GL41 ) {
            if( isExtSupported( glversion, "GL_ARB_ES2_compatibility" )) load_ARB_ES2_compatibility!ctx();
            if( isExtSupported( glversion, "GL_ARB_get_program_binary" )) load_ARB_get_program_binary!ctx();
            if( isExtSupported( glversion, "GL_ARB_separate_shader_objects" )) load_ARB_separate_shader_objects!ctx();
            if( isExtSupported( glversion, "GL_ARB_vertex_attrib_64bit" )) load_ARB_vertex_attrib_64bit!ctx();
            if( isExtSupported( glversion, "GL_ARB_viewport_array" )) load_ARB_viewport_array!ctx();
            ctx.ARB_shader_precision = isExtSupported( glversion, "GL_ARB_shader_precision" );
        }
        if( glversion < GLVersion.GL42 ) {
            if( isExtSupported( glversion, "GL_ARB_base_instance" )) load_ARB_base_instance!ctx();
            if( isExtSupported( glversion, "GL_ARB_transform_feedback_instanced" )) load_ARB_transform_feedback_instanced!ctx();
            if( isExtSupported( glversion, "GL_ARB_internalformat_query" )) load_ARB_internalformat_query!ctx();
            if( isExtSupported( glversion, "GL_ARB_shader_atomic_counters" )) load_ARB_shader_atomic_counters!ctx();
            if( isExtSupported( glversion, "GL_ARB_shader_image_load_store" )) load_ARB_shader_image_load_store!ctx();
            if( isExtSupported( glversion, "GL_ARB_texture_storage" )) load_ARB_texture_storage!ctx( glversion );
            ctx.ARB_shading_language_420pack = isExtSupported( glversion, "GL_ARB_shading_language_420pack" );
            ctx.ARB_compressed_texture_pixel_storage = isExtSupported( glversion, "GL_ARB_compressed_texture_pixel_storage" );
            ctx.ARB_conservative_depth = isExtSupported( glversion, "GL_ARB_conservative_depth" );
            ctx.ARB_map_buffer_alignment = isExtSupported( glversion, "GL_ARB_map_buffer_alignment" );
            ctx.ARB_shading_language_packing = isExtSupported( glversion, "GL_ARB_shading_language_packing" );
        }
        if( glversion < GLVersion.GL43 ) {
            if( isExtSupported( glversion, "GL_ARB_clear_ buffer_object" )) load_ARB_clear_buffer_object!ctx();
            if( isExtSupported( glversion, "GL_ARB_compute_shader" )) load_ARB_compute_shader!ctx();
            if( isExtSupported( glversion, "GL_KHR_debug" )) load_KHR_debug!ctx();
            if( isExtSupported( glversion, "GL_ARB_framebuffer_no_attachments" )) load_ARB_framebuffer_no_attachments!ctx( glversion );
            if( isExtSupported( glversion, "GL_ARB_internalformat_query2" )) load_ARB_internalformat_query2!ctx();
            if( isExtSupported( glversion,"GL_ARB_invalidate_subdata" )) load_ARB_invalidate_subdata!ctx();
            if( isExtSupported( glversion,"GL_ARB_multi_draw_indirect" )) load_ARB_multi_draw_indirect!ctx();
            if( isExtSupported( glversion, "GL_ARB_program_interface_query" )) load_ARB_program_interface_query!ctx();
            if( isExtSupported( glversion, "GL_ARB_shader_storage_buffer_object" )) load_ARB_shader_storage_buffer_object!ctx();
            if( isExtSupported( glversion, "GL_ARB_texture_buffer_range" )) load_ARB_texture_buffer_range!ctx( glversion );
            if( isExtSupported( glversion, "GL_ARB_texture_storage_multisample" )) load_ARB_texture_storage_multisample!ctx( glversion );
            if( isExtSupported( glversion,"GL_ARB_texture_view" )) load_ARB_texture_view!ctx();
            if( isExtSupported( glversion, "GL_ARB_vertex_attrib_binding" )) load_ARB_vertex_attrib_binding!ctx( glversion );
            ctx.ARB_array_of_arrays = isExtSupported( glversion, "GL_ARB_array_of_arrays" );
            ctx.ARB_fragment_layer_viewport = isExtSupported( glversion, "GL_ARB_fragment_layer_viewport" );
            ctx.ARB_shader_image_size = isExtSupported( glversion, "GL_ARB_shader_image_size" );
            ctx.ARB_ES3_compatibility = isExtSupported( glversion, "GL_ARB_ES3_compatibility" );
            ctx.ARB_copy_image = isExtSupported( glversion, "GL_ARB_copy_image" );
            ctx.ARB_explicit_uniform_location = isExtSupported( glversion, "GL_ARB_explicit_uniform_location" );
            ctx.ARB_robust_buffer_access_behavior = isExtSupported( glversion, "GL_ARB_robust_buffer_access_behavior" );
            ctx.ARB_stencil_texturing = isExtSupported( glversion, "GL_ARB_stencil_texturing" );
            ctx.ARB_texture_query_levels = isExtSupported( glversion, "GL_ARB_texture_query_levels" );
        }

        if( isExtSupported( glversion, "GL_ARB_draw_buffers_blend" )) load_ARB_draw_buffers_blend!ctx();
        if( isExtSupported( glversion, "GL_ARB_sample_shading" )) load_ARB_sample_shading!ctx();
        if( isExtSupported( glversion, "GL_ARB_shading_language_include" )) load_ARB_shading_language_include!ctx();
        if( isExtSupported( glversion, "GL_ARB_cl_event" )) load_ARB_cl_event!ctx();
        if( isExtSupported( glversion, "GL_ARB_debug_output" )) load_ARB_debug_output!ctx();
        if( isExtSupported( glversion, "GL_ARB_robustness" )) load_ARB_robustness!ctx();

        ctx.ARB_depth_buffer_float = isExtSupported( glversion, "GL_ARB_depth_buffer_float" );
        ctx.ARB_framebuffer_sRGB = isExtSupported( glversion, "GL_ARB_framebuffer_sRGB");
        ctx.ARB_half_float_vertex = isExtSupported( glversion, "GL_ARB_half_float_vertex" );
        ctx.ARB_texture_compression_rgtc = isExtSupported( glversion, "ARB_texture_compression_rgtc" );
        ctx.ARB_texture_rg = isExtSupported( glversion, "GL_ARB_texture_rg" );
        ctx.ARB_depth_clamp = isExtSupported( glversion, "GL_ARB_depth_clamp" );
        ctx.ARB_fragment_coord_conventions = isExtSupported( glversion, "GL_ARB_fragment_coord_conventions" );
        ctx.ARB_seamless_cube_map = isExtSupported( glversion, "GL_ARB_seamless_cube_map");
        ctx.ARB_vertex_array_bgra = isExtSupported( glversion, "GL_ARB_vertex_array_bgra" );
        ctx.ARB_texture_compression_bptc = isExtSupported( glversion, "GL_ARB_texture_compression_bptc" );
        ctx.ARB_shader_stencil_export = isExtSupported( glversion, "GL_ARB_shader_stencil_export" );
    }

    void loadEXT( alias ctx )( GLVersion glversion ) {
        if( isExtSupported( glversion, "GL_EXT_framebuffer_object" )) load_EXT_framebuffer_object!ctx();

        ctx.EXT_texture_filter_anisotropic = isExtSupported( glversion, "EXT_texture_filter_anisotropic" );
    }
}