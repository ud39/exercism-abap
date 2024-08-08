CLASS zcl_leap_year DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: check_leap_year IMPORTING iv_year                TYPE i
                             RETURNING VALUE(rv_is_leap_year) TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_LEAP_YEAR IMPLEMENTATION.


  METHOD check_leap_year.
    IF ( iv_year MOD 4 = 0 AND iv_year MOD 100 <> 0 ) OR ( iv_year MOD 400 = 0 ).
      rv_is_leap_year = abap_true.
    ELSE.
      rv_is_leap_year = abap_false.
    ENDIF.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF ( check_leap_year( iv_year = iv_input ) ).
      WRITE | '{ iv_input } is a leap year ' |.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
