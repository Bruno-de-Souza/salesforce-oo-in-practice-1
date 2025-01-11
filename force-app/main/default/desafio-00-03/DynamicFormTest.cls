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

        QuestionForm shortText = new QuestionForm(QuestionFormType.SHORT_TEXT);

        shortText.title = 'Short Text test 01';
        forms.questions.add(shortText);

        Assert.areEqual(QuestionFormType.SHORT_TEXT, shortText.type);

        QuestionForm paragraph = new QuestionForm(QuestionFormType.PARAGRAPH);

        paragraph.title = 'Paragraph Test 01';
        forms.questions.add(paragraph);

        Assert.areEqual(QuestionFormType.PARAGRAPH , paragraph.type);

    }

}