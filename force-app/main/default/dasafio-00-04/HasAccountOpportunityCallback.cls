/**
 * @author bruno.moreira
 */
public class HasAccountOpportunityCallback extends BaseCreateOpportunityCallback {
    
    override
    public Account buildAccount () {
        return (Account) getPayer();
    }


}