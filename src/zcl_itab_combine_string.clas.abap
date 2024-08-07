CLASS zcl_itab_combine_string DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF alphatab_type,
             cola TYPE string,
             colb TYPE string,
             colc TYPE string,
           END OF alphatab_type.
    TYPES alphas TYPE STANDARD TABLE OF alphatab_type.
    TYPES: BEGIN OF numtab_type,
             col1 TYPE string,
             col2 TYPE string,
             col3 TYPE string,
           END OF numtab_type.
    TYPES nums TYPE STANDARD TABLE OF numtab_type.
    TYPES: BEGIN OF combined_data_type,
             colx TYPE string,
             coly TYPE string,
             colz TYPE string,
           END OF combined_data_type.
    TYPES combined_data TYPE STANDARD TABLE OF combined_data_type WITH EMPTY KEY.

    METHODS fill_itabs
      EXPORTING et_alphatab TYPE alphas
                et_numtab   TYPE nums.

    METHODS combine_items CHANGING  it_alphatab             TYPE alphas OPTIONAL
                                    it_numtab               TYPE nums   OPTIONAL
                          RETURNING VALUE(rt_combined_data) TYPE combined_data.

    METHODS perform_operation IMPORTING it_alphatab             TYPE alphas OPTIONAL
                                        it_numtab               TYPE nums   OPTIONAL
                              RETURNING VALUE(rt_combined_data) TYPE combined_data.
ENDCLASS.


CLASS zcl_itab_combine_string IMPLEMENTATION.
  METHOD fill_itabs.
    et_alphatab = VALUE #( ( cola = 'A' colb = 'B' colc = 'C'  )
                           ( cola = 'D' colb = 'E' colc = 'F'  )
                           ( cola = 'G' colb = 'H' colc = 'I'  ) ).

    et_numtab = VALUE #( ( col1 = 1 col2 = 2 col3 = 3  )
                         ( col1 = 4 col2 = 5 col3 = 6  )
                         ( col1 = 7 col2 = 8 col3 = 9  ) ).
  ENDMETHOD.

  METHOD combine_items.
    fill_itabs( IMPORTING et_alphatab = it_alphatab
                          et_numtab   = it_numtab ).
    DATA ls_combined_data TYPE combined_data_type.
    DATA ls_numtab        TYPE numtab_type.
    DATA lv_iteration     TYPE i VALUE 1.

    LOOP AT it_alphatab INTO DATA(is_alpha).
      CLEAR ls_combined_data.
      BREAK-POINT.
      ls_numtab = it_numtab[ lv_iteration ].
      BREAK-POINT.
      ls_combined_data-colx = is_alpha-cola && ls_numtab-col1.
      ls_combined_data-coly = is_alpha-colb && ls_numtab-col2.
      ls_combined_data-colz = is_alpha-colc && ls_numtab-col3.
      APPEND ls_combined_data TO rt_combined_data.
      lv_iteration += 1.
    ENDLOOP.
  ENDMETHOD.

  METHOD perform_operation.
    DATA(lv_lines) = lines( it_alphatab ).

    DO lv_lines TIMES.
      rt_combined_data = VALUE #( BASE rt_combined_data
                                  ( colx = | { it_alphatab[ sy-index ]-cola } { it_numtab[ sy-index ]-col1  } |
                                    coly = | { it_alphatab[ sy-index ]-colb } { it_numtab[ sy-index ]-col2  } |
                                    colz = | { it_alphatab[ sy-index ]-colc } { it_numtab[ sy-index ]-col3  } | ) ).
    ENDDO.
  ENDMETHOD.
ENDCLASS.
