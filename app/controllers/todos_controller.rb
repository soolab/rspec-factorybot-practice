# frozen_string_literal: true
# TodosController for testing
class TodosController < ApplicationController

  def index
    todos = @current_user.todos
    todos_serialized_list = todos.map { |todo| TodoSerializer.new(todo).serialized_hash }
    json_success(todos_serialized_list)
  end

  def create
    @todo = Todo.create!(create_params.merge(user: @current_user))
    json_create_success(TodoSerializer.new(@todo).serialized_hash)
  end

  def create_params
    params.require(:name)
    params.permit(:name)
  end
end
