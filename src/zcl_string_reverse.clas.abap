CLASS zcl_string_reverse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS reverse_string
      IMPORTING
        !iv_string       TYPE string
      RETURNING
        VALUE(rv_string) TYPE string .

    CLASS-METHODS build_in_reverse
      IMPORTING
        !iv_string TYPE string
      RETURNING
        VALUE(rv_string) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_STRING_REVERSE IMPLEMENTATION.


  METHOD reverse_string.
    IF iv_string IS INITIAL. RETURN. ENDIF.
    DATA lv_result TYPE string.
    DO strlen( iv_string ) TIMES.
      DATA(lv_current_char) = substring( val = iv_string off = strlen( iv_string ) - sy-index len = 1 ).
      lv_result = lv_result && lv_current_char.
    ENDDO.
      rv_string = lv_result.
    ENDMETHOD.


  METHOD build_in_reverse.
    rv_string = REVERSE( iv_string ).
  ENDMETHOD.
ENDCLASS.
