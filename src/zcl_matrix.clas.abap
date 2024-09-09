CLASS zcl_matrix DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES it_int TYPE STANDARD TABLE OF i WITH EMPTY KEY.
    INTERFACES: zif_gjb_display.
    METHODS: get_columns IMPORTING iv_matrix            TYPE string
                                   iv_index             TYPE i
                         RETURNING VALUE(rv_col_matrix) TYPE it_int,
      get_rows    IMPORTING iv_matrix            TYPE string
                            iv_index             TYPE i
                  RETURNING VALUE(rv_row_matrix) TYPE it_int.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MATRIX IMPLEMENTATION.


  METHOD get_columns.
    SPLIT iv_matrix AT '/n' INTO TABLE DATA(lt_matrix).
    LOOP AT lt_matrix ASSIGNING FIELD-SYMBOL(<fs_string>).
      SPLIT <fs_string> AT space INTO TABLE DATA(lt_column).
      READ TABLE lt_column ASSIGNING FIELD-SYMBOL(<fs_column>) INDEX iv_index.
      APPEND <fs_column> TO rv_col_matrix.
    ENDLOOP.
  ENDMETHOD.


  METHOD get_rows.
    SPLIT iv_matrix AT '\n' INTO TABLE DATA(lt_matrix).
    READ TABLE lt_matrix ASSIGNING FIELD-SYMBOL(<fs_col>) INDEX iv_index.
    SPLIT <fs_col> AT space INTO TABLE DATA(lt_result).
    LOOP AT lt_result ASSIGNING FIELD-SYMBOL(<fs_result>).
      APPEND <fs_result> TO rv_row_matrix.
    ENDLOOP.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
