CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS get_nth_prime IMPORTING iv_nth_prime_number        TYPE i
                          RETURNING VALUE(rv_nth_prime_number) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_NTH_PRIME IMPLEMENTATION.


  METHOD get_nth_prime.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
