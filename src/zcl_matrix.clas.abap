class ZCL_MATRIX definition
  public
  final
  create public .

public section.
  INTERFACES: zif_gjb_display.
  METHODS: get_columns IMPORTING iv_matrix TYPE string
                       RETURNING VALUE(rv_col_matrix) TYPE string,
           get_rows    IMPORTING iv_matrix TYPE string
                       RETURNING VALUE(rv_row_matrix) TYPE string.
protected section.
private section.
ENDCLASS.



CLASS ZCL_MATRIX IMPLEMENTATION.


  METHOD get_columns.
  ENDMETHOD.


  METHOD get_rows.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
