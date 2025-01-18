/**
 * @author bruno.moreira
 */
@isTest (isParallel=true)
public class PromotionServiceTest {
    
    @isTest
    public static void shouldReturnOldPromotion () {

        Map<String, SObject> records = PromotionalProductFixtureFactory.createIntegratedScenarioWithMultiplePromotions ();

        Product2 product = (Product2) records.get('product');

        PromotionalProduct__c expectedPromotionProduct = (PromotionalProduct__c) records.get('promotionalProduct');

        PromotionService promotionalService = new PromotionService();

        Test.startTest();

        List<PromotionalProduct> promotionalProducts = promotionalService.findPromotionalProducts(new List<String> {product.Id});

        Test.stopTest();

        Assert.isFalse(promotionalProducts.isEmpty());

        Assert.areEqual(expectedPromotionProduct.Discount__c, promotionalProducts.get(0).discount);

        Assert.areEqual(expectedPromotionProduct.Id, promotionalProducts.get(0).promotionalProductId);

    }

}