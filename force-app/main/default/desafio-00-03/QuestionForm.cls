/**
 * @author bruno.moreira
 */
public class QuestionForm {

    public String title;

    public String description;

    public String code;

    public QuestionFormType type;

    List<QuestionFormOptions> options;

    List<QuestionFormScales> scales;
    
    public QuestionForm(QuestionFormType type) {

        this.type = type;
        this.options = options;
        this.scales = scales;

    }

}