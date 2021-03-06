C        Generated by TAPENADE     (INRIA, Tropics team)
C  Tapenade 3.6 (r4343) - 10 Feb 2012 10:52
C
C  Differentiation of vortic in reverse (adjoint) mode:
C   gradient     of useful results: u v vort
C   with respect to varying inputs: u v vort
C   RW status of diff variables: u:incr v:incr vort:in-out
C
C*************************************************************
      SUBROUTINE VORTIC_BQ(vort, vortb, u, ub, v, vb, xx, xy, yx, yy, jd
     +                     , kd, js, je, ks, ke)
      USE PARAMS_GLOBAL
      IMPLICIT NONE
C*************************************************************
C*************************************************************
      INTEGER jd, kd, js, je, ks, ke
      REAL vort(jd, kd)
      REAL vortb(jd, kd)
      REAL xx(jd, kd), xy(jd, kd), yx(jd, kd), yy(jd, kd)
C local variables
      REAL u(jd, kd), v(jd, kd)
      REAL ub(jd, kd), vb(jd, kd)
C
      INTEGER j, k
      REAL dx2, dy2, ux, vx, uy, vy, tx
      REAL uxb, vxb, uyb, vyb, txb
      INTRINSIC ABS
C
C**   first executable statement
C
      dx2 = 0.5
      dy2 = 0.5
      DO k=ks,ke
        DO j=js,je
C
          ux = (u(j+1, k)-u(j-1, k))*dx2
          vx = (v(j+1, k)-v(j-1, k))*dx2
          uy = (u(j, k+1)-u(j, k-1))*dy2
          vy = (v(j, k+1)-v(j, k-1))*dy2
C
          tx = xy(j, k)*ux - xx(j, k)*vx + yy(j, k)*uy - yx(j, k)*vy
          IF (tx .GE. 0.) THEN
            txb = vortb(j, k)
            vortb(j, k) = 0.0
          ELSE
            txb = -vortb(j, k)
            vortb(j, k) = 0.0
          END IF
          uxb = xy(j, k)*txb
          vxb = -(xx(j, k)*txb)
          uyb = yy(j, k)*txb
          vyb = -(yx(j, k)*txb)
          vb(j, k+1) = vb(j, k+1) + dy2*vyb
          vb(j, k-1) = vb(j, k-1) - dy2*vyb
          ub(j, k+1) = ub(j, k+1) + dy2*uyb
          ub(j, k-1) = ub(j, k-1) - dy2*uyb
          vb(j+1, k) = vb(j+1, k) + dx2*vxb
          vb(j-1, k) = vb(j-1, k) - dx2*vxb
          ub(j+1, k) = ub(j+1, k) + dx2*uxb
          ub(j-1, k) = ub(j-1, k) - dx2*uxb
        ENDDO
      ENDDO
      END
