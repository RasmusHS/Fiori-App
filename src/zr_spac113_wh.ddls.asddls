@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse Data Definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC113_WH 
  as select from zspac113_wh
{
  @EndUserText.label: 'Warehouse ID'
  key warehouse_id as WarehouseId,
  
  @EndUserText.label: 'Street'
  street as Street,
  
  @EndUserText.label: 'Zip Code'
  zip_code as ZipCode,
  
  @EndUserText.label: 'City'
  city as City,
  
  @EndUserText.label: 'Warehouse Name'
  warehouse_name as WarehouseName,
  
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  
  @Semantics.systemDateTime.createdAt: true 
  local_created_at as LocalCreatedAt,
  
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  
  @Semantics.systemDateTime.lastChangedAt: true 
  last_changed_at as LastChangedAt
}
