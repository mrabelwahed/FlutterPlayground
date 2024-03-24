abstract class TodoStates {}

class InitState extends TodoStates {}

class GetTodos extends TodoStates {}

class InsertTodos extends TodoStates {}

class DeleteTodos extends TodoStates {}

class UpdateTodos extends TodoStates {}

class ChangeCurrentIndex extends TodoStates {}
