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

        QuestionForm shortText = new QuestionFormShortText();
        
        shortText.title = 'Short Text test 01';
        
        forms.questions.add(shortText);
        
        Assert.areEqual(QuestionFormType.SHORT_TEXT, shortText.type);

        QuestionFormParagraph paragraph = new QuestionFormParagraph();
        
        paragraph.title = 'Paragraph Test 01';
        
        forms.questions.add(paragraph);
        
        Assert.areEqual(QuestionFormType.PARAGRAPH , paragraph.type);

        QuestionFormCode codeText = new QuestionFormCode();
        
        codeText.title = 'Code Text Test 01';
        codeText.code = 'public class Hello Bruno {\n \t default String message \n}';

        Assert.areEqual(QuestionFormType.CODE_TEXT, codeText.type);
        Assert.isNotNull(codeText.code);

        forms.questions.add(codeText);
        
        Assert.areEqual(3, forms.questions.size());

        QuestionFormLinearScale linearScore = new QuestionFormLinearScale();
        
        linearScore.title = 'Linear Scale Test 01'; 
        linearScore.scales.add(new QuestionFormScales(0, 'Insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(1, 'Um cadin insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(2, 'Satisfeito'));
        linearScore.scales.add(new QuestionFormScales(3, 'Satisfeito mais um cadim'));
        linearScore.scales.add(new QuestionFormScales(4, 'Super mega satisfeito'));
        
        forms.questions.add(linearScore);

        Assert.areEqual(QuestionFormType.LINEAR_SCALE, linearScore.type);
        
        Assert.areEqual(5, linearScore.scales.size());

        QuestionFormMultipleChoice multipleChoice = new QuestionFormMultipleChoice();
        
        multipleChoice.title = 'Multiple Choice Test 01';
        multipleChoice.options.add(new QuestionFormOptions('Desconheço'));
        multipleChoice.options.add(new QuestionFormOptions('Conheço'));
        multipleChoice.options.add(new QuestionFormOptions('Pratico'));
        multipleChoice.options.add(new QuestionFormOptions('Domino'));
        
        forms.questions.add(multipleChoice);
        
        Assert.areEqual(QuestionFormType.MULTIPLE_CHOICE, multipleChoice.type);
        
        Assert.areEqual(4, multipleChoice.options.size());

        QuestionFormMultipleChoiceGrid multipleChoiceGrid = new QuestionFormMultipleChoiceGrid();
        
        multipleChoiceGrid.title = 'Multiple Choice Grid Test 01';

        multipleChoiceGrid.rows.add(new QuestionFormOptions('Classe abstrata'));
        multipleChoiceGrid.rows.add(new QuestionFormOptions('Sobrecarga'));
        multipleChoiceGrid.rows.add(new QuestionFormOptions('Sobrescrita'));
        multipleChoiceGrid.rows.add(new QuestionFormOptions('Polimosfismo'));
        multipleChoiceGrid.rows.add(new QuestionFormOptions('Herança'));

        multipleChoiceGrid.options.add(new QuestionFormOptions('Desconhenço'));
        multipleChoiceGrid.options.add(new QuestionFormOptions('Conheço'));
        multipleChoiceGrid.options.add(new QuestionFormOptions('Pratico'));
        multipleChoiceGrid.options.add(new QuestionFormOptions('Domino'));

        forms.questions.add(multipleChoiceGrid);

        Assert.areEqual(QuestionFormType.MULTIPLE_CHOICE_GRID, multipleChoiceGrid.type);
        
        Assert.areEqual(4, multipleChoiceGrid.options.size());

        Assert.areEqual(5, multipleChoiceGrid.rows.size());
        
        Assert.areEqual(6, forms.questions.size());

        System.debug( forms );

    }

}