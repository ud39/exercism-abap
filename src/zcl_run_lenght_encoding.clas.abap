CLASS zcl_run_lenght_encoding DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: encode IMPORTING iv_code        TYPE string
                    RETURNING VALUE(rv_code) TYPE string,
      decode IMPORTING iv_code        TYPE string
             RETURNING VALUE(rv_code) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RUN_LENGHT_ENCODING IMPLEMENTATION.


  METHOD decode.
  ENDMETHOD.


  METHOD encode.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
