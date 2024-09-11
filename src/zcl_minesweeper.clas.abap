class ZCL_MINESWEEPER definition
  public
  final
  create public .

public section.
  INTERFACES: zif_gjb_display.
  METHODS: check_mine     IMPORTING iv_field TYPE string
                          RETURNING VALUE(rv_amount_of_mines) TYPE i,
           display_mine_on_field IMPORTING iv_field TYPE string
                                 RETURNING VALUE(rv_mine_field) TYPE string.
protected section.
private section.
ENDCLASS.



CLASS ZCL_MINESWEEPER IMPLEMENTATION.


  METHOD check_mine.
  ENDMETHOD.


  METHOD display_mine_on_field.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
