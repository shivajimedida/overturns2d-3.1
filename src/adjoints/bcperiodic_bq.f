C        Generated by TAPENADE     (INRIA, Tropics team)
C  Tapenade 3.6 (r4343) - 10 Feb 2012 10:52
C
C  Differentiation of bcperiodic in reverse (adjoint) mode:
C   gradient     of useful results: q
C   with respect to varying inputs: q
C
C***********************************************************************
      SUBROUTINE BCPERIODIC_BQ(q, qb, jd, kd, js, je, ks, ke, idir)
      USE PARAMS_GLOBAL
      IMPLICIT NONE
C
C..periodic boundary for overlapping planes
C
C***********************************************************************
C***********************************************************************
C
      INTEGER jd, kd
      REAL q(jd, kd, nq)
      REAL qb(jd, kd, nq)
      INTEGER js, je, ks, ke, idir
C
C.. local variables
C
      INTEGER j, k, jc, jj, jj1, kc, kk, kk1
      INTEGER iadd
      REAL scale
      REAL scaleb
      REAL tmp
      REAL tmp0
      REAL tmp1
      REAL tmp2
      REAL tmp3
      REAL tmp4
      REAL tmp5
      REAL tmp6
      REAL tmp7
      REAL tmp8
      REAL tmp9
      REAL tmp10
      REAL tmp11
      REAL tmp12
      REAL tmp13
      REAL tmp14
      REAL tmp4b
      REAL tmp7b
      REAL tempb2
      REAL tempb1
      REAL tempb0
      REAL tmp10b
      REAL tmpb
      INTRINSIC SIGN
      REAL tmp0b
      REAL tmp13b
      REAL tmp3b
      REAL tmp6b
      REAL tmp9b
      REAL tempb
      REAL tmp12b
      REAL tmp2b
      REAL tmp5b
      REAL tmp8b
      INTRINSIC ATAN
      REAL tmp11b
      REAL tmp1b
      REAL tmp14b
C
      IF (idir .EQ. 1) THEN
        jj = je - js + 1
        DO j=js,je
          jj1 = j - js + 1
          CALL PUSHINTEGER4(jc)
          jc = jd - 2*jj + jj1
          DO k=ks,ke
            CALL PUSHREAL8(scale)
            scale = q(jc, k, nq)/q(j, k, nq)
            tmp = q(jc, k, 1)*scale
            CALL PUSHREAL8(q(j, k, 1))
            q(j, k, 1) = tmp
            tmp0 = q(jc, k, 2)*scale
            CALL PUSHREAL8(q(j, k, 2))
            q(j, k, 2) = tmp0
            tmp1 = q(jc, k, 3)*scale
            CALL PUSHREAL8(q(j, k, 3))
            q(j, k, 3) = tmp1
            tmp2 = q(jc, k, 4)*scale
            CALL PUSHREAL8(q(j, k, 4))
            q(j, k, 4) = tmp2
          ENDDO
        ENDDO
        DO j=je,js,-1
          DO k=ke,ks,-1
            CALL POPREAL8(q(j, k, 4))
            tmp2b = qb(j, k, 4)
            qb(j, k, 4) = 0.0
            qb(jc, k, 4) = qb(jc, k, 4) + scale*tmp2b
            scaleb = q(jc, k, 4)*tmp2b
            CALL POPREAL8(q(j, k, 3))
            tmp1b = qb(j, k, 3)
            qb(j, k, 3) = 0.0
            qb(jc, k, 3) = qb(jc, k, 3) + scale*tmp1b
            scaleb = scaleb + q(jc, k, 3)*tmp1b
            CALL POPREAL8(q(j, k, 2))
            tmp0b = qb(j, k, 2)
            qb(j, k, 2) = 0.0
            qb(jc, k, 2) = qb(jc, k, 2) + scale*tmp0b
            scaleb = scaleb + q(jc, k, 2)*tmp0b
            CALL POPREAL8(q(j, k, 1))
            tmpb = qb(j, k, 1)
            qb(j, k, 1) = 0.0
            qb(jc, k, 1) = qb(jc, k, 1) + scale*tmpb
            scaleb = scaleb + q(jc, k, 1)*tmpb
            CALL POPREAL8(scale)
            tempb = scaleb/q(j, k, nq)
            qb(jc, k, nq) = qb(jc, k, nq) + tempb
            qb(j, k, nq) = qb(j, k, nq) - q(jc, k, nq)*tempb/q(j, k, nq)
          ENDDO
          CALL POPINTEGER4(jc)
        ENDDO
      ELSE IF (idir .EQ. -1) THEN
C
        jj = je - js + 1
        DO j=js,je
          jj1 = je - j + 1
          CALL PUSHINTEGER4(jc)
          jc = 1 + 2*jj - jj1
          DO k=ks,ke
            CALL PUSHREAL8(scale)
            scale = q(jc, k, nq)/q(j, k, nq)
            tmp3 = q(jc, k, 1)*scale
            CALL PUSHREAL8(q(j, k, 1))
            q(j, k, 1) = tmp3
            tmp4 = q(jc, k, 2)*scale
            CALL PUSHREAL8(q(j, k, 2))
            q(j, k, 2) = tmp4
            tmp5 = q(jc, k, 3)*scale
            CALL PUSHREAL8(q(j, k, 3))
            q(j, k, 3) = tmp5
            tmp6 = q(jc, k, 4)*scale
            CALL PUSHREAL8(q(j, k, 4))
            q(j, k, 4) = tmp6
          ENDDO
        ENDDO
        DO j=je,js,-1
          DO k=ke,ks,-1
            CALL POPREAL8(q(j, k, 4))
            tmp6b = qb(j, k, 4)
            qb(j, k, 4) = 0.0
            qb(jc, k, 4) = qb(jc, k, 4) + scale*tmp6b
            scaleb = q(jc, k, 4)*tmp6b
            CALL POPREAL8(q(j, k, 3))
            tmp5b = qb(j, k, 3)
            qb(j, k, 3) = 0.0
            qb(jc, k, 3) = qb(jc, k, 3) + scale*tmp5b
            scaleb = scaleb + q(jc, k, 3)*tmp5b
            CALL POPREAL8(q(j, k, 2))
            tmp4b = qb(j, k, 2)
            qb(j, k, 2) = 0.0
            qb(jc, k, 2) = qb(jc, k, 2) + scale*tmp4b
            scaleb = scaleb + q(jc, k, 2)*tmp4b
            CALL POPREAL8(q(j, k, 1))
            tmp3b = qb(j, k, 1)
            qb(j, k, 1) = 0.0
            qb(jc, k, 1) = qb(jc, k, 1) + scale*tmp3b
            scaleb = scaleb + q(jc, k, 1)*tmp3b
            CALL POPREAL8(scale)
            tempb0 = scaleb/q(j, k, nq)
            qb(jc, k, nq) = qb(jc, k, nq) + tempb0
            qb(j, k, nq) = qb(j, k, nq) - q(jc, k, nq)*tempb0/q(j, k, nq
     +        )
          ENDDO
          CALL POPINTEGER4(jc)
        ENDDO
      ELSE IF (idir .EQ. 2) THEN
C
        kk = ke - ks + 1
        DO k=ks,ke
          kk1 = k - ks + 1
          CALL PUSHINTEGER4(kc)
          kc = kd - 2*kk + kk1
          DO j=js,je
            CALL PUSHREAL8(scale)
            scale = q(j, kc, nq)/q(j, k, nq)
            tmp7 = q(j, kc, 1)*scale
            CALL PUSHREAL8(q(j, k, 1))
            q(j, k, 1) = tmp7
            tmp8 = q(j, kc, 2)*scale
            CALL PUSHREAL8(q(j, k, 2))
            q(j, k, 2) = tmp8
            tmp9 = q(j, kc, 3)*scale
            CALL PUSHREAL8(q(j, k, 3))
            q(j, k, 3) = tmp9
            tmp10 = q(j, kc, 4)*scale
            CALL PUSHREAL8(q(j, k, 4))
            q(j, k, 4) = tmp10
          ENDDO
        ENDDO
        DO k=ke,ks,-1
          DO j=je,js,-1
            CALL POPREAL8(q(j, k, 4))
            tmp10b = qb(j, k, 4)
            qb(j, k, 4) = 0.0
            qb(j, kc, 4) = qb(j, kc, 4) + scale*tmp10b
            scaleb = q(j, kc, 4)*tmp10b
            CALL POPREAL8(q(j, k, 3))
            tmp9b = qb(j, k, 3)
            qb(j, k, 3) = 0.0
            qb(j, kc, 3) = qb(j, kc, 3) + scale*tmp9b
            scaleb = scaleb + q(j, kc, 3)*tmp9b
            CALL POPREAL8(q(j, k, 2))
            tmp8b = qb(j, k, 2)
            qb(j, k, 2) = 0.0
            qb(j, kc, 2) = qb(j, kc, 2) + scale*tmp8b
            scaleb = scaleb + q(j, kc, 2)*tmp8b
            CALL POPREAL8(q(j, k, 1))
            tmp7b = qb(j, k, 1)
            qb(j, k, 1) = 0.0
            qb(j, kc, 1) = qb(j, kc, 1) + scale*tmp7b
            scaleb = scaleb + q(j, kc, 1)*tmp7b
            CALL POPREAL8(scale)
            tempb1 = scaleb/q(j, k, nq)
            qb(j, kc, nq) = qb(j, kc, nq) + tempb1
            qb(j, k, nq) = qb(j, k, nq) - q(j, kc, nq)*tempb1/q(j, k, nq
     +        )
          ENDDO
          CALL POPINTEGER4(kc)
        ENDDO
      ELSE IF (idir .EQ. -2) THEN
C
        kk = ke - ks + 1
        DO k=ks,ke
          kk1 = ke - k + 1
          CALL PUSHINTEGER4(kc)
          kc = 1 + 2*kk - kk1
          DO j=js,je
            CALL PUSHREAL8(scale)
            scale = q(j, kc, nq)/q(j, k, nq)
            tmp11 = q(j, kc, 1)*scale
            CALL PUSHREAL8(q(j, k, 1))
            q(j, k, 1) = tmp11
            tmp12 = q(j, kc, 2)*scale
            CALL PUSHREAL8(q(j, k, 2))
            q(j, k, 2) = tmp12
            tmp13 = q(j, kc, 3)*scale
            CALL PUSHREAL8(q(j, k, 3))
            q(j, k, 3) = tmp13
            tmp14 = q(j, kc, 4)*scale
            CALL PUSHREAL8(q(j, k, 4))
            q(j, k, 4) = tmp14
          ENDDO
        ENDDO
        DO k=ke,ks,-1
          DO j=je,js,-1
            CALL POPREAL8(q(j, k, 4))
            tmp14b = qb(j, k, 4)
            qb(j, k, 4) = 0.0
            qb(j, kc, 4) = qb(j, kc, 4) + scale*tmp14b
            scaleb = q(j, kc, 4)*tmp14b
            CALL POPREAL8(q(j, k, 3))
            tmp13b = qb(j, k, 3)
            qb(j, k, 3) = 0.0
            qb(j, kc, 3) = qb(j, kc, 3) + scale*tmp13b
            scaleb = scaleb + q(j, kc, 3)*tmp13b
            CALL POPREAL8(q(j, k, 2))
            tmp12b = qb(j, k, 2)
            qb(j, k, 2) = 0.0
            qb(j, kc, 2) = qb(j, kc, 2) + scale*tmp12b
            scaleb = scaleb + q(j, kc, 2)*tmp12b
            CALL POPREAL8(q(j, k, 1))
            tmp11b = qb(j, k, 1)
            qb(j, k, 1) = 0.0
            qb(j, kc, 1) = qb(j, kc, 1) + scale*tmp11b
            scaleb = scaleb + q(j, kc, 1)*tmp11b
            CALL POPREAL8(scale)
            tempb2 = scaleb/q(j, k, nq)
            qb(j, kc, nq) = qb(j, kc, nq) + tempb2
            qb(j, k, nq) = qb(j, k, nq) - q(j, kc, nq)*tempb2/q(j, k, nq
     +        )
          ENDDO
          CALL POPINTEGER4(kc)
        ENDDO
      END IF
      END
