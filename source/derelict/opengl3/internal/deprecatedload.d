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
module derelict.opengl3.internal.deprecatedload;

private {
    import derelict.opengl3.internal.common;
}

void loadBase( alias ctx )( void delegate( void**, string, bool doThrow = true) bindFunc ) {
    bindFunc( cast( void** )&ctx.glIsList, "glIsList" );
    bindFunc( cast( void** )&ctx.glDeleteLists, "glDeleteLists" );
    bindFunc( cast( void** )&ctx.glGenLists, "glGenLists" );
    bindFunc( cast( void** )&ctx.glNewList, "glNewList" );
    bindFunc( cast( void** )&ctx.glEndList, "glEndList" );
    bindFunc( cast( void** )&ctx.glCallList, "glCallList" );
    bindFunc( cast( void** )&ctx.glCallLists, "glCallLists" );
    bindFunc( cast( void** )&ctx.glListBase, "glListBase" );
    bindFunc( cast( void** )&ctx.glBegin, "glBegin" );
    bindFunc( cast( void** )&ctx.glEnd, "glEnd" );
    bindFunc( cast( void** )&ctx.glVertex2d, "glVertex2d" );
    bindFunc( cast( void** )&ctx.glVertex2f, "glVertex2f" );
    bindFunc( cast( void** )&ctx.glVertex2i, "glVertex2i" );
    bindFunc( cast( void** )&ctx.glVertex2s, "glVertex2s" );
    bindFunc( cast( void** )&ctx.glVertex3d, "glVertex3d" );
    bindFunc( cast( void** )&ctx.glVertex3f, "glVertex3f" );
    bindFunc( cast( void** )&ctx.glVertex3i, "glVertex3i" );
    bindFunc( cast( void** )&ctx.glVertex3s, "glVertex3s" );
    bindFunc( cast( void** )&ctx.glVertex4d, "glVertex4d" );
    bindFunc( cast( void** )&ctx.glVertex4f, "glVertex4f" );
    bindFunc( cast( void** )&ctx.glVertex4i, "glVertex4i" );
    bindFunc( cast( void** )&ctx.glVertex4s, "glVertex4s" );
    bindFunc( cast( void** )&ctx.glVertex2dv, "glVertex2dv" );
    bindFunc( cast( void** )&ctx.glVertex2fv, "glVertex2fv" );
    bindFunc( cast( void** )&ctx.glVertex2iv, "glVertex2iv" );
    bindFunc( cast( void** )&ctx.glVertex2sv, "glVertex2sv" );
    bindFunc( cast( void** )&ctx.glVertex3dv, "glVertex3dv" );
    bindFunc( cast( void** )&ctx.glVertex3fv, "glVertex3fv" );
    bindFunc( cast( void** )&ctx.glVertex3iv, "glVertex3iv" );
    bindFunc( cast( void** )&ctx.glVertex3sv, "glVertex3sv" );
    bindFunc( cast( void** )&ctx.glVertex4dv, "glVertex4dv" );
    bindFunc( cast( void** )&ctx.glVertex4fv, "glVertex4fv" );
    bindFunc( cast( void** )&ctx.glVertex4iv, "glVertex4iv" );
    bindFunc( cast( void** )&ctx.glVertex4sv, "glVertex4sv" );
    bindFunc( cast( void** )&ctx.glNormal3b, "glNormal3b" );
    bindFunc( cast( void** )&ctx.glNormal3d, "glNormal3d" );
    bindFunc( cast( void** )&ctx.glNormal3f, "glNormal3f" );
    bindFunc( cast( void** )&ctx.glNormal3i, "glNormal3i" );
    bindFunc( cast( void** )&ctx.glNormal3s, "glNormal3s" );
    bindFunc( cast( void** )&ctx.glNormal3bv, "glNormal3bv" );
    bindFunc( cast( void** )&ctx.glNormal3dv, "glNormal3dv" );
    bindFunc( cast( void** )&ctx.glNormal3fv, "glNormal3fv" );
    bindFunc( cast( void** )&ctx.glNormal3iv, "glNormal3iv" );
    bindFunc( cast( void** )&ctx.glNormal3sv, "glNormal3sv" );
    bindFunc( cast( void** )&ctx.glIndexd, "glIndexd" );
    bindFunc( cast( void** )&ctx.glIndexf, "glIndexf" );
    bindFunc( cast( void** )&ctx.glIndexi, "glIndexi" );
    bindFunc( cast( void** )&ctx.glIndexs, "glIndexs" );
    bindFunc( cast( void** )&ctx.glIndexub, "glIndexub" );
    bindFunc( cast( void** )&ctx.glIndexdv, "glIndexdv" );
    bindFunc( cast( void** )&ctx.glIndexfv, "glIndexfv" );
    bindFunc( cast( void** )&ctx.glIndexiv, "glIndexiv" );
    bindFunc( cast( void** )&ctx.glIndexsv, "glIndexsv" );
    bindFunc( cast( void** )&ctx.glIndexubv, "glIndexubv" );
    bindFunc( cast( void** )&ctx.glColor3b, "glColor3b" );
    bindFunc( cast( void** )&ctx.glColor3d, "glColor3d" );
    bindFunc( cast( void** )&ctx.glColor3f, "glColor3f" );
    bindFunc( cast( void** )&ctx.glColor3i, "glColor3i" );
    bindFunc( cast( void** )&ctx.glColor3s, "glColor3s" );
    bindFunc( cast( void** )&ctx.glColor3ub, "glColor3ub" );
    bindFunc( cast( void** )&ctx.glColor3ui, "glColor3ui" );
    bindFunc( cast( void** )&ctx.glColor3us, "glColor3us" );
    bindFunc( cast( void** )&ctx.glColor4b, "glColor4b" );
    bindFunc( cast( void** )&ctx.glColor4d, "glColor4d" );
    bindFunc( cast( void** )&ctx.glColor4f, "glColor4f" );
    bindFunc( cast( void** )&ctx.glColor4i, "glColor4i" );
    bindFunc( cast( void** )&ctx.glColor4s, "glColor4s" );
    bindFunc( cast( void** )&ctx.glColor4ub, "glColor4ub" );
    bindFunc( cast( void** )&ctx.glColor4ui, "glColor4ui" );
    bindFunc( cast( void** )&ctx.glColor4us, "glColor4us" );
    bindFunc( cast( void** )&ctx.glColor3bv, "glColor3bv" );
    bindFunc( cast( void** )&ctx.glColor3dv, "glColor3dv" );
    bindFunc( cast( void** )&ctx.glColor3fv, "glColor3fv" );
    bindFunc( cast( void** )&ctx.glColor3iv, "glColor3iv" );
    bindFunc( cast( void** )&ctx.glColor3sv, "glColor3sv" );
    bindFunc( cast( void** )&ctx.glColor3ubv, "glColor3ubv" );
    bindFunc( cast( void** )&ctx.glColor3uiv, "glColor3uiv" );
    bindFunc( cast( void** )&ctx.glColor3usv, "glColor3usv" );
    bindFunc( cast( void** )&ctx.glColor4bv, "glColor4bv" );
    bindFunc( cast( void** )&ctx.glColor4dv, "glColor4dv" );
    bindFunc( cast( void** )&ctx.glColor4fv, "glColor4fv" );
    bindFunc( cast( void** )&ctx.glColor4iv, "glColor4iv" );
    bindFunc( cast( void** )&ctx.glColor4sv, "glColor4sv" );
    bindFunc( cast( void** )&ctx.glColor4ubv, "glColor4ubv" );
    bindFunc( cast( void** )&ctx.glColor4uiv, "glColor4uiv" );
    bindFunc( cast( void** )&ctx.glColor4usv, "glColor4usv" );
    bindFunc( cast( void** )&ctx.glTexCoord1d, "glTexCoord1d" );
    bindFunc( cast( void** )&ctx.glTexCoord1f, "glTexCoord1f" );
    bindFunc( cast( void** )&ctx.glTexCoord1i, "glTexCoord1i" );
    bindFunc( cast( void** )&ctx.glTexCoord1s, "glTexCoord1s" );
    bindFunc( cast( void** )&ctx.glTexCoord2d, "glTexCoord2d" );
    bindFunc( cast( void** )&ctx.glTexCoord2f, "glTexCoord2f" );
    bindFunc( cast( void** )&ctx.glTexCoord2i, "glTexCoord2i" );
    bindFunc( cast( void** )&ctx.glTexCoord2s, "glTexCoord2s" );
    bindFunc( cast( void** )&ctx.glTexCoord3d, "glTexCoord3d" );
    bindFunc( cast( void** )&ctx.glTexCoord3f, "glTexCoord3f" );
    bindFunc( cast( void** )&ctx.glTexCoord3i, "glTexCoord3i" );
    bindFunc( cast( void** )&ctx.glTexCoord3s, "glTexCoord3s" );
    bindFunc( cast( void** )&ctx.glTexCoord4d, "glTexCoord4d" );
    bindFunc( cast( void** )&ctx.glTexCoord4f, "glTexCoord4f" );
    bindFunc( cast( void** )&ctx.glTexCoord4i, "glTexCoord4i" );
    bindFunc( cast( void** )&ctx.glTexCoord4s, "glTexCoord4s" );
    bindFunc( cast( void** )&ctx.glTexCoord1dv, "glTexCoord1dv" );
    bindFunc( cast( void** )&ctx.glTexCoord1fv, "glTexCoord1fv" );
    bindFunc( cast( void** )&ctx.glTexCoord1iv, "glTexCoord1iv" );
    bindFunc( cast( void** )&ctx.glTexCoord1sv, "glTexCoord1sv" );
    bindFunc( cast( void** )&ctx.glTexCoord2dv, "glTexCoord2dv" );
    bindFunc( cast( void** )&ctx.glTexCoord2fv, "glTexCoord2fv" );
    bindFunc( cast( void** )&ctx.glTexCoord2iv, "glTexCoord2iv" );
    bindFunc( cast( void** )&ctx.glTexCoord2sv, "glTexCoord2sv" );
    bindFunc( cast( void** )&ctx.glTexCoord3dv, "glTexCoord3dv" );
    bindFunc( cast( void** )&ctx.glTexCoord3fv, "glTexCoord3fv" );
    bindFunc( cast( void** )&ctx.glTexCoord3iv, "glTexCoord3iv" );
    bindFunc( cast( void** )&ctx.glTexCoord3sv, "glTexCoord3sv" );
    bindFunc( cast( void** )&ctx.glTexCoord4dv, "glTexCoord4dv" );
    bindFunc( cast( void** )&ctx.glTexCoord4fv, "glTexCoord4fv" );
    bindFunc( cast( void** )&ctx.glTexCoord4iv, "glTexCoord4iv" );
    bindFunc( cast( void** )&ctx.glTexCoord4sv, "glTexCoord4sv" );
    bindFunc( cast( void** )&ctx.glRasterPos2d, "glRasterPos2d" );
    bindFunc( cast( void** )&ctx.glRasterPos2f, "glRasterPos2f" );
    bindFunc( cast( void** )&ctx.glRasterPos2i, "glRasterPos2i" );
    bindFunc( cast( void** )&ctx.glRasterPos2s, "glRasterPos2s" );
    bindFunc( cast( void** )&ctx.glRasterPos3d, "glRasterPos3d" );
    bindFunc( cast( void** )&ctx.glRasterPos3f, "glRasterPos3f" );
    bindFunc( cast( void** )&ctx.glRasterPos3i, "glRasterPos3i" );
    bindFunc( cast( void** )&ctx.glRasterPos3s, "glRasterPos3s" );
    bindFunc( cast( void** )&ctx.glRasterPos4d, "glRasterPos4d" );
    bindFunc( cast( void** )&ctx.glRasterPos4f, "glRasterPos4f" );
    bindFunc( cast( void** )&ctx.glRasterPos4i, "glRasterPos4i" );
    bindFunc( cast( void** )&ctx.glRasterPos4s, "glRasterPos4s" );
    bindFunc( cast( void** )&ctx.glRasterPos2dv, "glRasterPos2dv" );
    bindFunc( cast( void** )&ctx.glRasterPos2fv, "glRasterPos2fv" );
    bindFunc( cast( void** )&ctx.glRasterPos2iv, "glRasterPos2iv" );
    bindFunc( cast( void** )&ctx.glRasterPos2sv, "glRasterPos2sv" );
    bindFunc( cast( void** )&ctx.glRasterPos3dv, "glRasterPos3dv" );
    bindFunc( cast( void** )&ctx.glRasterPos3fv, "glRasterPos3fv" );
    bindFunc( cast( void** )&ctx.glRasterPos3iv, "glRasterPos3iv" );
    bindFunc( cast( void** )&ctx.glRasterPos3sv, "glRasterPos3sv" );
    bindFunc( cast( void** )&ctx.glRasterPos4dv, "glRasterPos4dv" );
    bindFunc( cast( void** )&ctx.glRasterPos4fv, "glRasterPos4fv" );
    bindFunc( cast( void** )&ctx.glRasterPos4iv, "glRasterPos4iv" );
    bindFunc( cast( void** )&ctx.glRasterPos4sv, "glRasterPos4sv" );
    bindFunc( cast( void** )&ctx.glRectd, "glRectd" );
    bindFunc( cast( void** )&ctx.glRectf, "glRectf" );
    bindFunc( cast( void** )&ctx.glRecti, "glRecti" );
    bindFunc( cast( void** )&ctx.glRects, "glRects" );
    bindFunc( cast( void** )&ctx.glRectdv, "glRectdv" );
    bindFunc( cast( void** )&ctx.glRectfv, "glRectfv" );
    bindFunc( cast( void** )&ctx.glRectiv, "glRectiv" );
    bindFunc( cast( void** )&ctx.glRectsv, "glRectsv" );
    bindFunc( cast( void** )&ctx.glClipPlane, "glClipPlane" );
    bindFunc( cast( void** )&ctx.glGetClipPlane, "glGetClipPlane" );
    bindFunc( cast( void** )&ctx.glShadeModel, "glShadeModel" );
    bindFunc( cast( void** )&ctx.glLightf, "glLightf" );
    bindFunc( cast( void** )&ctx.glLighti, "glLighti" );
    bindFunc( cast( void** )&ctx.glLightfv, "glLightfv" );
    bindFunc( cast( void** )&ctx.glLightiv, "glLightiv" );
    bindFunc( cast( void** )&ctx.glGetLightfv, "glGetLightfv" );
    bindFunc( cast( void** )&ctx.glGetLightiv, "glGetLightiv" );
    bindFunc( cast( void** )&ctx.glLightModelf, "glLightModelf" );
    bindFunc( cast( void** )&ctx.glLightModeli, "glLightModeli" );
    bindFunc( cast( void** )&ctx.glLightModelfv, "glLightModelfv" );
    bindFunc( cast( void** )&ctx.glLightModeliv, "glLightModeliv" );
    bindFunc( cast( void** )&ctx.glMaterialf, "glMaterialf" );
    bindFunc( cast( void** )&ctx.glMateriali, "glMateriali" );
    bindFunc( cast( void** )&ctx.glMaterialfv, "glMaterialfv" );
    bindFunc( cast( void** )&ctx.glMaterialiv, "glMaterialiv" );
    bindFunc( cast( void** )&ctx.glGetMaterialfv, "glGetMaterialfv" );
    bindFunc( cast( void** )&ctx.glGetMaterialiv, "glGetMaterialiv" );
    bindFunc( cast( void** )&ctx.glColorMaterial, "glColorMaterial" );
    bindFunc( cast( void** )&ctx.glColorMaterial, "glColorMaterial" );
    bindFunc( cast( void** )&ctx.glFogf, "glFogf" );
    bindFunc( cast( void** )&ctx.glFogi, "glFogi" );
    bindFunc( cast( void** )&ctx.glFogfv, "glFogfv" );
    bindFunc( cast( void** )&ctx.glFogiv, "glFogiv" );
    bindFunc( cast( void** )&ctx.glLineStipple, "glLineStipple" );
    bindFunc( cast( void** )&ctx.glPolygonStipple, "glPolygonStipple" );
    bindFunc( cast( void** )&ctx.glGetPolygonStipple, "glGetPolygonStipple" );
    bindFunc( cast( void** )&ctx.glTexGend, "glTexGend" );
    bindFunc( cast( void** )&ctx.glTexGenf, "glTexGenf" );
    bindFunc( cast( void** )&ctx.glTexGeni, "glTexGeni" );
    bindFunc( cast( void** )&ctx.glTexGendv, "glTexGendv" );
    bindFunc( cast( void** )&ctx.glTexGenfv, "glTexGenfv" );
    bindFunc( cast( void** )&ctx.glTexGeniv, "glTexGeniv" );
    bindFunc( cast( void** )&ctx.glGetTexGendv, "glGetTexGendv" );
    bindFunc( cast( void** )&ctx.glGetTexGenfv, "glGetTexGenfv" );
    bindFunc( cast( void** )&ctx.glGetTexGeniv, "glGetTexGeniv" );
    bindFunc( cast( void** )&ctx.glTexEnvf, "glTexEnvf" );
    bindFunc( cast( void** )&ctx.glTexEnvi, "glTexEnvi" );
    bindFunc( cast( void** )&ctx.glTexEnvfv, "glTexEnvfv" );
    bindFunc( cast( void** )&ctx.glTexEnviv, "glTexEnviv" );
    bindFunc( cast( void** )&ctx.glGetTexEnvfv, "glGetTexEnvfv" );
    bindFunc( cast( void** )&ctx.glGetTexEnviv, "glGetTexEnviv" );
    bindFunc( cast( void** )&ctx.glFeedbackBuffer, "glFeedbackBuffer" );
    bindFunc( cast( void** )&ctx.glPassThrough, "glPassThrough" );
    bindFunc( cast( void** )&ctx.glSelectBuffer, "glSelectBuffer" );
    bindFunc( cast( void** )&ctx.glInitNames, "glInitNames" );
    bindFunc( cast( void** )&ctx.glLoadName, "glLoadName" );
    bindFunc( cast( void** )&ctx.glPushName, "glPushName" );
    bindFunc( cast( void** )&ctx.glPopName, "glPopName" );
    bindFunc( cast( void** )&ctx.glRenderMode, "glRenderMode" );
    bindFunc( cast( void** )&ctx.glClearAccum, "glClearAccum" );
    bindFunc( cast( void** )&ctx.glAccum, "glAccum" );
    bindFunc( cast( void** )&ctx.glClearIndex, "glClearIndex" );
    bindFunc( cast( void** )&ctx.glIndexMask, "glIndexMask" );
    bindFunc( cast( void** )&ctx.glPushAttrib, "glPushAttrib" );
    bindFunc( cast( void** )&ctx.glPopAttrib, "glPopAttrib" );
    bindFunc( cast( void** )&ctx.glMap1d, "glMap1d" );
    bindFunc( cast( void** )&ctx.glMap1f, "glMap1f" );
    bindFunc( cast( void** )&ctx.glMap2d, "glMap2d" );
    bindFunc( cast( void** )&ctx.glMap2f, "glMap2f" );
    bindFunc( cast( void** )&ctx.glGetMapdv, "glGetMapdv" );
    bindFunc( cast( void** )&ctx.glGetMapfv, "glGetMapfv" );
    bindFunc( cast( void** )&ctx.glGetMapiv, "glGetMapiv" );
    bindFunc( cast( void** )&ctx.glEvalCoord1d, "glEvalCoord1d" );
    bindFunc( cast( void** )&ctx.glEvalCoord1f, "glEvalCoord1f" );
    bindFunc( cast( void** )&ctx.glEvalCoord1dv, "glEvalCoord1dv" );
    bindFunc( cast( void** )&ctx.glEvalCoord1fv, "glEvalCoord1fv" );
    bindFunc( cast( void** )&ctx.glEvalCoord2d, "glEvalCoord2d" );
    bindFunc( cast( void** )&ctx.glEvalCoord2f, "glEvalCoord2f" );
    bindFunc( cast( void** )&ctx.glEvalCoord2dv, "glEvalCoord2dv" );
    bindFunc( cast( void** )&ctx.glEvalCoord2fv, "glEvalCoord2fv" );
    bindFunc( cast( void** )&ctx.glMapGrid1d, "glMapGrid1d" );
    bindFunc( cast( void** )&ctx.glMapGrid1f, "glMapGrid1f" );
    bindFunc( cast( void** )&ctx.glMapGrid2d, "glMapGrid2d" );
    bindFunc( cast( void** )&ctx.glMapGrid2f, "glMapGrid2f" );
    bindFunc( cast( void** )&ctx.glEvalPoint1, "glEvalPoint1" );
    bindFunc( cast( void** )&ctx.glEvalPoint2, "glEvalPoint2" );
    bindFunc( cast( void** )&ctx.glEvalMesh1, "glEvalMesh1" );
    bindFunc( cast( void** )&ctx.glEvalMesh2, "glEvalMesh2" );
    bindFunc( cast( void** )&ctx.glAlphaFunc, "glAlphaFunc" );
    bindFunc( cast( void** )&ctx.glPixelZoom, "glPixelZoom" );
    bindFunc( cast( void** )&ctx.glPixelTransferf, "glPixelTransferf" );
    bindFunc( cast( void** )&ctx.glPixelTransferi, "glPixelTransferi" );
    bindFunc( cast( void** )&ctx.glPixelMapfv, "glPixelMapfv" );
    bindFunc( cast( void** )&ctx.glPixelMapuiv, "glPixelMapuiv" );
    bindFunc( cast( void** )&ctx.glPixelMapusv, "glPixelMapusv" );
    bindFunc( cast( void** )&ctx.glGetPixelMapfv, "glGetPixelMapfv" );
    bindFunc( cast( void** )&ctx.glGetPixelMapuiv, "glGetPixelMapuiv" );
    bindFunc( cast( void** )&ctx.glGetPixelMapusv, "glGetPixelMapusv" );
    bindFunc( cast( void** )&ctx.glDrawPixels, "glDrawPixels" );
    bindFunc( cast( void** )&ctx.glCopyPixels, "glCopyPixels" );
    bindFunc( cast( void** )&ctx.glFrustum, "glFrustum" );
    bindFunc( cast( void** )&ctx.glMatrixMode, "glMatrixMode" );
    bindFunc( cast( void** )&ctx.glOrtho, "glOrtho" );
    bindFunc( cast( void** )&ctx.glFrustum, "glFrustum" );
    bindFunc( cast( void** )&ctx.glViewport, "glViewport" );
    bindFunc( cast( void** )&ctx.glPushMatrix, "glPushMatrix" );
    bindFunc( cast( void** )&ctx.glPopMatrix, "glPopMatrix" );
    bindFunc( cast( void** )&ctx.glLoadIdentity, "glLoadIdentity" );
    bindFunc( cast( void** )&ctx.glLoadMatrixd, "glLoadMatrixd" );
    bindFunc( cast( void** )&ctx.glLoadMatrixf, "glLoadMatrixf" );
    bindFunc( cast( void** )&ctx.glMultMatrixd, "glMultMatrixd" );
    bindFunc( cast( void** )&ctx.glMultMatrixf, "glMultMatrixf" );
    bindFunc( cast( void** )&ctx.glRotated, "glRotated" );
    bindFunc( cast( void** )&ctx.glRotatef, "glRotatef" );
    bindFunc( cast( void** )&ctx.glScaled, "glScaled" );
    bindFunc( cast( void** )&ctx.glScalef, "glScalef" );
    bindFunc( cast( void** )&ctx.glTranslated, "glTranslated" );
    bindFunc( cast( void** )&ctx.glTranslatef, "glTranslatef" );
    bindFunc( cast( void** )&ctx.glVertexPointer, "glVertexPointer" );
    bindFunc( cast( void** )&ctx.glNormalPointer, "glNormalPointer" );
    bindFunc( cast( void** )&ctx.glColorPointer, "glColorPointer" );
    bindFunc( cast( void** )&ctx.glIndexPointer, "glIndexPointer" );
    bindFunc( cast( void** )&ctx.glTexCoordPointer, "glTexCoordPointer" );
    bindFunc( cast( void** )&ctx.glEdgeFlagPointer, "glEdgeFlagPointer" );
    bindFunc( cast( void** )&ctx.glGetPointerv, "glGetPointerv" );
    bindFunc( cast( void** )&ctx.glArrayElement, "glArrayElement" );
    bindFunc( cast( void** )&ctx.glInterleavedArrays, "glInterleavedArrays" );
    bindFunc( cast( void** )&ctx.glEnableClientState, "glEnableClientState" );
    bindFunc( cast( void** )&ctx.glDisableClientState, "glDisableClientState" );
    bindFunc( cast( void** )&ctx.glPrioritizeTextures, "glPrioritizeTextures" );
    bindFunc( cast( void** )&ctx.glAreTexturesResident, "glAreTexturesResident" );
    bindFunc( cast( void** )&ctx.glPushClientAttrib, "glPushClientAttrib" );
    bindFunc( cast( void** )&ctx.glPopClientAttrib, "glPopClientAttrib" );
}

void loadContext( alias ctx)( GLVersion glversion ) {
    if( glversion >= GLVersion.GL12 && isExtSupported( glversion, "GL_ARB_imaging" ) ) {
        bindGLFunc( cast( void** )&glColorTable, "glColorTable" );
        bindGLFunc( cast( void** )&glColorSubTable, "glColorSubTable" );
        bindGLFunc( cast( void** )&glColorTableParameteriv, "glColorTableParameteriv" );
        bindGLFunc( cast( void** )&glColorTableParameterfv, "glColorTableParameterfv" );
        bindGLFunc( cast( void** )&glCopyColorSubTable, "glCopyColorSubTable" );
        bindGLFunc( cast( void** )&glCopyColorTable, "glCopyColorTable" );
        bindGLFunc( cast( void** )&glGetColorTable, "glGetColorTable" );
        bindGLFunc( cast( void** )&glGetColorTableParameterfv, "glGetColorTableParameterfv" );
        bindGLFunc( cast( void** )&glGetColorTableParameteriv, "glGetColorTableParameteriv" );
        bindGLFunc( cast( void** )&glHistogram, "glHistogram" );
        bindGLFunc( cast( void** )&glResetHistogram, "glResetHistogram" );
        bindGLFunc( cast( void** )&glGetHistogram, "glGetHistogram" );
        bindGLFunc( cast( void** )&glGetHistogramParameterfv, "glGetHistogramParameterfv" );
        bindGLFunc( cast( void** )&glGetHistogramParameteriv, "glGetHistogramParameteriv" );
        bindGLFunc( cast( void** )&glMinmax, "glMinmax" );
        bindGLFunc( cast( void** )&glResetMinmax, "glResetMinmax" );
        bindGLFunc( cast( void** )&glGetMinmax, "glGetMinmax" );
        bindGLFunc( cast( void** )&glGetMinmaxParameterfv, "glGetMinmaxParameterfv" );
        bindGLFunc( cast( void** )&glGetMinmaxParameteriv, "glGetMinmaxParameteriv" );
        bindGLFunc( cast( void** )&glConvolutionFilter1D, "glConvolutionFilter1D" );
        bindGLFunc( cast( void** )&glConvolutionFilter2D, "glConvolutionFilter2D" );
        bindGLFunc( cast( void** )&glConvolutionParameterf, "glConvolutionParameterf" );
        bindGLFunc( cast( void** )&glConvolutionParameterfv, "glConvolutionParameterfv" );
        bindGLFunc( cast( void** )&glConvolutionParameteri, "glConvolutionParameteri" );
        bindGLFunc( cast( void** )&glConvolutionParameteriv, "glConvolutionParameteriv" );
        bindGLFunc( cast( void** )&glCopyConvolutionFilter1D, "glCopyConvolutionFilter1D" );
        bindGLFunc( cast( void** )&glCopyConvolutionFilter2D, "glCopyConvolutionFilter2D" );
        bindGLFunc( cast( void** )&glGetConvolutionFilter, "glGetConvolutionFilter" );
        bindGLFunc( cast( void** )&glGetConvolutionParameterfv, "glGetConvolutionParameterfv" );
        bindGLFunc( cast( void** )&glGetConvolutionParameteriv, "glGetConvolutionParameteriv" );
        bindGLFunc( cast( void** )&glSeparableFilter2D, "glSeparableFilter2D" );
        bindGLFunc( cast( void** )&glGetSeparableFilter, "glGetSeparableFilter" );
    }

    if( glversion >= GLVersion.GL13 ) {
        bindGLFunc( cast( void** )&glClientActiveTexture, "glClientActiveTexture" );
        bindGLFunc( cast( void** )&glMultiTexCoord1d, "glMultiTexCoord1d" );
        bindGLFunc( cast( void** )&glMultiTexCoord1dv, "glMultiTexCoord1dv" );
        bindGLFunc( cast( void** )&glMultiTexCoord1f, "glMultiTexCoord1f" );
        bindGLFunc( cast( void** )&glMultiTexCoord1fv, "glMultiTexCoord1fv" );
        bindGLFunc( cast( void** )&glMultiTexCoord1i, "glMultiTexCoord1i" );
        bindGLFunc( cast( void** )&glMultiTexCoord1iv, "glMultiTexCoord1iv" );
        bindGLFunc( cast( void** )&glMultiTexCoord1s, "glMultiTexCoord1s" );
        bindGLFunc( cast( void** )&glMultiTexCoord1sv, "glMultiTexCoord1sv" );
        bindGLFunc( cast( void** )&glMultiTexCoord2d, "glMultiTexCoord2d" );
        bindGLFunc( cast( void** )&glMultiTexCoord2dv, "glMultiTexCoord2dv" );
        bindGLFunc( cast( void** )&glMultiTexCoord2f, "glMultiTexCoord2f" );
        bindGLFunc( cast( void** )&glMultiTexCoord2fv, "glMultiTexCoord2fv" );
        bindGLFunc( cast( void** )&glMultiTexCoord2i, "glMultiTexCoord2i" );
        bindGLFunc( cast( void** )&glMultiTexCoord2iv, "glMultiTexCoord2iv" );
        bindGLFunc( cast( void** )&glMultiTexCoord2s, "glMultiTexCoord2s" );
        bindGLFunc( cast( void** )&glMultiTexCoord2sv, "glMultiTexCoord2sv" );
        bindGLFunc( cast( void** )&glMultiTexCoord3d, "glMultiTexCoord3d" );
        bindGLFunc( cast( void** )&glMultiTexCoord3dv, "glMultiTexCoord3dv" );
        bindGLFunc( cast( void** )&glMultiTexCoord3f, "glMultiTexCoord3f" );
        bindGLFunc( cast( void** )&glMultiTexCoord3fv, "glMultiTexCoord3fv" );
        bindGLFunc( cast( void** )&glMultiTexCoord3i, "glMultiTexCoord3i" );
        bindGLFunc( cast( void** )&glMultiTexCoord3iv, "glMultiTexCoord3iv" );
        bindGLFunc( cast( void** )&glMultiTexCoord3s, "glMultiTexCoord3s" );
        bindGLFunc( cast( void** )&glMultiTexCoord3sv, "glMultiTexCoord3sv" );
        bindGLFunc( cast( void** )&glMultiTexCoord4d, "glMultiTexCoord4d" );
        bindGLFunc( cast( void** )&glMultiTexCoord4dv, "glMultiTexCoord4dv" );
        bindGLFunc( cast( void** )&glMultiTexCoord4f, "glMultiTexCoord4f" );
        bindGLFunc( cast( void** )&glMultiTexCoord4fv, "glMultiTexCoord4fv" );
        bindGLFunc( cast( void** )&glMultiTexCoord4i, "glMultiTexCoord4i" );
        bindGLFunc( cast( void** )&glMultiTexCoord4iv, "glMultiTexCoord4iv" );
        bindGLFunc( cast( void** )&glMultiTexCoord4s, "glMultiTexCoord4s" );
        bindGLFunc( cast( void** )&glMultiTexCoord4sv, "glMultiTexCoord4sv" );
        bindGLFunc( cast( void** )&glLoadTransposeMatrixd, "glLoadTransposeMatrixd" );
        bindGLFunc( cast( void** )&glLoadTransposeMatrixf, "glLoadTransposeMatrixf" );
        bindGLFunc( cast( void** )&glMultTransposeMatrixd, "glMultTransposeMatrixd" );
        bindGLFunc( cast( void** )&glMultTransposeMatrixf, "glMultTransposeMatrixf" );
    }

    if( glversion >= GLVersion.GL14 ) {
        bindGLFunc( cast( void** )&glFogCoordf, "glFogCoordf" );
        bindGLFunc( cast( void** )&glFogCoordfv, "glFogCoordfv" );
        bindGLFunc( cast( void** )&glFogCoordd, "glFogCoordd" );
        bindGLFunc( cast( void** )&glFogCoorddv, "glFogCoorddv" );
        bindGLFunc( cast( void** )&glFogCoordPointer, "glFogCoordPointer" );
        bindGLFunc( cast( void** )&glSecondaryColor3b, "glSecondaryColor3b" );
        bindGLFunc( cast( void** )&glSecondaryColor3bv, "glSecondaryColor3bv" );
        bindGLFunc( cast( void** )&glSecondaryColor3d, "glSecondaryColor3d" );
        bindGLFunc( cast( void** )&glSecondaryColor3dv, "glSecondaryColor3dv" );
        bindGLFunc( cast( void** )&glSecondaryColor3f, "glSecondaryColor3f" );
        bindGLFunc( cast( void** )&glSecondaryColor3fv, "glSecondaryColor3fv" );
        bindGLFunc( cast( void** )&glSecondaryColor3i, "glSecondaryColor3i" );
        bindGLFunc( cast( void** )&glSecondaryColor3iv, "glSecondaryColor3iv" );
        bindGLFunc( cast( void** )&glSecondaryColor3s, "glSecondaryColor3s" );
        bindGLFunc( cast( void** )&glSecondaryColor3sv, "glSecondaryColor3sv" );
        bindGLFunc( cast( void** )&glSecondaryColor3ub, "glSecondaryColor3ub" );
        bindGLFunc( cast( void** )&glSecondaryColor3ubv, "glSecondaryColor3ubv" );
        bindGLFunc( cast( void** )&glSecondaryColor3ui, "glSecondaryColor3ui" );
        bindGLFunc( cast( void** )&glSecondaryColor3uiv, "glSecondaryColor3uiv" );
        bindGLFunc( cast( void** )&glSecondaryColor3us, "glSecondaryColor3us" );
        bindGLFunc( cast( void** )&glSecondaryColor3usv, "glSecondaryColor3usv" );
        bindGLFunc( cast( void** )&glSecondaryColorPointer, "glSecondaryColorPointer" );
        bindGLFunc( cast( void** )&glWindowPos2d, "glWindowPos2d" );
        bindGLFunc( cast( void** )&glWindowPos2dv, "glWindowPos2dv" );
        bindGLFunc( cast( void** )&glWindowPos2f, "glWindowPos2f" );
        bindGLFunc( cast( void** )&glWindowPos2fv, "glWindowPos2fv" );
        bindGLFunc( cast( void** )&glWindowPos2i, "glWindowPos2i" );
        bindGLFunc( cast( void** )&glWindowPos2iv, "glWindowPos2iv" );
        bindGLFunc( cast( void** )&glWindowPos2s, "glWindowPos2s" );
        bindGLFunc( cast( void** )&glWindowPos2sv, "glWindowPos2sv" );
        bindGLFunc( cast( void** )&glWindowPos3d, "glWindowPos3d" );
        bindGLFunc( cast( void** )&glWindowPos3dv, "glWindowPos3dv" );
        bindGLFunc( cast( void** )&glWindowPos3f, "glWindowPos3f" );
        bindGLFunc( cast( void** )&glWindowPos3fv, "glWindowPos3fv" );
        bindGLFunc( cast( void** )&glWindowPos3i, "glWindowPos3i" );
        bindGLFunc( cast( void** )&glWindowPos3iv, "glWindowPos3iv" );
        bindGLFunc( cast( void** )&glWindowPos3s, "glWindowPos3s" );
        bindGLFunc( cast( void** )&glWindowPos3sv, "glWindowPos3sv" );
    }
}