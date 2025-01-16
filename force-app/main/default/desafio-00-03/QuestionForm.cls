/**
 * @author bruno.moreira
 */
public virtual class QuestionForm {

    public String title;

    public String description;

    public QuestionFormType type;

    public List<QuestionFormOptions> options;

    public List<QuestionFormScales> scales;
    
    public QuestionForm(QuestionFormType type) {

        this.type = type;
        this.options = new List<QuestionFormOptions>();
        this.scales = new List<QuestionFormScales>();

    }

}