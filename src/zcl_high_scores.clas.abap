class ZCL_HIGH_SCORES definition
  public
  final
  create public .

public section.
  TYPES score_itab TYPE STANDARD TABLE OF i WITH EMPTY KEY.

  METHODS get_highest_score IMPORTING it_score_list TYPE score_itab
                            RETURNING VALUE(iv_score) TYPE i.

  METHODS get_top_three_score IMPORTING it_score_list TYPE score_itab
                              RETURNING VALUE(it_top_three) TYPE score_itab.

  METHODS get_newest_score IMPORTING it_score_list TYPE score_itab
                           RETURNING VALUE(iv_score) TYPE i.

  METHODS fill_score_list RETURNING VALUE(it_score_list) TYPE score_itab.

protected section.
private section.
ENDCLASS.



CLASS ZCL_HIGH_SCORES IMPLEMENTATION.


  METHOD fill_score_list.
  ENDMETHOD.


  METHOD get_highest_score.
  ENDMETHOD.


  METHOD get_newest_score.
  ENDMETHOD.


  METHOD get_top_three_score.
  ENDMETHOD.
ENDCLASS.
