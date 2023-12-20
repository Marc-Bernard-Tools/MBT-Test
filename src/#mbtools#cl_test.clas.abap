CLASS /mbtools/cl_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

************************************************************************
* MBT Test Class
*
* Copyright 2023 Marc Bernard <https://marcbernardtools.com/>
* SPDX-License-Identifier: GPL-3.0-only
************************************************************************
  PUBLIC SECTION.

    METHODS initialize
      IMPORTING
        !iv_test TYPE abap_bool.
    METHODS pbo.
    METHODS pai
      CHANGING
        !cv_ok_code TYPE sy-ucomm.
    METHODS screen.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS /mbtools/cl_test IMPLEMENTATION.


  METHOD initialize.
    IF iv_test = abap_true.
      MESSAGE 'Test ON' TYPE 'I' ##NO_TEXT.
    ELSE.
      MESSAGE 'Test OFF' TYPE 'I' ##NO_TEXT.
    ENDIF.
  ENDMETHOD.


  METHOD pai.
    CLEAR cv_ok_code.
  ENDMETHOD.


  METHOD pbo.
    ASSERT 0 = 0.
  ENDMETHOD.


  METHOD screen.
    ASSERT 0 = 0.
  ENDMETHOD.
ENDCLASS.
