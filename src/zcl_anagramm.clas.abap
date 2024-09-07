CLASS zcl_anagramm DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: get_anagram IMPORTING iv_word          TYPE string
                                   it_list_of_words TYPE stringtab
                         RETURNING VALUE(rv_anagramm) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ANAGRAMM IMPLEMENTATION.


  METHOD get_anagram.
    DATA(lv_length_input_word) = strlen( iv_word ).
    LOOP AT it_list_of_words INTO DATA(lv_word).
      DATA(lv_length_word) = strlen( lv_word ).
      IF lv_length_word <> lv_length_input_word. CONTINUE. ENDIF.

      DO lv_length_word TIMES.
        DATA(lv_current_off) = sy-index - 1.
        DATA(lv_sub) = lv_word+lv_current_off(1).
        IF count( val = iv_word sub = lv_sub ) <> 0.
          rv_anagramm = lv_word.
        ELSE.
          rv_anagramm = ''.
          CONTINUE.
        ENDIF.
      ENDDO.
    ENDLOOP.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
