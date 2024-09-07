CLASS zcl_anagramm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: get_anagram IMPORTING iv_word          TYPE string
                                   it_list_of_words TYPE REF TO stringtab
                         RETURNING VALUE(rv_anagramm) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ANAGRAMM IMPLEMENTATION.


  METHOD get_anagram.

  ENDMETHOD.


  METHOD zif_gjb_display~display.

  ENDMETHOD.
ENDCLASS.
