CLASS /mbtools/cl_tool_bc_test DEFINITION
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

    INTERFACES /mbtools/if_tool.

    CONSTANTS:
      BEGIN OF c_tool,
        version      TYPE string VALUE '1.0.0' ##NO_TEXT,
        title        TYPE string VALUE 'MBT Test Tool' ##NO_TEXT,
        description  TYPE string VALUE 'Test for Marc Bernard Tools' ##NO_TEXT,
        bundle_id    TYPE i VALUE 1,
        download_id  TYPE i VALUE 9999,
        has_launch   TYPE abap_bool VALUE abap_true,
        mbt_command  TYPE string VALUE 'T',
        mbt_shortcut TYPE string VALUE 'TEST',
      END OF c_tool.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS /mbtools/cl_tool_bc_test IMPLEMENTATION.


  METHOD /mbtools/if_tool~install.
    " Perform setup that was not included in installation
    /mbtools/cl_logger_factory=>create_log(
      object    = '/MBTOOLS/'
      subobject = 'EDD' )->i( 'Test install' ).
  ENDMETHOD.


  METHOD /mbtools/if_tool~launch.
    /mbtools/cl_logger_factory=>create_log(
      object    = '/MBTOOLS/'
      subobject = 'EDD' )->i( 'Test run' ).

    /mbtools/cl_sap=>run_program( '/MBTOOLS/MBT_TEST' ).
  ENDMETHOD.


  METHOD /mbtools/if_tool~title.
    rv_title = c_tool-title.
  ENDMETHOD.


  METHOD /mbtools/if_tool~tool.
    MOVE-CORRESPONDING c_tool TO rs_tool.
  ENDMETHOD.


  METHOD /mbtools/if_tool~uninstall.
    /mbtools/cl_logger_factory=>create_log(
      object    = '/MBTOOLS/'
      subobject = 'EDD' )->i( 'Test uninstall' ).
  ENDMETHOD.
ENDCLASS.
