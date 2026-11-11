CLASS lhc_ZR_SPAC113_STOCK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Stock RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Stock RESULT result.
    METHODS validateamount FOR VALIDATE ON SAVE
      keys FOR Stock~validateamount.
    METHODS precheck_create FOR PRECHECK
      entities FOR CREATE Stock.

ENDCLASS.

CLASS lhc_ZR_SPAC113_STOCK IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateAmount.
    READ ENTITIES OF zr_spac113_stock IN LOCAL MODE
      ENTITY Stock
        FIELDS ( Amount ) WITH CORRESPONDING #( keys )
      RESULT DATA(stocks).

    LOOP AT stocks INTO DATA(stock).
      APPEND VALUE #( %tky = stock-%tky %state_area = 'VALIDATE_AMOUNT' )
        TO reported-Stock.

      IF stock-Amount < 0.
        APPEND VALUE #( %tky = stock-%tky ) TO failed-Stock.
        APPEND VALUE #( %tky        = stock-%tky
                      %state_area = 'VALIDATE_AMOUNT'
                      %msg        = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-error
                                      text     = 'Amount cannot be negative' )
                      %element-Amount = if_abap_behv=>mk-on )
          TO reported-Stock.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD precheck_create.
    LOOP AT entities INTO DATA(entity).

      " existing active row?
      SELECT SINGLE @abap_true FROM zspac113_stock
        WHERE warehouse_id = @entity-WarehouseId
          AND product_id   = @entity-ProductId
        INTO @DATA(exists).

      " or someone's open draft for the same pair?
      IF sy-subrc <> 0.
        SELECT SINGLE @abap_true FROM zspac113_stock_d
          WHERE warehouseid = @entity-WarehouseId
            AND productid   = @entity-ProductId
          INTO @exists.
      ENDIF.

      IF sy-subrc = 0.
        APPEND VALUE #( %cid      = entity-%cid
                        %key      = entity-%key
                        %is_draft = entity-%is_draft )
          TO failed-Stock.

        APPEND VALUE #( %cid      = entity-%cid
                        %key      = entity-%key
                        %is_draft = entity-%is_draft
                        %msg      = new_message_with_text(
                                      severity = if_abap_behv_message=>severity-error
                                      text     = 'Warehouse already has stock of this product' )
                        %element-WarehouseId = if_abap_behv=>mk-on )
          TO reported-Stock.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
