/**
 * @author eduardo.bisso - dev-builder
 */
public class PaymentCallbackInboundService {

    PaymentSearcherPayer seacher;

    AccountRepository accountRepository;

    OpportunityRepository opportunityRepository;

    PricebookRepository pricebookRepository;

    AccountPaymentCallbackBuilder accountPaymentCallbackBuilder;

    LeadConverterService leadConverterService;

    OpportunityPaymentCallbackBuilder opportunityPaymentCalbackBuilder;
  
    public PaymentCallbackInboundService() {

        this.seacher = new PaymentSearcherPayer();
        this.accountRepository = new AccountRepository();
        this.opportunityRepository = new opportunityRepository();
        this.pricebookRepository = new PricebookRepository();
        this.accountPaymentCallbackBuilder = new AccountPaymentCallbackBuilder();
        this.leadConverterService = new leadConverterService();
        this.opportunityPaymentCalbackBuilder = new OpportunityPaymentCallbackBuilder();

    }

    public PaymentCallbackResponse processPayment ( PaymentCallbackInbound payment ) {

        List<List<SObject>> payers = seacher.search(payment?.payer?.document);

        List<Account> accounts = payers.get(0);

        List<Lead> leads = payers.get(1);

        Account account;

        PaymentCallbackInbound.Payer payer = payment?.payer;

        if(accounts.isEmpty() && leads.isEmpty()) {

            account = accountPaymentCallbackBuilder.toAccount(payment);

            accountRepository.save(account);

        }

        if(accounts.isEmpty() && !leads.isEmpty()) {

            Database.LeadConvertResult convertResult = this.leadConverterService.convertWithoutOpportunity( leads.get(0) );

            account = new Account( Id = convertResult.getAccountId());

        }

        if (!accounts.isEmpty()) {
            
            account = accounts.get(0);

        }

        Pricebook2 pricebook = this.pricebookRepository.findByname('Campanha DevBuilder');

        Opportunity opportunity = opportunityPaymentCalbackBuilder.toOpportunity(payment, pricebook, account);

        opportunityRepository.save(opportunity);
        
        return new PaymentCallbackResponse(opportunity.Id); //new PaymentCallbackResponse(opportunity.Id)
    }
    
}