@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SPAC113_WH
  provider contract transactional_query
  as projection on ZR_SPAC113_WH
{
  @EndUserText.label: 'Warehouse ID'
  @ObjectModel.text.element: ['WarehouseId']
  @UI.textArrangement: #TEXT_ONLY
  key WarehouseId,
  
  @EndUserText.label: 'Street'
  Street,
  
  @EndUserText.label: 'Zip Code'
  ZipCode,
  
  @EndUserText.label: 'City'
  City,
  
  @EndUserText.label: 'Warehouse Name'
  WarehouseName,
  
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
}
