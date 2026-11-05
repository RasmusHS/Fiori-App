@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC113_STOCK
  provider contract transactional_query as projection on ZR_SPAC113_STOCK
{
  @ObjectModel.text.element: ['WarehouseName']
  @UI.textArrangement: #TEXT_ONLY
  key WarehouseId,
  
  @ObjectModel.text.element: ['ProductName']
  @UI.textArrangement: #TEXT_ONLY
  key ProductId,
  Amount,
  
  _Product.prod_name as ProductName,
  _Product.prod_description as ProductDescription,
  
  _Warehouse.street as WarehouseStreet,
  _Warehouse.zip_code as WarehouseZipCode,
  _Warehouse.city as WarehouseCity,
  _Warehouse.name as WarehouseName
}
