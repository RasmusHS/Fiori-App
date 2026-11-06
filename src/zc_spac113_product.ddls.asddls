@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SPAC113_PRODUCT 
  provider contract transactional_query
  as projection on ZR_SPAC113_PRODUCT
{
  key ProductId,
  ProductName,
  ProductDescription,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
}
