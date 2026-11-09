@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Stock Data Definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC113_STOCK 
  as select from zspac113_stock
  association [1..1] to zspac113_product as _Product on $projection.ProductId = _Product.product_id
  association [1..1] to zspac113_wh as _Warehouse on $projection.WarehouseId = _Warehouse.warehouse_id
  //composition of target_data_source_name as _association_name
{
  @EndUserText.label: 'Warehouse ID'
  key warehouse_id as WarehouseId,
  @EndUserText.label: 'Product ID'
  key product_id as ProductId,
  amount as Amount,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
  
  _Product,
  _Warehouse
}
