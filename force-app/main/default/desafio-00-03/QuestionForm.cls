/**
 * @author bruno.moreira
 */
public class QuestionForm {

    public String title;

    public String description;

    public String code;

    public QuestionFormType type;

    public List<QuestionFormOptions> options;

    public List<QuestionFormScales> scales;
    
    public QuestionForm(QuestionFormType type) {

        this.type = type;
        this.options = new List<QuestionFormOptions>();
        this.scales = new List<QuestionFormScales>();

    }

}