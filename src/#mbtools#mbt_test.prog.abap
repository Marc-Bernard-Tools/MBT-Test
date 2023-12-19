REPORT /mbtools/mbt_test.
************************************************************************
* MBT Test
*
* Copyright 2023 Marc Bernard <https://marcbernardtools.com/>
* SPDX-License-Identifier: GPL-3.0-only
************************************************************************

TABLES sscrfields.

*-----------------------------------------------------------------------

* Main
SELECTION-SCREEN:
BEGIN OF SCREEN 200 AS SUBSCREEN,
BEGIN OF BLOCK b200 WITH FRAME,
COMMENT /1(77) sc_t200,
COMMENT /1(77) sc_t201,
END OF BLOCK b200,
BEGIN OF BLOCK b210 WITH FRAME.
PARAMETERS p_test AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN:
END OF BLOCK b210,
END OF SCREEN 200.

*-----------------------------------------------------------------------

* About
SELECTION-SCREEN:
BEGIN OF SCREEN 900 AS SUBSCREEN,
BEGIN OF BLOCK b900 WITH FRAME,
COMMENT /1(50) sc_t900,
COMMENT 60(25) sc_t901,
SKIP,
COMMENT /1(77) sc_t902,
END OF BLOCK b900,
BEGIN OF BLOCK b910 WITH FRAME,
PUSHBUTTON /1(55) sc_docu USER-COMMAND docu,
SKIP,
PUSHBUTTON /1(55) sc_tool USER-COMMAND tool,
SKIP,
PUSHBUTTON /1(55) sc_lice USER-COMMAND lice,
SKIP,
PUSHBUTTON /1(55) sc_home USER-COMMAND home,
END OF BLOCK b910,
END OF SCREEN 900.

*-----------------------------------------------------------------------

* Header
SELECTION-SCREEN:
BEGIN OF BLOCK sc_header,
SKIP,
SKIP,
COMMENT /3(77) sc_t001 FOR FIELD p_test,
SKIP,
END OF BLOCK sc_header,
BEGIN OF TABBED BLOCK sc_tab FOR 22 LINES,
TAB (40) sc_tab2 USER-COMMAND sc_push2 DEFAULT SCREEN 200,
TAB (40) sc_tab9 USER-COMMAND sc_push9 DEFAULT SCREEN 900,
END OF BLOCK sc_tab.

*-----------------------------------------------------------------------

CONSTANTS:
  c_title TYPE string VALUE /mbtools/cl_tool_bc_test=>c_tool-title.

DATA:
  ok_code TYPE sy-ucomm,
  tool    TYPE REF TO /mbtools/cl_tool,
  screen  TYPE REF TO /mbtools/cl_screen,
  app     TYPE REF TO /mbtools/cl_test.

*-----------------------------------------------------------------------

MODULE pbo_100 OUTPUT.

  screen->banner( abap_false ).

  app->pbo( ).

ENDMODULE.

MODULE pai_100 INPUT.

  app->pai( CHANGING cv_ok_code = ok_code ).

ENDMODULE.

INITIALIZATION.

  IF /mbtools/cl_switches=>is_active( c_title ) = abap_false.
    MESSAGE e004(/mbtools/bc) WITH c_title.
    RETURN.
  ENDIF.

  CREATE OBJECT app.

  tool   = /mbtools/cl_tool_manager=>factory( c_title ).
  screen = /mbtools/cl_screen=>factory( c_title ).

  screen->init(
    IMPORTING
      ev_text      = sc_t001
      ev_about     = sc_tab9
      ev_title     = sc_t900
      ev_version   = sc_t901
      ev_copyright = sc_t902
      ev_docu      = sc_docu
      ev_tool      = sc_tool
      ev_home      = sc_home
      ev_lice      = sc_lice ).

  sc_tab2 = screen->header(
    iv_icon = icon_color
    iv_text = 'Test' ).

  sc_t200 = 'This tool does nothing but test the core MBT'.
  sc_t201 = 'features'.

*-----------------------------------------------------------------------

AT SELECTION-SCREEN.

  app->screen( ).

  screen->ucomm( sscrfields-ucomm ).

*-----------------------------------------------------------------------

AT SELECTION-SCREEN OUTPUT.

  screen->banner( ).

  app->screen( ).

*-----------------------------------------------------------------------

START-OF-SELECTION.

  LOG-POINT ID /mbtools/bc SUBKEY c_title FIELDS sy-datum sy-uzeit sy-uname.

  " Setup tree
  app->initialize( p_test ).
