class ZCL_HIGH_SCORES definition
  public
  final
  create public .

public section.
  TYPES: BEGIN OF score_list,
         score TYPE i,
         END OF score_list.
  TYPES score_itab TYPE STANDARD TABLE OF score_list WITH EMPTY KEY.

  METHODS get_highest_score IMPORTING it_score_list TYPE score_itab
                            RETURNING VALUE(rv_score) TYPE i.

  METHODS get_top_three_score IMPORTING it_score_list TYPE score_itab
                              RETURNING VALUE(rt_top_three) TYPE score_itab.

  METHODS get_newest_score IMPORTING it_score_list TYPE score_itab
                           RETURNING VALUE(rv_score) TYPE i.

  METHODS fill_score_list RETURNING VALUE(rt_score_list) TYPE score_itab.

protected section.
private section.
ENDCLASS.



CLASS ZCL_HIGH_SCORES IMPLEMENTATION.


  METHOD fill_score_list.
    rt_score_list = VALUE #(
      ( score = 1 )
      ( score = 2 )
      ( score = 3 )
      ( score = 4 )
    ).
  ENDMETHOD.


  METHOD get_highest_score.
    DATA it_temp_score_list TYPE score_itab.
    it_temp_score_list = it_score_list.
    SORT it_temp_score_list BY score DESCENDING.
    rv_score = it_temp_score_list[ 1 ]-score.
  ENDMETHOD.


  METHOD get_newest_score.
    rv_score = it_score_list[ lines( it_score_list ) ]-score.
  ENDMETHOD.


  METHOD get_top_three_score.
    DATA it_temp_score_list TYPE score_itab.
    it_temp_score_list = it_score_list.
    SORT it_temp_score_list BY score DESCENDING.
    DO 3 TIMES.
      APPEND it_temp_score_list[ sy-index ] TO rt_top_three.
    ENDDO.
  ENDMETHOD.
ENDCLASS.
