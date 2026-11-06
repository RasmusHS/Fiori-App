@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product Data Definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC113_PRODUCT 
  as select from zspac113_product
{
  @EndUserText.label: 'Product ID'
  key product_id as ProductId,
  
  @EndUserText.label: 'Name'
  prod_name as ProductName,
  
  @EndUserText.label: 'Description'
  prod_description as ProductDescription,
  
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
