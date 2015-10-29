/* $Id: matrix.c,v 1.10 1997/02/10 19:47:53 brianp Exp $ */

/*
 * Mesa 3-D graphics library
 * Version:  2.2
 * Copyright (C) 1995-1997  Brian Paul
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */


/*
 * $Log: matrix.c,v $
 * Revision 1.10  1997/02/10 19:47:53  brianp
 * moved buffer resize code out of gl_Viewport() into gl_ResizeBuffersMESA()
 *
 * Revision 1.9  1997/01/31 23:32:40  brianp
 * now clear depth buffer after reallocation due to window resize
 *
 * Revision 1.8  1997/01/29 19:06:04  brianp
 * removed extra, local definition of Identity[] matrix
 *
 * Revision 1.7  1997/01/28 22:19:17  brianp
 * new matrix inversion code from Stephane Rehel
 *
 * Revision 1.6  1996/12/22 17:53:11  brianp
 * faster invert_matrix() function from scotter@lafn.org
 *
 * Revision 1.5  1996/12/02 18:58:34  brianp
 * gl_rotation_matrix() now returns identity matrix if given a 0 rotation axis
 *
 * Revision 1.4  1996/09/27 01:29:05  brianp
 * added missing default cases to switches
 *
 * Revision 1.3  1996/09/15 14:18:37  brianp
 * now use GLframebuffer and GLvisual
 *
 * Revision 1.2  1996/09/14 06:46:04  brianp
 * better matmul() from Jacques Leroy
 *
 * Revision 1.1  1996/09/13 01:38:16  brianp
 * Initial revision
 *
 */


/*
 * Matrix operations
 *
 *
 * NOTES:
 * 1. 4x4 transformation matrices are stored in memory in column major order.
 * 2. Points/vertices are to be thought of as column vectors.
 * 3. Transformation of a point p by a matrix M is: p' = M * p
 *
 */

/*
 * Perform a 4x4 matrix multiplication  (product = a x b).
 * Input:  a, b - matrices to multiply
 * Output:  product - product of a and b
 * WARNING: (product != b) assumed
 * NOTE:    (product == a) allowed    
 */
static void matmul( GLfloat *product, const GLfloat *a, const GLfloat *b )
{
   /* This matmul was contributed by Thomas Malik */
   GLint i;

#define A(row,col)  a[(col<<2)+row]
#define B(row,col)  b[(col<<2)+row]
#define P(row,col)  product[(col<<2)+row]

   /* i-te Zeile */
   for (i = 0; i < 4; i++) {
      GLfloat ai0=A(i,0),  ai1=A(i,1),  ai2=A(i,2),  ai3=A(i,3);
      P(i,0) = ai0 * B(0,0) + ai1 * B(1,0) + ai2 * B(2,0) + ai3 * B(3,0);
      P(i,1) = ai0 * B(0,1) + ai1 * B(1,1) + ai2 * B(2,1) + ai3 * B(3,1);
      P(i,2) = ai0 * B(0,2) + ai1 * B(1,2) + ai2 * B(2,2) + ai3 * B(3,2);
      P(i,3) = ai0 * B(0,3) + ai1 * B(1,3) + ai2 * B(2,3) + ai3 * B(3,3);
   }

#undef A
#undef B
#undef P
}

