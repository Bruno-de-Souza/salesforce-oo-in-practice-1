/**
 * @author eduardo.bisso - dev-builder
 */
public class PaymentCallbackInboundService {

    PaymentSearcherPayer seacher;

    CreateOpportutityCallbackFactory factory;
  
    public PaymentCallbackInboundService() {

        this.seacher = new PaymentSearcherPayer();
        this.factory = new CreateOpportutityCallbackFactory();

    }

    public PaymentCallbackResponse processPayment ( PaymentCallbackInbound payment ) {

        List<List<SObject>> payers = seacher.search(payment?.payer?.document);

        BaseCreateOpportunityCallback callbackService = this.factory.getStrategy(payers);

        Opportunity opportunity = callbackService.createOpportunity(payment);
        
        return new PaymentCallbackResponse(opportunity.Id);
    }
    
}