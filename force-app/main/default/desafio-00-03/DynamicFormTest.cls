/**
 * @author bruno.moreira
 */
@isTest
public class DynamicFormTest {
    
    @isTest
    public static void shoudlCreateDynamicForm() {

        DynamicForm forms = new DynamicForm();
        forms.title = 'Form 01';
        forms.description = 'Form Description 01';
        forms.startDate = Date.today();
        forms.dueDate = Date.today().addDays(7);

    }

}