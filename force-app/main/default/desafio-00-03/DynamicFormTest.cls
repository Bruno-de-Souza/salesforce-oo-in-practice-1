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

        QuestionForm codeText = new QuestionForm(QuestionFormType.CODE_TEXT);
        codeText.title = 'Code Text Test 01';
        codeText.code = 'public class Hello Bruno {\n \t default String message \n}';

        forms.questions.add(codeText);

        Assert.areEqual(3, forms.questions.size());

        QuestionForm linearScore = new QuestionForm(QuestionFormType.LINEAR_SCALE);

        linearScore.title = 'Linear Scale Test 01'; 
        linearScore.scales.add(new QuestionFormScales(0, 'Insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(1, 'Um cadin insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(2, 'Satisfeito'));
        linearScore.scales.add(new QuestionFormScales(3, 'Satisfeito mais um cadim'));
        linearScore.scales.add(new QuestionFormScales(4, 'Super mega satisfeito'));

        forms.questions.add(linearScore);

        Assert.areEqual(QuestionFormType.LINEAR_SCALE, linearScore.type);
        Assert.areEqual(5, linearScore.scales.size());

        QuestionForm multipleChoice = new QuestionForm(QuestionFormType.MULTIPLE_CHOICE);
        multipleChoice.title = 'Multiple Choice Test 01';
        multipleChoice.options.add(new QuestionFormOptions('Desconheço'));
        multipleChoice.options.add(new QuestionFormOptions('Conheço'));
        multipleChoice.options.add(new QuestionFormOptions('Pratico'));
        multipleChoice.options.add(new QuestionFormOptions('Domino'));

        forms.questions.add(multipleChoice);

        Assert.areEqual(QuestionFormType.MULTIPLE_CHOICE, multipleChoice.type);
        Assert.areEqual(4, multipleChoice.options.size());

        Assert.areEqual(5, forms.questions.size());

        System.debug('Forms: ' + forms);

    }

}