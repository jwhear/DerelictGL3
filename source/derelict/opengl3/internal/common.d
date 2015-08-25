/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software" ) to use, reproduce, display, distribute,
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
module derelict.opengl3.internal.common;

private {
    import core.stdc.string;
    import std.string;
    import std.conv;

    import derelict.util.exception;
    import derelict.util.system;
    import derelict.opengl3.internal.platform;
    import derelict.opengl3.internal.types;
    import derelict.opengl3.internal.coreconstants;
    //static if( Derelict_OS_Mac ) import derelict.opengl3.cgl;
    //else static if( Derelict_OS_Posix ) import derelict.opengl3.glx;
}

public {
    void bindGLFunc( alias ctx )( void** ptr, string symName ) {
        auto sym = loadGLFunc!ctx( symName );
        if( !sym )
            throw new SymbolLoadException( "Failed to load OpenGL symbol [" ~ symName ~ "]" );
        *ptr = sym;
    }

    bool isExtSupported( alias ctx )( GLVersion glversion, string name ) {
        // If OpenGL 3+ is loaded, use glGetStringi.
        if( glversion >= GLVersion.GL30 ) {
            auto cstr = name.toStringz(  );
            int count;
            ctx.glGetIntegerv( GL_NUM_EXTENSIONS, &count );
            for( int i=0; i<count; ++i ) {
                if( strcmp( ctx.glGetStringi( GL_EXTENSIONS, i ), cstr ) == 0 )
                    return true;
            }
            return false;
        }
        // Otherwise use the classic approach.
        else {
            return findEXT(  ctx.glGetString( GL_EXTENSIONS ), name  );
        }
    }

    // Assumes that extname is null-terminated, i.e. a string literal
    bool findEXT( const char *extstr, string extname  ) {
        import core.stdc.string;
        auto res = strstr( extstr, extname.ptr  );
        while( res  ) {
            // It's possible that the extension name is actually a
            // substring of another extension. If not, then the
            // character following the name in the extension string
            // should be a space (or possibly the null character ).
            if( res[ extname.length ] == ' ' || res[ extname.length ] == '\0' )
                return true;
            res = strstr( res + extname.length, extname.ptr  );
        }

        return false;
    }

    GLVersion findMaxAvailableVersion( alias ctx )()
    {
        /* glGetString( GL_VERSION ) is guaranteed to return a constant string
         of the format "[major].[minor].[build] xxxx", where xxxx is vendor-specific
         information. Here, I'm pulling two characters out of the string, the major
         and minor version numbers. */
        const( char )* verstr = ctx.glGetString( GL_VERSION );
        char major = *verstr;
        char minor = *( verstr + 2 );

        switch( major ) {
            case '4':
                if( minor == '3' ) return GLVersion.GL43;
                else if( minor == '2' ) return GLVersion.GL42;
                else if( minor == '1' ) return GLVersion.GL41;
                else if( minor == '0' ) return GLVersion.GL40;

                /* No default condition here, since it's possible for new
                 minor versions of the 4.x series to be released before
                 support is added to Derelict. That case is handled outside
                 of the switch. When no more 4.x versions are released, this
                 should be changed to return GL40 by default. */
                break;

            case '3':
                if( minor == '3' ) return GLVersion.GL33;
                else if( minor == '2' ) return GLVersion.GL32;
                else if( minor == '1' ) return GLVersion.GL31;
                else return GLVersion.GL30;

            case '2':
                if( minor == '1' ) return GLVersion.GL21;
                else return GLVersion.GL20;

            case '1':
                if( minor == '5' ) return GLVersion.GL15;
                else if( minor == '4' ) return GLVersion.GL14;
                else if( minor == '3' ) return GLVersion.GL13;
                else if( minor == '2' ) return GLVersion.GL12;
                else return GLVersion.GL11;

            default:
                /* glGetString( GL_VERSION ) is guaranteed to return a result
                 of a specific format, so if this point is reached it is
                 going to be because a major version higher than what Derelict
                 supports was encountered. That case is handled outside the
                 switch. */
                break;

        }

        /* It's highly likely at this point that the version is higher than
         what Derelict supports, so return the highest supported version. */
        return GLVersion.HighestSupported;
    }
}