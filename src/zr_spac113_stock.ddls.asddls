@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Stock Data Definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC113_STOCK 
  as select from zspac113_stock
  association [1..1] to zspac113_product as _Product on $projection.ProductId = _Product.product_id
  association [1..1] to zspac113_wh as _Warehouse on $projection.WarehouseId = _Warehouse.warehouse_id
  //composition of target_data_source_name as _association_name
{
  key warehouse_id as WarehouseId,
  key product_id as ProductId,
  amount as Amount,
  
  _Product,
  _Warehouse
}
