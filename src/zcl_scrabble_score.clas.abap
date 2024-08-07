CLASS zcl_scrabble_score DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS calc_scrabble_score
      IMPORTING
        !iv_word                 TYPE string OPTIONAL
      RETURNING
        VALUE(rv_scrabble_score) TYPE i .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SCRABBLE_SCORE IMPLEMENTATION.


  METHOD calc_scrabble_score.
    DATA(lv_result) = 0.

    DO strlen( iv_word ) TIMES.
      DATA(lv_current_char) = to_upper( substring( val = iv_word off = sy-index - 1 len = 1 ) ).
      DATA(lv_value_of_char) = COND #(
        WHEN lv_current_char CA 'AEIOULNRST' THEN 1
        WHEN lv_current_char CA 'DG' THEN 2
        WHEN lv_current_char CA 'BCMP' THEN 3
        WHEN lv_current_char CA 'FHVWY' THEN 4
        WHEN lv_current_char CA 'K' THEN 5
        WHEN lv_current_char CA 'JX' THEN 8
        WHEN lv_current_char CA 'QZ' THEN 10
        ELSE 0
      ).
      lv_result = lv_result + lv_value_of_char.
    ENDDO.
    rv_scrabble_score = lv_result.
  ENDMETHOD.
ENDCLASS.
