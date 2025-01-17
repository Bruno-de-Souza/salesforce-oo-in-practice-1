/**
 * @author bruno.moreira
 */
public class QuestionFormLinearScale extends QuestionForm{

    public List<QuestionFormScales> scales;
    
    public QuestionFormLinearScale() {

        super ( QuestionFormType.LINEAR_SCALE );
        this.scales = new List<QuestionFormScales>();

    }

}