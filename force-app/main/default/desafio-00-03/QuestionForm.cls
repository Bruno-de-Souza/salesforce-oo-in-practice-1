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

}