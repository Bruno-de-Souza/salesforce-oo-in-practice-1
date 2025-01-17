/**
 * @author bruno.moreira
 */
public virtual class QuestionFormMultipleChoice extends QuestionForm{
    
    public List<QuestionFormOptions> options;
    
    public QuestionFormMultipleChoice() {

        this(QuestionFormType.MULTIPLE_CHOICE);

    }

    public QuestionFormMultipleChoice(QuestionFormType type) {

        super(type);
        this.options = new List<QuestionFormOptions>();

    }

}