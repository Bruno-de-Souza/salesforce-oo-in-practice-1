/**
 * @author bruno.moreira
 */
public with sharing class PricebookRepository {
    
    public Pricebook2 findByname (String name) {

        return [SELECT Id 
                FROM Pricebook2
                WHERE Name = : name
                AND IsActive = true
                LIMIT 1];

    }

}