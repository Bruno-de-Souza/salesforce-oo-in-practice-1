/**
 * @author bruno.moreira
 */
public class DynamicForm {

    public String title;

    public String description;

    public Date startDate;

    public Date dueDate;

    public  List<QuestionForm> questions;
    
    public DynamicForm() {

        this.questions = new List<QuestionForm>();

    }

}