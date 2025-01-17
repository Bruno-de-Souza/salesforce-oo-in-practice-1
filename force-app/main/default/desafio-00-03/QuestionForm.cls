/**
 * @author bruno.moreira
 */
public abstract class QuestionForm {

    public String title;

    public String description;

    public QuestionFormType type;
    
    public QuestionForm(QuestionFormType type) {

        this.type = type;
        
    }

    public QuestionForm withTitle(String title) {

        this.title = title;
        return this;

    }

    public QuestionForm withDescription(String description) {

        this.description = description;
        return this;

    }

}