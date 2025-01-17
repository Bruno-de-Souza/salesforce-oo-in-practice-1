/**
 * @author bruno.moreira
 */
public class QuestionFormCode extends QuestionForm{
    
    public String code;

    public QuestionFormCode() {

        super(QuestionFormType.CODE_TEXT);

    }

    public QuestionFormCode withCode(String code) {

        this.code = code;
        return this;

    }

}