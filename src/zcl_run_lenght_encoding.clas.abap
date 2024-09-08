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
    DATA(lv_length_code) = strlen( iv_code ).
    DATA lv_current_char TYPE string.
    DATA lv_current_count TYPE i.
    DO lv_length_code TIMES.
      IF lv_current_char IS INITIAL.
        lv_current_char = substring( val = iv_code off = sy-index - 1 len = 1 ).
      ENDIF.
      IF lv_current_char <> substring( val = iv_code off = sy-index - 1 len = 1 ).
        rv_code = COND #( WHEN lv_current_count = 1
                  THEN rv_code && lv_current_char
                  ELSE rv_code && lv_current_count && lv_current_char ).
        lv_current_char = substring( val = iv_code off = sy-index - 1 len = 1 ).
        lv_current_count = 1.
      ELSE.
        lv_current_count = lv_current_count + 1.
      ENDIF.
    ENDDO.
    rv_code = COND #( WHEN lv_current_count = 1
             THEN rv_code && lv_current_char
             ELSE rv_code && lv_current_count && lv_current_char ).
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.