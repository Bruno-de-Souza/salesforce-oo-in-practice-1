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

    public DynamicForm withTitle(String title) {

        this.title = title;
        return this;

    }

    public DynamicForm withDescription(String description) {

        this.description = description;
        return this;

    }

    public DynamicForm withstartDate(Date startDate) {

        this.startDate = startDate;
        return this;

    }

    public DynamicForm withDueDate(Date dueDate) {

        this.dueDate = dueDate;
        return this;

    }

    public DynamicForm addQuestion(QuestionForm question) {

        questions.add(question);
        return this;

    }

}