/**
 * @author bruno.moreira
 */
public class AccountRepository {
    
    public Account save (Account account) {

        upsert account;
        return account;

    } 

}