@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SPAC113_STOCK
  provider contract transactional_query as projection on ZR_SPAC113_STOCK
{
  @EndUserText.label: 'Warehouse'
  @ObjectModel.text.element: ['WarehouseName']
  @UI.textArrangement: #TEXT_ONLY
  key WarehouseId,
  
  @EndUserText.label: 'Product'
  @ObjectModel.text.element: ['ProductName']
  @UI.textArrangement: #TEXT_ONLY
  key ProductId,
  Amount,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt,
  
  _Product.prod_name as ProductName,
  _Product.prod_description as ProductDescription,
  
  _Warehouse.street as WarehouseStreet,
  _Warehouse.zip_code as WarehouseZipCode,
  _Warehouse.city as WarehouseCity,
  _Warehouse.name as WarehouseName
}
