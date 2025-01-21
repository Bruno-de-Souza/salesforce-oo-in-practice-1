/**
 * @author eduardo.bisso - dev-builder
 */
public class PaymentCallbackInboundService {

    PaymentSearcherPayer seacher;

    AccountRepository accountRepository;

    OpportunityRepository opportunityRepository;

    PricebookRepository pricebookRepository;
  
    public PaymentCallbackInboundService() {

        this.seacher = new PaymentSearcherPayer();
        this.accountRepository = new AccountRepository();
        this.opportunityRepository = new opportunityRepository();
        this.pricebookRepository = new PricebookRepository();

    }

    public PaymentCallbackResponse processPayment ( PaymentCallbackInbound payment ) {

        List<List<SObject>> payers = seacher.search(payment?.payer?.document);

        List<Account> accounts = payers.get(0);

        List<Lead> leads = payers.get(1);

        Account account;

        PaymentCallbackInbound.Payer payer = payment?.payer;

        if(accounts.isEmpty() && leads.isEmpty()) {

            account = new Account(
    
                DocumentNumber__c = payer.document,    
                Name = payer.name,
                AccountSource = 'Campanha DevBuilder',
                BillingStreet = payer?.billing?.street,
                BillingCity = payer?.billing?.city,
                BillingState = payer?.billing?.state,
                BillingPostalCode = payer?.billing?.zipCode,
                BillingCountry = payer?.billing?.country

            );

            accountRepository.save(account);

        }

        if(accounts.isEmpty() && !leads.isEmpty()) {


        }

        if (!accounts.isEmpty()) {
            

        }

        Pricebook2 pricebook = this.pricebookRepository.findByname('Campanha DevBuilder');

        Opportunity opportunity = new Opportunity (

            AccountId = account.Id,
            Name = payment?.payer?.name,
            Pricebook2Id = pricebook.Id,
            CloseDate = Date.today(),
            StageName = 'Closed Won',
            LeadSource = 'Campanha DevBuilder'

        );

        opportunityRepository.save(opportunity);
        
        return new PaymentCallbackResponse(opportunity.Id); //new PaymentCallbackResponse(opportunity.Id)
    }
    
}