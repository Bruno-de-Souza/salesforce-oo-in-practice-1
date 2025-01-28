/**
 * @author bruno.moreira
 */
public class AccountPaymentCallbackBuilder {
    
    public Account toAccount (PaymentCallbackInbound callbackInbound) {

        PaymentCallbackInbound.Payer payer = callbackInbound?.payer;

        return new Account(
    
        DocumentNumber__c = payer.document,    
        Name = payer.name,
        AccountSource = 'Campanha DevBuilder',
        BillingStreet = payer?.billing?.street,
        BillingCity = payer?.billing?.city,
        BillingState = payer?.billing?.state,
        BillingPostalCode = payer?.billing?.zipCode,
        BillingCountry = payer?.billing?.country

        );

    }

}