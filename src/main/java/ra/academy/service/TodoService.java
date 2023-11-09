package ra.academy.service;

import ra.academy.model.Todo;

import java.util.ArrayList;
import java.util.List;

public class TodoService {
    private List<Todo> todoList = new ArrayList<>();
    private  int idMax = 0;
    public List<Todo> findAll(){
        return todoList;
    }

    public  Todo findById(int id){
        for (Todo t :todoList
             ) {
            if (t.getId()==id)
                return t;
        }
        return null;
    }
    public void save(Todo todo){
        if(findById(todo.getId())==null){
            // chưa tồn tại , chức năng thêm mới
            todoList.add(todo);
        }else {
            // chức năng cập nhật
            todoList.set(todoList.indexOf(findById(todo.getId())),todo);
        }
    }

    public void deleteById(int id){
        todoList.remove(findById(id));
    }

    public int getNewId(){
        idMax++;
        return idMax;
    }
}
