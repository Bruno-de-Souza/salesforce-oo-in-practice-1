/**
 * @author bruno.moreira
 */
public class PaymentSearcherPayer {

    public List<List<SObject>> search ( String payerDocument ) {

        return [FIND :payerDocument 
                IN ALL FIELDS 
                RETURNING Account(Id), Lead(Id)];

    }
    
}