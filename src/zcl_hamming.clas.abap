CLASS zcl_hamming DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: calc_hamming_distance IMPORTING it_values          TYPE string_table
                                   RETURNING VALUE(rv_distance) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HAMMING IMPLEMENTATION.


  METHOD calc_hamming_distance.
    DATA(lv_first_string) = it_values[ 1 ].
    DATA(lv_second_string) = it_values[ 2 ].
    IF strlen( lv_first_string ) <> strlen( lv_second_string ).
      rv_distance = 0.
      RETURN.
    ENDIF.

    DO strlen( lv_first_string ) TIMES.
      IF substring( val = lv_first_string off = sy-index - 1 len = 1 ) <>
        substring( val = lv_second_string off = sy-index - 1 len = 1 ).
        rv_distance = rv_distance + 1.
      ENDIF.
    ENDDO.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF IV_INPUT IS INITIAL.
      WRITE: 'Input was empty'(000).
    ENDIF.
    WRITE: calc_hamming_distance( it_values = iv_input ).
  ENDMETHOD.
ENDCLASS.
