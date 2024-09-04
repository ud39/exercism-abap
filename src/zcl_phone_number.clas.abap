CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS correct_phone_number_nanp IMPORTING iv_phone_number        TYPE string
                                      RETURNING VALUE(rv_phone_number) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PHONE_NUMBER IMPLEMENTATION.


  METHOD correct_phone_number_nanp.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
