CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    TYPES: BEGIN OF windows,
             first_row  TYPE char1,
             second_row TYPE char2,
           END OF windows.
    TYPES: windows_internal_table TYPE STANDARD TABLE OF windows WITH DEFAULT KEY.
    METHODS: fill_up_table IMPORTING iv_first_row TYPE string
                                     iv_second_row TYPE string
                           RETURNING VALUE(rt_flowers) TYPE windows_internal_table,
             whos_flowers IMPORTING iv_name TYPE string
                          RETURNING VALUE(rt_name) TYPE windows_internal_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KINDERGARTEN_GARDEN IMPLEMENTATION.


  METHOD fill_up_table.
  ENDMETHOD.


  METHOD whos_flowers.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
