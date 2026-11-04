@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC113_STOCK
  provider contract transactional_query as projection on ZR_SPAC113_STOCK
{
  key WarehouseId,
  key ProductId,
  Amount
}
