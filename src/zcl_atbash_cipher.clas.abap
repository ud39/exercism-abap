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
ENDCLASS.



CLASS ZCL_ATBASH_CIPHER IMPLEMENTATION.


  METHOD decoded_message.
  ENDMETHOD.


  METHOD encoded_message.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
