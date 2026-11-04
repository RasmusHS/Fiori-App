@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Stock Data Definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC113_STOCK 
  as select from zspac113_stock
  //composition of target_data_source_name as _association_name
{
  key warehouse_id as WarehouseId,
  key product_id as ProductId,
  amount as Amount
  //_association_name // Make association public
}
