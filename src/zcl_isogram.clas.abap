CLASS zcl_isogram DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: check_isogram IMPORTING iv_string            TYPE string
                           RETURNING VALUE(rv_is_isogram) TYPE abap_bool.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ISOGRAM IMPLEMENTATION.


  METHOD check_isogram.
    DATA(lv_abcde_dash) = sy-abcde.
    DATA(lv_abcde_len)  = strlen( lv_abcde_dash ).

    DO lv_abcde_len TIMES.
      DATA(lv_current_char) = substring( val = sy-abcde off = sy-index - 1 len = 1 ).
      IF count( val = iv_string sub = substring( val = sy-abcde off = sy-index - 1 len = 1 ) ) > 1.
        RETURN.
      ENDIF.
    ENDDO.

    rv_is_isogram = 'X'.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF check_isogram( iv_input ).
      WRITE: | { iv_input } is a isogram |.
    ELSE.
      WRITE: | { iv_input } is not an isogram |.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
