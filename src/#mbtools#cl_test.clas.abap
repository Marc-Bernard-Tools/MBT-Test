CLASS /mbtools/cl_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

************************************************************************
* MBT Test Tool
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
      MESSAGE 'Test ON' TYPE 'I'.
    ELSE.
      MESSAGE 'Test OFF' TYPE 'I'.
    ENDIF.
  ENDMETHOD.


  METHOD pai.
    CLEAR cv_ok_code.
  ENDMETHOD.


  METHOD pbo.
  ENDMETHOD.


  METHOD screen.
  ENDMETHOD.
ENDCLASS.
