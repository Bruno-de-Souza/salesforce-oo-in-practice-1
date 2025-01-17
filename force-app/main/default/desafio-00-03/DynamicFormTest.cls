/**
 * @author bruno.moreira
 */
@isTest
public class DynamicFormTest {
    
    @isTest
    public static void shoudlCreateDynamicForm() {

        DynamicForm forms = new DynamicForm()
                                          .withTitle('Form 01')
                                          .withDescription('Form Description 01')
                                          .withstartDate(Date.today())
                                          .withDueDate(Date.today().addDays(7));

        QuestionForm shortText = new QuestionFormShortText()
                                                        .withTitle('Short Text test 01')
                                                        .withDescription('Short Text Description');
        
        forms.questions.add(shortText);
        
        Assert.areEqual(QuestionFormType.SHORT_TEXT, shortText.type);

        QuestionForm paragraph = new QuestionFormParagraph()
                                                        .withTitle('Paragraph Test 01')
                                                        .withDescription('Paragraph Description');
        
        forms.questions.add(paragraph);
        
        Assert.areEqual(QuestionFormType.PARAGRAPH , paragraph.type);

        QuestionFormCode codeText = (QuestionFormCode) new QuestionFormCode()
                                                                         .withCode('public class Hello Bruno {\n \t default String message \n}')
                                                                         .withTitle('Code Text Test 01')
                                                                         .withDescription('Code Text Description');

        forms.addQuestion(new QuestionFormCode()
                                            .withCode('public class Hello Bruno {\n \t default String message \n}')
                                            .withDescription('Code Text Description')
                                            .withTitle('Code Text Test 01'));                                                 
    
        Assert.areEqual(QuestionFormType.CODE_TEXT, codeText.type);
        Assert.isNotNull(codeText.code);

        forms.questions.add(codeText);
        
        Assert.areEqual(4, forms.questions.size());

        QuestionFormLinearScale linearScore = (QuestionFormLinearScale) new QuestionFormLinearScale()
                                                                                                 .withTitle('Linear Scale Test 01')
                                                                                                 .withDescription('Linear Scale Description');

        linearScore.scales.add(new QuestionFormScales(0, 'Insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(1, 'Um cadin insatisfeito'));
        linearScore.scales.add(new QuestionFormScales(2, 'Satisfeito'));
        linearScore.scales.add(new QuestionFormScales(3, 'Satisfeito mais um cadim'));
        linearScore.scales.add(new QuestionFormScales(4, 'Super mega satisfeito'));
        
        forms.questions.add(linearScore);

        Assert.areEqual(QuestionFormType.LINEAR_SCALE, linearScore.type);
        
        Assert.areEqual(5, linearScore.scales.size());

        QuestionFormMultipleChoice multipleChoice = (QuestionFormMultipleChoice) new QuestionFormMultipleChoice()
                                                                                                             .withTitle('Multiple Choice Test 01')
                                                                                                             .withDescription('Multiple Choice Description');
        
        multipleChoice.options.add(new QuestionFormOptions('Desconheço'));
        multipleChoice.options.add(new QuestionFormOptions('Conheço'));
        multipleChoice.options.add(new QuestionFormOptions('Pratico'));
        multipleChoice.options.add(new QuestionFormOptions('Domino'));
        
        forms.questions.add(multipleChoice);
        
        Assert.areEqual(QuestionFormType.MULTIPLE_CHOICE, multipleChoice.type);
        
        Assert.areEqual(4, multipleChoice.options.size());

        QuestionFormMultipleChoiceGrid multipleChoiceGrid = (QuestionFormMultipleChoiceGrid) new QuestionFormMultipleChoiceGrid()
                                                                                                                             .withTitle('Multiple Choice Grid Test 01')
                                                                                                                             .withDescription('Multiple Choice Grid Description');

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
        
        Assert.areEqual(7, forms.questions.size());

        System.debug( forms );

    }

}