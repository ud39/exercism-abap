CLASS zcl_atbash_cipher DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: encoded_message IMPORTING iv_message                TYPE string
                             RETURNING VALUE(rv_encoded_message) TYPE string,
      decoded_message IMPORTING iv_message                TYPE string
                      RETURNING VALUE(rv_decoded_message) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_abcde TYPE string.
ENDCLASS.



CLASS ZCL_ATBASH_CIPHER IMPLEMENTATION.


  METHOD decoded_message.

    DATA(lv_message) = iv_message.
    CONDENSE lv_message NO-GAPS.
    TRANSLATE lv_message TO UPPER CASE.

    DATA(lv_alphabet_length) = strlen( sy-abcde ).
    DATA(lv_msg_length) = strlen( lv_message ).

    DO lv_msg_length TIMES.
      DATA(lv_current_char) = substring( val = lv_message off = sy-index - 1 len = 1 ).
      DATA(lv_index) = find_any_of( val = sy-abcde sub = lv_current_char ).
      DATA(lv_decoded_char_index) = abs( lv_index - lv_alphabet_length ).
      DATA(lv_decoded_char) = substring( val = sy-abcde off = ( lv_decoded_char_index - 1 MOD lv_alphabet_length )  len = 1 ).
      rv_decoded_message = rv_decoded_message && lv_decoded_char.
    ENDDO.

  ENDMETHOD.


  METHOD encoded_message.
    rv_encoded_message = decoded_message( iv_message = iv_message ).
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF iv_input IS INITIAL. WRITE: ` Input was empty `. ENDIF.
    WRITE: | 'ENCODED_MESSAGE: { encoded_message( iv_input ) } DECODED_MESSAGE: { decoded_message( encoded_message( iv_input ) ) }' |.
  ENDMETHOD.
ENDCLASS.
