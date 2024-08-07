CLASS zcl_itab_basic DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab RETURNING VALUE(rt_itab) TYPE itab_data_type.

    METHODS add_to_itab IMPORTING is_itab        TYPE initial_type
                        CHANGING  ct_itab        TYPE itab_data_type
                        RETURNING VALUE(rt_itab) TYPE itab_data_type.

    METHODS sort_itab CHANGING it_itab TYPE itab_data_type.

    METHODS search_itab IMPORTING it_itab         TYPE itab_data_type
                        RETURNING VALUE(rv_index) TYPE i.

ENDCLASS.


CLASS zcl_itab_basic IMPLEMENTATION.
  METHOD add_to_itab.
    APPEND is_itab TO ct_itab.
    rt_itab = ct_itab.
  ENDMETHOD.

  METHOD fill_itab.
    rt_itab = VALUE #( ( group = 'A' number = 10 description = 'Group A-2' )
                       ( group = 'B' number = 5  description = 'Group B' )
                       ( group = 'A' number = 6  description = 'Group A-1' )
                       ( group = 'C' number = 22 description = 'Group C-1' )
                       ( group = 'A' number = 13 description = 'Group A-3' )
                       ( group = 'C' number = 500 description = 'Group C-2' ) ).
  ENDMETHOD.

  METHOD sort_itab.
    SORT it_itab BY group
                    number DESCENDING.
  ENDMETHOD.

  METHOD search_itab.
    rv_index = line_index( it_itab[ number = 6 ] ).
  ENDMETHOD.
ENDCLASS.
