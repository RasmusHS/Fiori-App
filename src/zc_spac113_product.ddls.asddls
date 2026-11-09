@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Projection View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_SPAC113_PRODUCT 
  provider contract transactional_query
  as projection on ZR_SPAC113_PRODUCT
{
  @EndUserText.label: 'Product ID'
  @ObjectModel.text.element: ['ProductId']
  @UI.textArrangement: #TEXT_ONLY
  key ProductId,
  @EndUserText.label: 'Product Name'
  ProductName,
  @EndUserText.label: 'Product Description'
  ProductDescription,
  LocalCreatedBy,
  LocalCreatedAt,
  LocalLastChangedBy,
  LocalLastChangedAt,
  LastChangedAt
}
