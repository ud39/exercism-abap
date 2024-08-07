CLASS zcl_itab_aggregation DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF initial_numbers_type,
             group  TYPE group,
             number TYPE i,
           END OF initial_numbers_type,
           initial_numbers TYPE STANDARD TABLE OF initial_numbers_type WITH EMPTY KEY.
    TYPES: BEGIN OF aggregated_data_type,
             group   TYPE group,
             count   TYPE i,
             sum     TYPE i,
             min     TYPE i,
             max     TYPE i,
             average TYPE f,
           END OF aggregated_data_type,
           aggregated_data TYPE STANDARD TABLE OF aggregated_data_type WITH EMPTY KEY.

    METHODS fill_itab
      RETURNING VALUE(rt_itab) TYPE initial_numbers.

    METHODS fill_aggregated_itab
      IMPORTING it_itab                   TYPE initial_numbers
      RETURNING VALUE(rt_aggragated_itab) TYPE aggregated_data.

ENDCLASS.


CLASS zcl_itab_aggregation IMPLEMENTATION.
  METHOD fill_aggregated_itab.
    DATA ls_aggr  TYPE aggregated_data_type.
    DATA lv_group TYPE group.
    DATA lv_count TYPE i.
    DATA lv_sum   TYPE i.
    DATA lv_min   TYPE i.
    DATA lv_max   TYPE i.

    DATA(lt_init_itab) = it_itab.

    IF lines( lt_init_itab ) = 0.
      RETURN.
    ENDIF.

    SORT lt_init_itab BY group.

    LOOP AT lt_init_itab ASSIGNING FIELD-SYMBOL(<fs>).
      IF lv_group <> <fs>-group.
        CLEAR: lv_count,
               lv_sum,
               lv_min,
               lv_max,
               ls_aggr.
      ENDIF.

      lv_group = <fs>-group.
      lv_count += 1.
      lv_sum += <fs>-number.

      IF lv_max IS INITIAL OR <fs>-number >= lv_max.
        lv_max = <fs>-number.
      ENDIF.

      IF lv_min IS INITIAL OR <fs>-number <= lv_min.
        lv_min = <fs>-number.
      ENDIF.

      ls_aggr-group   = lv_group.
      ls_aggr-count   = lv_count.
      ls_aggr-sum     = lv_sum.
      ls_aggr-max     = lv_max.
      ls_aggr-min     = lv_min.
      ls_aggr-average = lv_sum / lv_count.

      IF lv_count <> 1.
        DELETE rt_aggragated_itab WHERE group = lv_group.
      ENDIF.
      APPEND ls_aggr TO rt_aggragated_itab.

    ENDLOOP.
  ENDMETHOD.

  METHOD fill_itab.
    rt_itab = VALUE #( ( group = 'A' number = 10 )
                       ( group = 'B' number = 5 )
                       ( group = 'A' number = 6 )
                       ( group = 'C' number = 22 )
                       ( group = 'A' number = 13 )
                       ( group = 'C' number = 500 ) ).
  ENDMETHOD.
ENDCLASS.
