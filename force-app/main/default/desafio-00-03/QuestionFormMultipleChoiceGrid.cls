/**
 * @author bruno.moreira
 */
public class QuestionFormMultipleChoiceGrid extends QuestionFormMultipleChoice{

    public List<QuestionFormOptions> rows;
    
    public QuestionFormMultipleChoiceGrid() {

        super (QuestionFormType.MULTIPLE_CHOICE_GRID);
        this.rows = new List<QuestionFormOptions>();

    }

}